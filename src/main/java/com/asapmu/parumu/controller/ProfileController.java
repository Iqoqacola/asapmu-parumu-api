package com.asapmu.parumu.controller;

import com.asapmu.parumu.model.User;
import com.asapmu.parumu.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping("/api/profile")
@RequiredArgsConstructor
public class ProfileController {

    private final UserRepository userRepository;

    @GetMapping("/me")
    public ResponseEntity<?> getMyProfile(Authentication authentication) {
        String currentUsername = authentication.getName();

        User user = userRepository
                .findByUsername(currentUsername)
                .orElseThrow(() -> new UsernameNotFoundException("Username tidak ditemukan!"));

        Map<String, Object> profileData = Map.of(
                "id", user.getId(),
                "username", user.getUsername(),
                "namaLengkap", user.getNamaLengkap()
        );

        return ResponseEntity.ok(profileData);
    }
}
