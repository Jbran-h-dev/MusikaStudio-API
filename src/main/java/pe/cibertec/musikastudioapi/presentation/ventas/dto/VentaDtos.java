package pe.cibertec.musikastudioapi.presentation.ventas.dto;

import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDate;

public class VentaDtos {

    public record VentaDto(
            Long id,
            Long idUsuario,
            Integer idMetodoPago,
            LocalDate fechaVenta,
            BigDecimal precioTotal,
            BigDecimal impuesto,
            BigDecimal descuento,
            Boolean confirmada,
            String numeroFactura,
            String observaciones
    ) {}

    public record CrearVentaRequest(
            @NotNull Integer idMetodoPago,
            @NotNull BigDecimal precioTotal,
            BigDecimal impuesto,
            BigDecimal descuento,
            Boolean confirmada,
            String numeroFactura,
            String observaciones
    ) {}

    public record ActualizarVentaRequest(
            @NotNull Integer idMetodoPago,
            @NotNull BigDecimal precioTotal,
            BigDecimal impuesto,
            BigDecimal descuento,
            Boolean confirmada,
            String numeroFactura,
            String observaciones
    ) {}
}
