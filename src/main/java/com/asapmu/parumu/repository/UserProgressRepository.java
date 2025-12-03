package com.asapmu.parumu.repository;

import com.asapmu.parumu.model.UserProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserProgressRepository extends JpaRepository<UserProgress, Long> {
    Optional<UserProgress> findByUser_Id(Long userId);
}