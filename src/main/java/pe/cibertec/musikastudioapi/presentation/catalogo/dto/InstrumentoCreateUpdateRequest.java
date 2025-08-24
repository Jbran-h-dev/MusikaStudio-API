package pe.cibertec.musikastudioapi.presentation.catalogo.dto;

import jakarta.validation.constraints.*;
import java.math.BigDecimal;

public record InstrumentoCreateUpdateRequest(
        @NotBlank String codigo,
        @NotBlank String nombre,
        String descripcion,
        @NotNull @DecimalMin(value = "0.0", inclusive = true) BigDecimal precio,
        @NotNull @Min(0) Integer stock,
        @NotNull @Min(0) Integer stockMinimo,
        @Size(max = 500) String urlImagen,
        @NotNull Integer idCategoria,
        @NotNull Integer idMarca,
        Boolean activo
) {}
