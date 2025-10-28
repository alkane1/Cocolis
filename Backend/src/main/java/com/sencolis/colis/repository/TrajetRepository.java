package com.sencolis.colis.repository;

import com.sencolis.colis.model.Trajet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TrajetRepository extends JpaRepository<Trajet, Long> {
    List<Trajet> findByUserId(Long userId);
}
