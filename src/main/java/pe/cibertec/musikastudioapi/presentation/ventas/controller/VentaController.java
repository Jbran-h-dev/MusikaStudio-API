package pe.cibertec.musikastudioapi.presentation.ventas.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import pe.cibertec.musikastudio.domain.ventas.service.VentaService;
import pe.cibertec.musikastudio.presentation.ventas.dto.VentaDtos;

import java.util.List;

@RestController
@RequestMapping("/ventas")
@RequiredArgsConstructor
public class VentaController {

    private final VentaService ventaService;

    // Crear una venta (ADMIN, VENDEDOR)
    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN','VENDEDOR')")
    public ResponseEntity<VentaDtos.VentaDto> crearVenta(@Valid @RequestBody VentaDtos.CrearVentaRequest request) {
        String username = currentUsername();
        return ResponseEntity.ok(ventaService.crear(username, request));
    }

    // Actualizar una venta (ADMIN, VENDEDOR)
    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','VENDEDOR')")
    public ResponseEntity<VentaDtos.VentaDto> actualizarVenta(@PathVariable Long id,
                                                              @Valid @RequestBody VentaDtos.ActualizarVentaRequest request) {
        String username = currentUsername();
        return ResponseEntity.ok(ventaService.actualizar(username, id, request));
    }

    // Cancelar una venta (ADMIN, VENDEDOR)
    @PostMapping("/{id}/cancelar")
    @PreAuthorize("hasAnyRole('ADMIN','VENDEDOR')")
    public ResponseEntity<Void> cancelarVenta(@PathVariable Long id) {
        String username = currentUsername();
        ventaService.cancelar(username, id);
        return ResponseEntity.noContent().build();
    }

    // Listar todas las ventas (ADMIN, VENDEDOR)
    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN','VENDEDOR')")
    public ResponseEntity<List<VentaDtos.VentaDto>> listarVentas() {
        return ResponseEntity.ok(ventaService.listar());
    }

    // Obtener una venta por id (ADMIN, VENDEDOR)
    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','VENDEDOR')")
    public ResponseEntity<VentaDtos.VentaDto> obtenerVenta(@PathVariable Long id) {
        return ResponseEntity.ok(ventaService.obtener(id));
    }

    // Listar ventas del cliente autenticado (CLIENTE)
    @GetMapping("/mias")
    @PreAuthorize("hasRole('CLIENTE')")
    public ResponseEntity<List<VentaDtos.VentaDto>> listarMisVentas() {
        String username = currentUsername();
        return ResponseEntity.ok(ventaService.listarPorUsuario(username));
    }

    private String currentUsername() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && auth.getName() != null) {
            return auth.getName();
        }
        return "system";
    }
}
