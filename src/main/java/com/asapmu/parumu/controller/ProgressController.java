package com.asapmu.parumu.controller;

import com.asapmu.parumu.dto.ProgressDto;
import com.asapmu.parumu.model.User;
import com.asapmu.parumu.repository.UserRepository;
import com.asapmu.parumu.service.ProgressService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/progress")
@RequiredArgsConstructor
public class ProgressController {

    private final ProgressService progressService;
    private final UserRepository userRepository;

    private User getAuthenticatedUser(Authentication authentication) {
        String username = authentication.getName();
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));
    }

    @GetMapping
    public ResponseEntity<ProgressDto> getProgress(Authentication authentication) {
        User user = getAuthenticatedUser(authentication);
        return ResponseEntity.ok(progressService.getProgress(user));
    }

    @PostMapping
    public ResponseEntity<Void> saveProgress(@RequestBody ProgressDto progressDto, Authentication authentication) {
        User user = getAuthenticatedUser(authentication);
        progressService.saveProgress(user, progressDto);
        return ResponseEntity.ok().build();
    }
}
