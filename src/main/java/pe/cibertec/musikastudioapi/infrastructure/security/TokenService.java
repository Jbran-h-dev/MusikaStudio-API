package pe.cibertec.musikastudioapi.infrastructure.security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import pe.cibertec.musikastudioapi.infrastructure.configuration.seguridad.JwtProperties;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class TokenService {

    private final JwtProperties props;
    private final SecretKey key;

    public TokenService(JwtProperties props) {
        this.props = props;
        this.key = Keys.hmacShaKeyFor(props.secret().getBytes(StandardCharsets.UTF_8));
    }

    public String generateAccessToken(UserDetails user) {
        Map<String, Object> claims = rolesClaim(user);
        return buildToken(user.getUsername(), props.accessTokenExpiration(), claims);
    }

    public String generateRefreshToken(UserDetails user) {
        Map<String, Object> claims = rolesClaim(user);
        return buildToken(user.getUsername(), props.refreshTokenExpiration(), claims);
    }

    private Map<String, Object> rolesClaim(UserDetails user) {
        List<String> roles = user.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.toList());
        return Map.of("roles", roles);
    }

    private String buildToken(String subject, long ttlMillis, Map<String, Object> claims) {
        Instant now = Instant.now();
        return Jwts.builder()
                .subject(subject)
                .issuedAt(Date.from(now))
                .expiration(Date.from(now.plusMillis(ttlMillis)))
                .claims(claims)
                .signWith(key)
                .compact();
    }

    public String extractUsername(String token) {
        return Jwts.parser().verifyWith(key).build()
                .parseSignedClaims(token)
                .getPayload()
                .getSubject();
    }

    public boolean isTokenValid(String token, UserDetails user) {
        try {
            var claims = Jwts.parser().verifyWith(key).build().parseSignedClaims(token).getPayload();
            String subject = claims.getSubject();
            Date exp = claims.getExpiration();
            return subject.equals(user.getUsername()) && exp.after(new Date());
        } catch (Exception e) {
            return false;
        }
    }
}
