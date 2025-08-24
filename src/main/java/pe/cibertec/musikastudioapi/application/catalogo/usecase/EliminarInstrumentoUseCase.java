package pe.cibertec.musikastudioapi.application.catalogo.usecase;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.cibertec.musikastudioapi.domain.catalogo.service.InstrumentoService;

@Service
@RequiredArgsConstructor
public class EliminarInstrumentoUseCase {

    private final InstrumentoService instrumentoService;

    @Transactional
    public void execute(Long id) {
        instrumentoService.eliminar(id);
    }
}
