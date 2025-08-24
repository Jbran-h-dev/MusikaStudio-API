package pe.cibertec.musikastudioapi.domain.ventas.service;

import lombok.RequiredArgsConstructor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import pe.cibertec.musikastudio.presentation.ventas.dto.VentaDtos;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class VentaService {

    private final JdbcTemplate jdbcTemplate;

    private static class VentaMapper implements RowMapper<VentaDtos.VentaDto> {
        @Override
        public VentaDtos.VentaDto mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new VentaDtos.VentaDto(
                    rs.getLong("id"),
                    rs.getLong("id_usuario"),
                    rs.getInt("id_metodo_pago"),
                    rs.getObject("fecha_venta", LocalDate.class),
                    rs.getBigDecimal("precio_total"),
                    rs.getBigDecimal("impuesto"),
                    rs.getBigDecimal("descuento"),
                    rs.getBoolean("confirmada"),
                    rs.getString("numero_factura"),
                    rs.getString("observaciones")
            );
        }
    }

    private Long findUserIdByUsername(String username) {
        try {
            return jdbcTemplate.queryForObject(
                    "SELECT id FROM usuarios WHERE username = ?",
                    Long.class,
                    username
            );
        } catch (EmptyResultDataAccessException ex) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Usuario autenticado no válido");
        }
    }

    public List<VentaDtos.VentaDto> listar() {
        return jdbcTemplate.query("SELECT * FROM ventas ORDER BY id DESC", new VentaMapper());
    }

    public VentaDtos.VentaDto obtener(Long id) {
        try {
            return jdbcTemplate.queryForObject("SELECT * FROM ventas WHERE id = ?", new VentaMapper(), id);
        } catch (EmptyResultDataAccessException ex) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Venta no encontrada");
        }
    }

    public List<VentaDtos.VentaDto> listarPorUsuario(String username) {
        Long userId = findUserIdByUsername(username);
        return jdbcTemplate.query("SELECT * FROM ventas WHERE id_usuario = ? ORDER BY id DESC", new VentaMapper(), userId);
    }

    @Transactional
    public VentaDtos.VentaDto crear(String username, VentaDtos.CrearVentaRequest req) {
        Long userId = findUserIdByUsername(username);
        BigDecimal impuesto = req.impuesto() != null ? req.impuesto() : BigDecimal.ZERO;
        BigDecimal descuento = req.descuento() != null ? req.descuento() : BigDecimal.ZERO;
        Boolean confirmada = req.confirmada() != null ? req.confirmada() : Boolean.FALSE;
        jdbcTemplate.update(
                "INSERT INTO ventas (id_usuario, id_metodo_pago, precio_total, impuesto, descuento, confirmada, numero_factura, observaciones, usuario_creacion, usuario_actualizacion) " +
                        "VALUES (?,?,?,?,?,?,?,?,?,?)",
                userId, req.idMetodoPago(), req.precioTotal(), impuesto, descuento, confirmada, req.numeroFactura(), req.observaciones(), username, username
        );
        Long id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Long.class);
        return obtener(id);
    }

    @Transactional
    public VentaDtos.VentaDto actualizar(String username, Long id, VentaDtos.ActualizarVentaRequest req) {
        BigDecimal impuesto = req.impuesto() != null ? req.impuesto() : BigDecimal.ZERO;
        BigDecimal descuento = req.descuento() != null ? req.descuento() : BigDecimal.ZERO;
        Boolean confirmada = req.confirmada() != null ? req.confirmada() : Boolean.FALSE;
        int up = jdbcTemplate.update(
                "UPDATE ventas SET id_metodo_pago = ?, precio_total = ?, impuesto = ?, descuento = ?, confirmada = ?, numero_factura = ?, observaciones = ?, usuario_actualizacion = ? WHERE id = ?",
                req.idMetodoPago(), req.precioTotal(), impuesto, descuento, confirmada, req.numeroFactura(), req.observaciones(), username, id
        );
        if (up == 0) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Venta no encontrada");
        }
        return obtener(id);
    }

    @Transactional
    public void cancelar(String username, Long id) {
        int up = jdbcTemplate.update(
                "UPDATE ventas SET confirmada = false, usuario_actualizacion = ? WHERE id = ?",
                username, id
        );
        if (up == 0) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Venta no encontrada");
        }
    }
}
