package com.asapmu.parumu.service;

import com.asapmu.parumu.dto.ProgressDto;
import com.asapmu.parumu.model.User;
import com.asapmu.parumu.model.UserProgress;
import com.asapmu.parumu.repository.UserProgressRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProgressService {

    private final UserProgressRepository progressRepository;

    public ProgressDto getProgress(User user) {
        UserProgress progress = progressRepository.findByUser_Id(user.getId())
                .orElseGet(() -> {
                    UserProgress newProgress = new UserProgress(user);
                    return progressRepository.save(newProgress);
                });

        ProgressDto dto = new ProgressDto();
        dto.setCurrentStep(progress.getCurrentStep());
        dto.setCompletedSteps(progress.getCompletedSteps());
        return dto;
    }

    public void saveProgress(User user, ProgressDto progressDto) {
        UserProgress progress = progressRepository.findByUser_Id(user.getId())
                .orElseThrow(() -> new RuntimeException("Progress not found for user: " + user.getUsername()));

        progress.setCurrentStep(progressDto.getCurrentStep());
        progress.setCompletedSteps(progressDto.getCompletedSteps());
        progressRepository.save(progress);
    }
}
