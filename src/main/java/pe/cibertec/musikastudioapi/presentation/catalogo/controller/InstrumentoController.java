package pe.cibertec.musikastudioapi.presentation.catalogo.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import pe.cibertec.musikastudioapi.application.catalogo.usecase.ActualizarInstrumentoUseCase;
import pe.cibertec.musikastudioapi.application.catalogo.usecase.CrearInstrumentoUseCase;
import pe.cibertec.musikastudioapi.application.catalogo.usecase.EliminarInstrumentoUseCase;
import pe.cibertec.musikastudioapi.application.catalogo.usecase.ListarInstrumentosUseCase;
import pe.cibertec.musikastudioapi.application.catalogo.usecase.ObtenerInstrumentoUseCase;
import pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.entity.InstrumentoEntity;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.InstrumentoCreateUpdateRequest;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.InstrumentoDto;

import java.util.List;

@RestController
@RequestMapping("/instrumentos")
@RequiredArgsConstructor
public class InstrumentoController {

    private final ListarInstrumentosUseCase listarInstrumentosUseCase;
    private final ObtenerInstrumentoUseCase obtenerInstrumentoUseCase;
    private final CrearInstrumentoUseCase crearInstrumentoUseCase;
    private final ActualizarInstrumentoUseCase actualizarInstrumentoUseCase;
    private final EliminarInstrumentoUseCase eliminarInstrumentoUseCase;

    @GetMapping
    @PreAuthorize("permitAll()")
    public ResponseEntity<List<InstrumentoEntity>> listar() {
        return ResponseEntity.ok(listarInstrumentosUseCase.execute());
    }

    @GetMapping("/{id}")
    @PreAuthorize("permitAll()")
    public ResponseEntity<InstrumentoEntity> obtener(@PathVariable Long id) {
        try {
            return ResponseEntity.ok(obtenerInstrumentoUseCase.execute(id));
        } catch (jakarta.persistence.EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<InstrumentoDto> crear(@Valid @RequestBody InstrumentoCreateUpdateRequest request) {
        return ResponseEntity.ok(crearInstrumentoUseCase.execute(request));
    }

    @PutMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<InstrumentoDto> actualizar(@PathVariable Long id,
                                                     @Valid @RequestBody InstrumentoCreateUpdateRequest request) {
        return ResponseEntity.ok(actualizarInstrumentoUseCase.execute(id, request));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<Void> eliminar(@PathVariable Long id) {
        eliminarInstrumentoUseCase.execute(id);
        return ResponseEntity.noContent().build();
    }
}
