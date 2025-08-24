package pe.cibertec.musikastudioapi.application.catalogo.usecase;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.cibertec.musikastudioapi.domain.catalogo.service.InstrumentoService;
import pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.entity.InstrumentoEntity;

@Service
@RequiredArgsConstructor
public class ObtenerInstrumentoUseCase {

    private final InstrumentoService instrumentoService;

    @Transactional(readOnly = true)
    public InstrumentoEntity execute(Long id) {
        return instrumentoService.obtener(id);
    }
}
