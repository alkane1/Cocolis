package com.sencolis.colis.controller;

import com.sencolis.colis.model.Trajet;
import com.sencolis.colis.repository.TrajetRepository;
import com.sencolis.colis.service.TrajetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/trajets")
@CrossOrigin(origins = "*")
public class TrajetController {

    @Autowired
    private TrajetService trajetService;
    @Autowired
    private TrajetRepository trajetRepository; // <-- déclaration et injection

    // Publier un trajet
    @PostMapping
    public ResponseEntity<Trajet> publierTrajet(@RequestBody Trajet trajet) {
        Trajet newTrajet = trajetService.publierTrajet(trajet);
        return ResponseEntity.ok(newTrajet);
    }

    // Lister tous les trajets
    @GetMapping
    public ResponseEntity<List<Trajet>> getAllTrajets() {
        return ResponseEntity.ok(trajetService.getAllTrajets());
    }

    // Lister les trajets d’un utilisateur
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Trajet>> getTrajetsByUser(@PathVariable Long userId) {
        return ResponseEntity.ok(trajetService.getTrajetsByUser(userId));
    }

    // GET /api/trajets/{id} pour récupérer un trajet spécifique
    @GetMapping("/{id}")
    public ResponseEntity<Trajet> getTrajetById(@PathVariable Long id) {
        Trajet trajet = trajetService.getTrajetById(id);
        if (trajet != null) {
            return ResponseEntity.ok(trajet);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    // Supprimer un trajet
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteTrajet(@PathVariable Long id) {
        trajetService.deleteTrajet(id);
        return ResponseEntity.ok("Trajet supprimé avec succès ✅");
    }

    // Exemple : modifier un trajet
    @PutMapping("/{id}")
    public ResponseEntity<Trajet> updateTrajet(@PathVariable Long id, @RequestBody Trajet trajetDetails) {
        return trajetRepository.findById(id)
                .map(trajet -> {
                    trajet.setDepart(trajetDetails.getDepart());
                    trajet.setDestination(trajetDetails.getDestination());
                    trajet.setDateDepart(trajetDetails.getDateDepart());
                    trajet.setPlacesDisponibles(trajetDetails.getPlacesDisponibles());
                    trajet.setPrix(trajetDetails.getPrix());
                    Trajet updatedTrajet = trajetRepository.save(trajet);
                    return ResponseEntity.ok(updatedTrajet);
                })
                .orElse(ResponseEntity.notFound().build());
    }

}
