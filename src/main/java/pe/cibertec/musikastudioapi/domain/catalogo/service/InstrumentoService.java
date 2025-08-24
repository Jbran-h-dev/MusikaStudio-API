package pe.cibertec.musikastudioapi.domain.catalogo.service;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.cibertec.musikastudio.infrastructure.persistence.catalogo.entity.InstrumentoEntity;
import pe.cibertec.musikastudio.infrastructure.persistence.catalogo.repository.InstrumentoRepository;
import pe.cibertec.musikastudio.presentation.catalogo.dto.InstrumentoCreateUpdateRequest;
import pe.cibertec.musikastudio.presentation.catalogo.dto.InstrumentoDto;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InstrumentoService {

    private final InstrumentoRepository instrumentoRepository;

    @Transactional(readOnly = true)
    public List<InstrumentoEntity> listar() {
        return instrumentoRepository.findAll();
    }

    @Transactional(readOnly = true)
    public InstrumentoEntity obtener(Long id) {
        return instrumentoRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Instrumento no encontrado"));
    }

    @Transactional
    public InstrumentoDto crear(InstrumentoCreateUpdateRequest req) {
        InstrumentoEntity e = new InstrumentoEntity();
        apply(e, req);
        e.setActivo(true);
        var saved = instrumentoRepository.save(e);
        return toDto(saved);
    }

    @Transactional
    public InstrumentoDto actualizar(Long id, InstrumentoCreateUpdateRequest req) {
        InstrumentoEntity e = obtener(id);
        apply(e, req);
        var saved = instrumentoRepository.save(e);
        return toDto(saved);
    }

    @Transactional
    public void eliminar(Long id) {
        InstrumentoEntity e = obtener(id);
        e.setActivo(false);
        instrumentoRepository.save(e);
    }

    private void apply(InstrumentoEntity e, InstrumentoCreateUpdateRequest r) {
        e.setCodigo(r.codigo());
        e.setNombre(r.nombre());
        e.setDescripcion(r.descripcion());
        e.setPrecio(r.precio());
        e.setStock(r.stock());
        e.setStockMinimo(r.stockMinimo());
        e.setUrlImagen(r.urlImagen());
        e.setIdCategoria(r.idCategoria());
        e.setIdMarca(r.idMarca());
        if (r.activo() != null) {
            e.setActivo(r.activo());
        }
    }

    private InstrumentoDto toDto(InstrumentoEntity e) {
        return new InstrumentoDto(
                e.getId(),
                e.getCodigo(),
                e.getNombre(),
                e.getDescripcion(),
                e.getPrecio(),
                e.getStock(),
                e.getStockMinimo(),
                e.getUrlImagen(),
                e.getActivo(),
                e.getIdCategoria(),
                e.getIdMarca()
        );
    }
}
