package pe.cibertec.musikastudioapi.domain.seguridad.service;

import lombok.RequiredArgsConstructor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UsuarioAdminService {

    private final JdbcTemplate jdbcTemplate;

    private static final RowMapper<UsuarioSummary> USER_MAPPER = (rs, i) -> new UsuarioSummary(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getObject("role_id") == null ? null : rs.getInt("role_id")
    );

    public List<UsuarioSummary> listar() {
        return jdbcTemplate.query("SELECT id, username, email, role_id FROM usuarios ORDER BY id", USER_MAPPER);
    }

    public UsuarioSummary obtener(Long id) {
        try {
            return jdbcTemplate.queryForObject(
                    "SELECT id, username, email, role_id FROM usuarios WHERE id = ?",
                    USER_MAPPER,
                    id
            );
        } catch (EmptyResultDataAccessException ex) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario no encontrado");
        }
    }

    @Transactional
    public void cambiarRol(Long idUsuario, Integer roleId, String usuarioAuditoria) {
        // Validar que el rol exista
        Integer countRole = jdbcTemplate.queryForObject(
                "SELECT COUNT(1) FROM roles WHERE id = ?",
                Integer.class,
                roleId
        );
        if (countRole == null || countRole == 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "El rol especificado no existe");
        }

        int updated = jdbcTemplate.update(
                "UPDATE usuarios SET role_id = ?, usuario_actualizacion = ? WHERE id = ?",
                roleId, usuarioAuditoria, idUsuario
        );
        if (updated == 0) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario no encontrado");
        }
        // Sincronizar tabla puente usuario_roles (upsert)
        jdbcTemplate.update(
                "INSERT INTO usuario_roles (usuario_id, rol_id, usuario_creacion, usuario_actualizacion) " +
                        "VALUES (?,?,?,?) ON DUPLICATE KEY UPDATE rol_id = VALUES(rol_id), usuario_actualizacion = VALUES(usuario_actualizacion)",
                idUsuario, roleId, usuarioAuditoria, usuarioAuditoria
        );
    }

    @Transactional
    public void eliminar(Long id) {
        int updated = jdbcTemplate.update("DELETE FROM usuarios WHERE id = ?", id);
        if (updated == 0) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Usuario no encontrado");
        }
    }

    public record UsuarioSummary(Long id, String username, String email, Integer roleId) {}
}
