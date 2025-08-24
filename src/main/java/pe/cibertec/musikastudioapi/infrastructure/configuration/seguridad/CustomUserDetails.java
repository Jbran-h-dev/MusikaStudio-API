package pe.cibertec.musikastudioapi.infrastructure.configuration.seguridad;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pe.cibertec.musikastudio.infrastructure.persistence.seguridad.repository.UsuarioRepository;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CustomUserDetails implements UserDetailsService {

    private final UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        var usuario = usuarioRepository.findByUsernameAndActivoTrue(username)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado"));

        var authorities = usuario.getRoles().stream()
                .map(rol -> normalizeRole(rol.getNombre()))
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toSet());

        return User.withUsername(usuario.getUsername())
                .password(usuario.getPasswordHash())
                .authorities(authorities)
                .accountExpired(false)
                .accountLocked(false)
                .credentialsExpired(false)
                .disabled(Boolean.FALSE.equals(usuario.getActivo()))
                .build();
    }

    private String normalizeRole(String raw) {
        if (raw == null) return "ROLE_USER";
        String upper = raw.trim().toUpperCase();
        if (upper.startsWith("ADMIN")) return "ROLE_ADMIN";
        if (upper.startsWith("VENDEDOR")) return "ROLE_VENDEDOR";
        if (upper.startsWith("CLIENTE")) return "ROLE_CLIENTE";
        return "ROLE_" + upper.replace(' ', '_');
    }
}
