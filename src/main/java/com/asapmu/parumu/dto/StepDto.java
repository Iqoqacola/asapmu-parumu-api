package com.asapmu.parumu.dto;

import com.asapmu.parumu.model.Step;
import com.fasterxml.jackson.annotation.JsonProperty; // Import yang dibutuhkan
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StepDto {
    private Long id;

    @JsonProperty("step_order") // Mengubah nama field saat diubah menjadi JSON
    private int stepOrder;

    private String title;

    @JsonProperty("text_content")
    private String textContent;

    @JsonProperty("image_url")
    private String imageUrl;

    @JsonProperty("interactive_type")
    private String interactiveType;

    @JsonProperty("interactive_url")
    private String interactiveUrl;

    @JsonProperty("media_description")
    private String mediaDescription;

    // Constructor untuk konversi dari Entity ke DTO
    public StepDto(Step step) {
        this.id = step.getId();
        this.stepOrder = step.getStepOrder();
        this.title = step.getTitle();
        this.textContent = step.getTextContent();
        this.imageUrl = step.getImageUrl();
        this.interactiveType = step.getInteractiveType();
        this.interactiveUrl = step.getInteractiveUrl();
        this.mediaDescription = step.getMediaDescription();
    }
}

