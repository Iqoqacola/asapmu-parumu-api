package com.asapmu.parumu.controller;

import com.asapmu.parumu.dto.StepDto;
import com.asapmu.parumu.service.ContentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/content")
@RequiredArgsConstructor
public class ContentController {

    private final ContentService contentService;

    @GetMapping("/steps")
    public ResponseEntity<List<StepDto>> getAllSteps() {
        List<StepDto> steps = contentService.getAllSteps();
        return ResponseEntity.ok(steps);
    }
}
