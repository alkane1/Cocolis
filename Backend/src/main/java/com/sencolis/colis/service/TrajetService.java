package com.sencolis.colis.service;

import com.sencolis.colis.model.Trajet;
import com.sencolis.colis.repository.TrajetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrajetService {

    @Autowired
    private TrajetRepository trajetRepository;

    public Trajet publierTrajet(Trajet trajet) {
        return trajetRepository.save(trajet);
    }

    public List<Trajet> getAllTrajets() {
        return trajetRepository.findAll();
    }

    public List<Trajet> getTrajetsByUser(Long userId) {
        return trajetRepository.findByUserId(userId);
    }

    // Dans TrajetService
    public Trajet getTrajetById(Long id) {
        return trajetRepository.findById(id)
                .orElse(null); // ou lever une exception si tu préfères
    }

    public void deleteTrajet(Long id) {
        trajetRepository.deleteById(id);
    }

    // Dans TrajetService
    public Trajet saveTrajet(Trajet trajet) {
        return trajetRepository.save(trajet);
    }

}
