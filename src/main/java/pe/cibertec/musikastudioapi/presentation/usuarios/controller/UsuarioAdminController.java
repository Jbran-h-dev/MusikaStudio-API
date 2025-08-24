package pe.cibertec.musikastudioapi.presentation.usuarios.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import pe.cibertec.musikastudioapi.domain.seguridad.service.UsuarioAdminService;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
@RequiredArgsConstructor
public class UsuarioAdminController {

    private final UsuarioAdminService usuarioAdminService;

    // Listar usuarios (ADMIN)
    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<UsuarioAdminService.UsuarioSummary>> listarUsuarios() {
        return ResponseEntity.ok(usuarioAdminService.listar());
    }

    // Obtener usuario por id (ADMIN)
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<UsuarioAdminService.UsuarioSummary> obtenerUsuario(@PathVariable Long id) {
        return ResponseEntity.ok(usuarioAdminService.obtener(id));
    }

    // Cambiar rol de un usuario (ADMIN)
    @PutMapping("/{id}/rol/{roleId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> cambiarRol(@PathVariable Long id, @PathVariable Integer roleId) {
        String auditor = currentUsername();
        usuarioAdminService.cambiarRol(id, roleId, auditor);
        return ResponseEntity.noContent().build();
    }

    // Eliminar un usuario (ADMIN)
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> eliminarUsuario(@PathVariable Long id) {
        usuarioAdminService.eliminar(id);
        return ResponseEntity.noContent().build();
    }

    private String currentUsername() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && auth.getName() != null) {
            return auth.getName();
        }
        return "system";
    }
}
