package pe.cibertec.musikastudioapi.presentation.seguridad.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record RegisterRequest(
        @NotBlank @Size(max = 50) String username,
        @NotBlank @Email @Size(max = 100) String email,
        @NotBlank String password,
        @NotBlank @Size(max = 100) String nombre,
        @NotBlank @Size(max = 100) String apellido,
        @Size(max = 15) String telefono,
        @Size(max = 255) String direccion,
        @Size(max = 20) String numeroDocumento,
        Integer idTipoDocumento,
        Integer roleId,
        @NotBlank String usuarioAuditoria
) {}
