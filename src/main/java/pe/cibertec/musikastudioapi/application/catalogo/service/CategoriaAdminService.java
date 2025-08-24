package pe.cibertec.musikastudioapi.application.catalogo.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;
import pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.entity.CategoriaEntity;
import pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.repository.CategoriaRepository;
import pe.cibertec.musikastudioapi.presentation.catalogo.dto.CategoriaDto;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CategoriaAdminService {

    private final CategoriaRepository categoriaRepository;

    @Transactional
    public CategoriaDto crear(String nombre, String descripcion) {
        if (categoriaRepository.existsByNombreIgnoreCase(nombre)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "La categoría ya existe");
        }
        CategoriaEntity entity = new CategoriaEntity();
        entity.setNombre(nombre);
        entity.setDescripcion(descripcion);
        entity.setActivo(true);
        CategoriaEntity saved = categoriaRepository.save(entity);
        return toDto(saved);
    }

    @Transactional
    public Optional<CategoriaDto> actualizar(Integer id, String nombre, String descripcion, Boolean activo) {
        return categoriaRepository.findById(id).map(entity -> {
            if (!entity.getNombre().equalsIgnoreCase(nombre) && categoriaRepository.existsByNombreIgnoreCase(nombre)) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "La categoría ya existe");
            }
            entity.setNombre(nombre);
            entity.setDescripcion(descripcion);
            if (activo != null) {
                entity.setActivo(activo);
            }
            CategoriaEntity saved = categoriaRepository.save(entity);
            return toDto(saved);
        });
    }

    @Transactional
    public boolean eliminar(Integer id) {
        return categoriaRepository.findById(id).map(entity -> {
            entity.setActivo(false);
            categoriaRepository.save(entity);
            return true;
        }).orElse(false);
    }

    @Transactional
    public boolean activar(Integer id) {
        return categoriaRepository.findById(id).map(entity -> {
            entity.setActivo(true);
            categoriaRepository.save(entity);
            return true;
        }).orElse(false);
    }

    public Optional<CategoriaDto> obtenerPorId(Integer id) {
        return categoriaRepository.findById(id).map(this::toDto);
    }

    private CategoriaDto toDto(CategoriaEntity e) {
        return new CategoriaDto(
                e.getId(),
                e.getNombre(),
                e.getDescripcion(),
                e.getActivo()
        );
    }
}
