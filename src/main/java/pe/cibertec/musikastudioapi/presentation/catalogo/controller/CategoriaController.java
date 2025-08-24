package pe.cibertec.musikastudioapi.presentation.catalogo.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pe.cibertec.musikastudio.application.catalogo.service.CategoriaQueryService;
import pe.cibertec.musikastudio.presentation.catalogo.dto.CategoriaDto;

import java.util.List;

@RestController
@RequestMapping("/categorias")
@RequiredArgsConstructor
public class CategoriaController {

    private final CategoriaQueryService categoriaQueryService;

    @GetMapping
    @PreAuthorize("permitAll()")
    public ResponseEntity<List<CategoriaDto>> listar() {
        return ResponseEntity.ok(categoriaQueryService.listar());
    }

    @GetMapping("/{id}")
    @PreAuthorize("permitAll()")
    public ResponseEntity<CategoriaDto> obtener(@PathVariable Integer id) {
        return categoriaQueryService.obtener(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
}
