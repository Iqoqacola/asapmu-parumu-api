package com.asapmu.parumu.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user_progress")
@Data
@NoArgsConstructor
public class UserProgress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    private int currentStep;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "completed_steps", joinColumns = @JoinColumn(name = "progress_id"))
    @Column(name = "step_index")
    private List<Integer> completedSteps = new ArrayList<>();

    public UserProgress(User user) {
        this.user = user;
        this.currentStep = 0;
    }
}