package pe.cibertec.musikastudioapi.application.catalogo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.cibertec.musikastudioapi.domain.catalogo.service.InstrumentoService;
import pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.entity.InstrumentoEntity;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.InstrumentoCreateUpdateRequest;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.InstrumentoDto;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InstrumentoApplicationService {

    private final InstrumentoService instrumentoService;

    @Transactional(readOnly = true)
    public List<InstrumentoEntity> listar() {
        return instrumentoService.listar();
    }

    @Transactional(readOnly = true)
    public InstrumentoEntity obtener(Long id) {
        return instrumentoService.obtener(id);
    }

    @Transactional
    public InstrumentoDto crear(InstrumentoCreateUpdateRequest req) {
        return instrumentoService.crear(req);
    }

    @Transactional
    public InstrumentoDto actualizar(Long id, InstrumentoCreateUpdateRequest req) {
        return instrumentoService.actualizar(id, req);
    }

    @Transactional
    public void eliminar(Long id) {
        instrumentoService.eliminar(id);
    }
}
