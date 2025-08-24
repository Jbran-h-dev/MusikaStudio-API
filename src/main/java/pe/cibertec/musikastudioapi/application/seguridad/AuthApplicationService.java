package pe.cibertec.musikastudioapi.application.seguridad;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import pe.cibertec.musikastudioapi.domain.seguridad.service.AuthRegistrationService;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.AuthResponse;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.LoginRequest;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.RefreshRequest;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.RegisterRequest;
import pe.cibertec.musikastudioapi.infrastructure.security.TokenService;

@Service
@RequiredArgsConstructor
public class AuthApplicationService {

    private final AuthenticationManager authenticationManager;
    private final TokenService tokenService;
    private final UserDetailsService userDetailsService;
    private final AuthRegistrationService registrationService;

    public AuthResponse login(@Valid LoginRequest request) {
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.username(), request.password())
        );
        UserDetails user = (UserDetails) auth.getPrincipal();
        String access = tokenService.generateAccessToken(user);
        String refresh = tokenService.generateRefreshToken(user);
        return AuthResponse.bearer(access, refresh);
    }

    public AuthResponse refresh(@Valid RefreshRequest request) {
        String username = tokenService.extractUsername(request.refreshToken());
        UserDetails user = userDetailsService.loadUserByUsername(username);
        String newAccess = tokenService.generateAccessToken(user);
        return AuthResponse.bearer(newAccess, request.refreshToken());
    }

    public AuthResponse register(@Valid RegisterRequest request) {
        var result = registrationService.register(request);
        return AuthResponse.bearer(result.accessToken(), result.refreshToken());
    }
}
