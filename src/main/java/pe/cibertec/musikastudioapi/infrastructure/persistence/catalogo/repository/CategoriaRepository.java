package pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.cibertec.musikastudio.infrastructure.persistence.catalogo.entity.CategoriaEntity;

import java.util.Optional;

@Repository
public interface CategoriaRepository extends JpaRepository<CategoriaEntity, Integer> {
    boolean existsByNombreIgnoreCase(String nombre);
    Optional<CategoriaEntity> findByNombreIgnoreCase(String nombre);
}
