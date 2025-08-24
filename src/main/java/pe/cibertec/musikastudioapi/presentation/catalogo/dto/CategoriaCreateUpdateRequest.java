package pe.cibertec.musikastudioapi.presentation.catalogo.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class CategoriaCreateUpdateRequest {

    @NotBlank
    @Size(max = 100)
    private String nombre;

    @Size(max = 1000)
    private String descripcion;

    // Opcional para update
    private Boolean activo;
}
