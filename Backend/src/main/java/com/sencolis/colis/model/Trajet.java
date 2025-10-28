package com.sencolis.colis.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "trajets")
public class Trajet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String depart;
    private String destination;
    private LocalDateTime dateDepart;
    private int placesDisponibles;
    private double prix;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user; // l'utilisateur qui publie le trajet

    public Trajet() {}

    public Trajet(String depart, String destination, LocalDateTime dateDepart, int placesDisponibles, double prix, User user) {
        this.depart = depart;
        this.destination = destination;
        this.dateDepart = dateDepart;
        this.placesDisponibles = placesDisponibles;
        this.prix = prix;
        this.user = user;
    }

    // --- Getters et Setters ---
    public Long getId() { return id; }
    public String getDepart() { return depart; }
    public void setDepart(String depart) { this.depart = depart; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public LocalDateTime getDateDepart() { return dateDepart; }
    public void setDateDepart(LocalDateTime dateDepart) { this.dateDepart = dateDepart; }

    public int getPlacesDisponibles() { return placesDisponibles; }
    public void setPlacesDisponibles(int placesDisponibles) { this.placesDisponibles = placesDisponibles; }

    public double getPrix() { return prix; }
    public void setPrix(double prix) { this.prix = prix; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}
