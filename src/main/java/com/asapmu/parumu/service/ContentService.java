package com.asapmu.parumu.service;

import com.asapmu.parumu.dto.StepDto;
import com.asapmu.parumu.repository.StepRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ContentService {

    private final StepRepository stepRepository;

    public List<StepDto> getAllSteps() {
        // Mengambil semua steps dari database, diurutkan berdasarkan step_order
        return stepRepository.findAllByOrderByStepOrderAsc().stream()
                .map(StepDto::new) // Mengonversi setiap Step Entity menjadi StepDto
                .collect(Collectors.toList());
    }
}
