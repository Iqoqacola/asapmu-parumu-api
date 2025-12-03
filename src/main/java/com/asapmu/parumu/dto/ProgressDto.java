package com.asapmu.parumu.dto;

import lombok.Data;
import java.util.List;

@Data
public class ProgressDto {
    private int currentStep;
    private List<Integer> completedSteps;
}