package pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "instrumentos")
@EntityListeners(AuditingEntityListener.class)
@Getter
@Setter
public class InstrumentoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String codigo;

    @Column(nullable = false, unique = true)
    private String nombre;

    @Column(columnDefinition = "TEXT")
    private String descripcion;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal precio;

    @Column(nullable = false)
    private Integer stock;

    @Column(name = "stock_minimo", nullable = false)
    private Integer stockMinimo;

    @Column(name = "url_imagen", length = 500)
    private String urlImagen;

    private Boolean activo = true;

    // Tomada del sistema (BD): usar DEFAULT CURRENT_DATE; no insertar/actualizar desde JPA
    @Column(name = "fecha_ingreso", insertable = false, updatable = false)
    private LocalDate fechaIngreso;

    @Column(name = "id_categoria")
    private Integer idCategoria;

    @Column(name = "id_marca")
    private Integer idMarca;

    // Auditoría
    @Column(name = "fecha_creacion", insertable = false, updatable = false)
    private LocalDateTime fechaCreacion;

    @Column(name = "usuario_creacion", nullable = false)
    @CreatedBy
    private String usuarioCreacion;

    @Column(name = "fecha_actualizacion", insertable = false, updatable = false)
    private LocalDateTime fechaActualizacion;

    @Column(name = "usuario_actualizacion", nullable = false)
    @LastModifiedBy
    private String usuarioActualizacion;
}
