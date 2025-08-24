package pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.cibertec.musikastudio.infrastructure.persistence.catalogo.entity.InstrumentoEntity;

public interface InstrumentoRepository extends JpaRepository<InstrumentoEntity, Long> {
}
