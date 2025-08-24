package pe.cibertec.musikastudioapi.presentation.seguridad.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.cibertec.musikastudioapi.application.seguridad.usecase.AutenticarUsuarioUseCase;
import pe.cibertec.musikastudioapi.application.seguridad.usecase.RefrescarTokenUseCase;
import pe.cibertec.musikastudioapi.application.seguridad.usecase.RegistrarUsuarioUseCase;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.AuthResponse;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.LoginRequest;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.RefreshRequest;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.RegisterRequest;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AutenticarUsuarioUseCase autenticarUsuarioUseCase;
    private final RefrescarTokenUseCase refrescarTokenUseCase;
    private final RegistrarUsuarioUseCase registrarUsuarioUseCase;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest request) {
        return ResponseEntity.ok(autenticarUsuarioUseCase.execute(request));
    }

    @PostMapping("/refresh")
    public ResponseEntity<AuthResponse> refresh(@Valid @RequestBody RefreshRequest request) {
        return ResponseEntity.ok(refrescarTokenUseCase.execute(request));
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest request) {
        return ResponseEntity.ok(registrarUsuarioUseCase.execute(request));
    }
}
