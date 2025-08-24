package pe.cibertec.musikastudioapi.infrastructure.persistence.seguridad.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import pe.cibertec.musikastudioapi.infrastructure.persistence.seguridad.entity.UsuarioEntity;

import java.util.Optional;

public interface UsuarioRepository extends JpaRepository<UsuarioEntity, Long> {

    @EntityGraph(attributePaths = {"roles"})
    Optional<UsuarioEntity> findByUsernameAndActivoTrue(String username);
}
