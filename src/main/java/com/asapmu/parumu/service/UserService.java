package com.asapmu.parumu.service;

import com.asapmu.parumu.dto.LoginRequest;
import com.asapmu.parumu.dto.RegisterRequest;
import com.asapmu.parumu.model.User;
import com.asapmu.parumu.repository.UserRepository;
import com.asapmu.parumu.util.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;
    private final AuthenticationManager authenticationManager;

    public String register(RegisterRequest request) {

        if (userRepository.existsByUsername(request.getUsername())) {
            throw new RuntimeException("Username sudah terdaftar!");
        }

        if (!request.getPassword().equals(request.getKonfirmasiPassword())) {
            throw new RuntimeException("Password tidak sama!");
        }

        User user = User.builder()
                .username(request.getUsername())
                .namaLengkap(request.getNamaLengkap())
                .password(passwordEncoder.encode(request.getPassword()))
                .build();

        userRepository.save(user);
        return "Registrasi berhasil!";
    }

    public String login(LoginRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getUsername(),
                        request.getPassword()
                )
        );

        return jwtUtil.generateToken(request.getUsername());
    }
}