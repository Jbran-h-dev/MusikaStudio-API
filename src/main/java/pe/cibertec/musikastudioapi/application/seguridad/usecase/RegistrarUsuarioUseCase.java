package pe.cibertec.musikastudioapi.application.seguridad.usecase;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pe.cibertec.musikastudio.domain.seguridad.service.AuthRegistrationService;
import pe.cibertec.musikastudio.presentation.seguridad.dto.AuthResponse;
import pe.cibertec.musikastudio.presentation.seguridad.dto.RegisterRequest;

@Service
@RequiredArgsConstructor
public class RegistrarUsuarioUseCase {

    private final AuthRegistrationService registrationService;

    public AuthResponse execute(RegisterRequest request) {
        var result = registrationService.register(request);
        return AuthResponse.bearer(result.accessToken(), result.refreshToken());
    }
}
