package com.sencolis.colis.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;

    @Column(unique = true, nullable = false)
    private String email;

    private String motDePasse;

    private String telephone;

    @Enumerated(EnumType.STRING)
    private Role role;

    private Double note;

    private LocalDate dateInscription;

    // -----------------------
    // Constructeurs
    // -----------------------
    public User() {
        // Constructeur par défaut requis par JPA
    }

    public User(String nom, String email, String motDePasse, String telephone, Role role, Double note, LocalDate dateInscription) {
        this.nom = nom;
        this.email = email;
        this.motDePasse = motDePasse;
        this.telephone = telephone;
        this.role = role;
        this.note = note;
        this.dateInscription = dateInscription;
    }

    // -----------------------
    // Getters et Setters
    // -----------------------
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Double getNote() {
        return note;
    }

    public void setNote(Double note) {
        this.note = note;
    }

    public LocalDate getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(LocalDate dateInscription) {
        this.dateInscription = dateInscription;
    }

    // -----------------------
    // Enum interne pour le rôle
    // -----------------------
    public enum Role {
        EXPEDITEUR,
        VOYAGEUR,
        ADMIN
    }
}
