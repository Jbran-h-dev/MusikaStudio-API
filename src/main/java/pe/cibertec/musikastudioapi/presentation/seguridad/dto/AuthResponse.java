package pe.cibertec.musikastudioapi.presentation.seguridad.dto;

public record AuthResponse(
        String tokenType,
        String accessToken,
        String refreshToken
) {
    public static AuthResponse bearer(String accessToken, String refreshToken) {
        return new AuthResponse("Bearer", accessToken, refreshToken);
    }
}
