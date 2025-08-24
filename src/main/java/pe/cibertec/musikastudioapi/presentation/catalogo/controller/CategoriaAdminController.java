package pe.cibertec.musikastudioapi.presentation.catalogo.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.CategoriaCreateUpdateRequest;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.CategoriaDto;
import pe.cibertec.musikastudioapi.application.catalogo.service.CategoriaAdminService;

@RestController
@RequestMapping("/admin/categorias")
@RequiredArgsConstructor
public class CategoriaAdminController {

    private final CategoriaAdminService categoriaAdminService;

    @PostMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> crear(@Valid @RequestBody CategoriaCreateUpdateRequest request) {
        CategoriaDto dto = categoriaAdminService.crear(request.getNombre(), request.getDescripcion());
        return ResponseEntity.status(201).body(dto);
    }

    @PutMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> actualizar(@PathVariable Integer id,
                                        @Valid @RequestBody CategoriaCreateUpdateRequest request) {
        return categoriaAdminService.actualizar(id, request.getNombre(), request.getDescripcion(), request.getActivo())
                .<ResponseEntity<?>>map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> eliminar(@PathVariable Integer id) {
        boolean ok = categoriaAdminService.eliminar(id);
        return ok ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }

    @PatchMapping("/{id}/activar")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<?> activar(@PathVariable Integer id) {
        boolean ok = categoriaAdminService.activar(id);
        return ok ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }
}
