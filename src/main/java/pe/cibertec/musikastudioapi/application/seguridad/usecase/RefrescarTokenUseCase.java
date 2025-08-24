package pe.cibertec.musikastudioapi.application.seguridad.usecase;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.AuthResponse;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.RefreshRequest;
import pe.cibertec.musikastudioapi.infrastructure.security.TokenService;

@Service
@RequiredArgsConstructor
public class RefrescarTokenUseCase {

    private final TokenService tokenService;
    private final UserDetailsService userDetailsService;

    public AuthResponse execute(RefreshRequest request) {
        String username = tokenService.extractUsername(request.refreshToken());
        UserDetails user = userDetailsService.loadUserByUsername(username);
        String newAccess = tokenService.generateAccessToken(user);
        return AuthResponse.bearer(newAccess, request.refreshToken());
    }
}
