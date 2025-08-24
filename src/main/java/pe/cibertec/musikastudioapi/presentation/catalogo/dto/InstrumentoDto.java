package pe.cibertec.musikastudioapi.presentation.catalogo.dto;

import java.math.BigDecimal;

public record InstrumentoDto(
        Long id,
        String codigo,
        String nombre,
        String descripcion,
        BigDecimal precio,
        Integer stock,
        Integer stockMinimo,
        String urlImagen,
        Boolean activo,
        Integer idCategoria,
        Integer idMarca
) {}
