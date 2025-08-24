package pe.cibertec.musikastudioapi.presentation.seguridad.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.cibertec.musikastudioapi.application.seguridad.usecase.RegistrarUsuarioUseCase;
import pe.cibertec.musikastudioapi.infrastructure.persistence.seguridad.repository.RolRepository;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.AdminCreateUserRequest;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.AuthResponse;
import pe.cibertec.musikastudioapi.presentation.seguridad.dto.RegisterRequest;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;

@RestController
@RequestMapping("/admin/users")
@RequiredArgsConstructor
public class AdminUserController {

    private final RegistrarUsuarioUseCase registrarUsuarioUseCase;
    private final RolRepository rolRepository;

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<AuthResponse> createUser(@Valid @RequestBody AdminCreateUserRequest req) {
        var rol = rolRepository.findByNombreIgnoreCase(req.roleName())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "Rol no válido: " + req.roleName()));

        Integer roleId = Math.toIntExact(rol.getId());

        RegisterRequest register = new RegisterRequest(
                req.username(),
                req.email(),
                req.password(),
                req.nombre(),
                req.apellido(),
                req.telefono(),
                req.direccion(),
                req.numeroDocumento(),
                req.idTipoDocumento(),
                roleId,
                req.usuarioAuditoria()
        );

        return ResponseEntity.status(HttpStatus.CREATED).body(
                registrarUsuarioUseCase.execute(register)
        );
    }
}
