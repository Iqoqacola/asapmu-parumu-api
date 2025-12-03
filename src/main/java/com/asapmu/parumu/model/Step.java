package com.asapmu.parumu.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "steps")
@Data
public class Step {
    @Id
    private Long id;

    @ManyToOne
    @JoinColumn(name = "module_id", nullable = false)
    private Module module;

    @Column(nullable = false)
    private int stepOrder;

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String textContent;

    // Nama kolom disesuaikan dengan database
    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "interactive_type")
    private String interactiveType;

    @Column(name = "interactive_url")
    private String interactiveUrl;

    @Column(name = "media_description")
    private String mediaDescription;
}

