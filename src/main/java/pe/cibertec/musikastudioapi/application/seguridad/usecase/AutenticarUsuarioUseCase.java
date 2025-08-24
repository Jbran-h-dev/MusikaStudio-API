package pe.cibertec.musikastudioapi.application.seguridad.usecase;

import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.AuthResponse;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.LoginRequest;
import pe.cibertec.musikastudioapi.infrastructure.security.TokenService;

@Service
@RequiredArgsConstructor
public class AutenticarUsuarioUseCase {

    private final AuthenticationManager authenticationManager;
    private final TokenService tokenService;

    public AuthResponse execute(LoginRequest request) {
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.username(), request.password())
        );
        UserDetails user = (UserDetails) auth.getPrincipal();
        String access = tokenService.generateAccessToken(user);
        String refresh = tokenService.generateRefreshToken(user);
        return AuthResponse.bearer(access, refresh);
    }
}
