package pe.cibertec.musikastudioapi.presentation.seguridad.dto;

import jakarta.validation.constraints.NotBlank;

public record RefreshRequest(
        @NotBlank String refreshToken
) {}
