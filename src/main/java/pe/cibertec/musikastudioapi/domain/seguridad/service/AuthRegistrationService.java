package pe.cibertec.musikastudioapi.domain.seguridad.service;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.RegisterRequest;
import pe.cibertec.musikastudioapi.infrastructure.security.TokenService;

@Service
@RequiredArgsConstructor
public class AuthRegistrationService {

    private final JdbcTemplate jdbcTemplate;
    private final PasswordEncoder passwordEncoder;
    private final UserDetailsService userDetailsService;
    private final TokenService tokenService;

    @Transactional
    public RegistrationResult register(RegisterRequest req) {
        // Pre-check duplicados para retornar 409 con mensaje claro
        Integer existsUsername = jdbcTemplate.queryForObject(
                "SELECT COUNT(1) FROM usuarios WHERE username = ?",
                Integer.class,
                req.username()
        );
        if (existsUsername != null && existsUsername > 0) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "El nombre de usuario ya está en uso");
        }

        Integer existsEmail = jdbcTemplate.queryForObject(
                "SELECT COUNT(1) FROM usuarios WHERE email = ?",
                Integer.class,
                req.email()
        );
        if (existsEmail != null && existsEmail > 0) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "El correo electrónico ya está en uso");
        }

        String hash = passwordEncoder.encode(req.password());

        // Rol por defecto: CLIENTE si no se provee roleId
        Integer roleId = req.roleId();
        if (roleId == null) {
            roleId = jdbcTemplate.queryForObject(
                    "SELECT id FROM roles WHERE UPPER(nombre) = 'CLIENTE' LIMIT 1",
                    Integer.class
            );
            if (roleId == null) {
                throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "No se encontró el rol CLIENTE por defecto");
            }
        }
        // CALL sp_crear_usuario(..., p_role_id)
        jdbcTemplate.update(
                "CALL sp_crear_usuario(?,?,?,?,?,?,?,?,?,?,?)",
                req.username(),
                req.email(),
                hash,
                req.nombre(),
                req.apellido(),
                req.telefono(),
                req.direccion(),
                req.numeroDocumento(),
                req.idTipoDocumento(),
                req.usuarioAuditoria(),
                roleId
        );

        // Cargar usuario para emitir tokens
        UserDetails user = userDetailsService.loadUserByUsername(req.username());
        String access = tokenService.generateAccessToken(user);
        String refresh = tokenService.generateRefreshToken(user);
        return new RegistrationResult(access, refresh);
    }

    

    public record RegistrationResult(String accessToken, String refreshToken) {}
}
