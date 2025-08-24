package pe.cibertec.musikastudioapi.application.catalogo.usecase;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.cibertec.musikastudioapi.domain.catalogo.service.InstrumentoService;
import pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.entity.InstrumentoEntity;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ListarInstrumentosUseCase {

    private final InstrumentoService instrumentoService;

    @Transactional(readOnly = true)
    public List<InstrumentoEntity> execute() {
        return instrumentoService.listar();
    }
}
