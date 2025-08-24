package pe.cibertec.musikastudioapi.presentation.catalogo.dto;

public record CategoriaDto(
        Integer id,
        String nombre,
        String descripcion,
        Boolean activo
) {}
