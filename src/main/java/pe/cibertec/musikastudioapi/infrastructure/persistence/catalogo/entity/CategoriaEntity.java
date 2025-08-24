package pe.cibertec.musikastudioapi.infrastructure.persistence.catalogo.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "categorias")
@EntityListeners(AuditingEntityListener.class)
@Getter
@Setter
public class CategoriaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true, length = 100)
    private String nombre;

    @Column(length = 1000)
    private String descripcion;

    @Column(nullable = false)
    private Boolean activo = true;

    // Auditoría (fechas las maneja la BD con triggers/defaults)
    @Column(name = "usuario_creacion", nullable = false)
    @CreatedBy
    private String usuarioCreacion;

    @Column(name = "usuario_actualizacion", nullable = false)
    @LastModifiedBy
    private String usuarioActualizacion;

    @Column(name = "fecha_creacion", insertable = false, updatable = false)
    private java.time.LocalDateTime fechaCreacion;

    @Column(name = "fecha_actualizacion", insertable = false, updatable = false)
    private java.time.LocalDateTime fechaActualizacion;
}
