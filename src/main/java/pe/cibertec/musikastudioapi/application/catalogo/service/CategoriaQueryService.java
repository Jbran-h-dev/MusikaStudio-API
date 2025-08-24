package pe.cibertec.musikastudioapi.application.catalogo.service;

import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import pe.cibertec.musikastudio.presentation.catalogo.dto.CategoriaDto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CategoriaQueryService {

    private final JdbcTemplate jdbcTemplate;

    private static final RowMapper<CategoriaDto> CATEGORIA_ROW_MAPPER = new RowMapper<>() {
        @Override
        public CategoriaDto mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new CategoriaDto(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("descripcion"),
                    rs.getBoolean("activo")
            );
        }
    };

    public List<CategoriaDto> listar() {
        try {
            return jdbcTemplate.query("CALL sp_listar_categorias()", CATEGORIA_ROW_MAPPER);
        } catch (DataAccessException ex) {
            // Fallback si los SPs aún no existen
            return jdbcTemplate.query(
                    "SELECT id, nombre, descripcion, activo FROM categorias WHERE activo = TRUE ORDER BY nombre",
                    CATEGORIA_ROW_MAPPER
            );
        }
    }

    public Optional<CategoriaDto> obtener(Integer id) {
        try {
            List<CategoriaDto> list = jdbcTemplate.query(
                    "CALL sp_obtener_categoria(?)",
                    ps -> ps.setInt(1, id),
                    CATEGORIA_ROW_MAPPER
            );
            return list.stream().findFirst();
        } catch (DataAccessException ex) {
            List<CategoriaDto> list = jdbcTemplate.query(
                    "SELECT id, nombre, descripcion, activo FROM categorias WHERE id = ?",
                    ps -> ps.setInt(1, id),
                    CATEGORIA_ROW_MAPPER
            );
            return list.stream().findFirst();
        }
    }
}
