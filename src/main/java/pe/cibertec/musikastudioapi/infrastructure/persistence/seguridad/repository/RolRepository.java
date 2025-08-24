package pe.cibertec.musikastudioapi.infrastructure.persistence.seguridad.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pe.cibertec.musikastudioapi.infrastructure.persistence.seguridad.entity.RolEntity;

import java.util.Optional;

public interface RolRepository extends JpaRepository<RolEntity, Long> {
    Optional<RolEntity> findByNombreIgnoreCase(String nombre);
}
