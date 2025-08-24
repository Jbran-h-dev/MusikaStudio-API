package pe.cibertec.musikastudioapi.application.catalogo.usecase;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.cibertec.musikastudioapi.domain.catalogo.service.InstrumentoService;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.InstrumentoCreateUpdateRequest;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.InstrumentoDto;

@Service
@RequiredArgsConstructor
public class CrearInstrumentoUseCase {

    private final InstrumentoService instrumentoService;

    @Transactional
    public InstrumentoDto execute(InstrumentoCreateUpdateRequest req) {
        return instrumentoService.crear(req);
    }
}
