package com.sencolis.colis.service;
import com.sencolis.colis.model.User;

import com.sencolis.colis.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // Ajouter
    public User registerUser(User user) {
        return userRepository.save(user);
    }
    // Récupérer par ID
    public User getUserById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
    }

    // Lister tous
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Supprimer
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    // Modifier
    public User updateUser(Long id, User user) {
        // Récupérer l'utilisateur existant
        User existingUser = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Utilisateur introuvable avec id " + id));

        existingUser.setNom(user.getNom());
        existingUser.setEmail(user.getEmail());
        existingUser.setMotDePasse(user.getMotDePasse());
        existingUser.setTelephone(user.getTelephone());
        existingUser.setRole(user.getRole());
        return userRepository.save(existingUser);
    }

    // Connexion simple (optionnel)
    public User login(String email, String motDePasse) {
        return userRepository.findByEmailAndMotDePasse(email, motDePasse)
                .orElseThrow(() -> new RuntimeException("Email ou mot de passe incorrect"));
    }
}
