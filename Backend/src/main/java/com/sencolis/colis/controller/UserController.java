package com.sencolis.colis.controller;

import com.sencolis.colis.model.User;
import com.sencolis.colis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*") // Autorise les requêtes depuis Flutter ou Postman
public class UserController {

    @Autowired
    private UserService userService;

    // ----------------------
    // Ajouter un utilisateur
    // ----------------------
    @PostMapping
    public ResponseEntity<User> addUser(@RequestBody User user) {
        User newUser = userService.registerUser(user);
        return ResponseEntity.ok(newUser);
    }

    // ----------------------
    // Récupérer un utilisateur par ID
    // ----------------------
    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        User user = userService.getUserById(id);
        return ResponseEntity.ok(user);
    }

    // ----------------------
    // Lister tous les utilisateurs
    // ----------------------
    @GetMapping
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return ResponseEntity.ok(users);
    }

    // ----------------------
    // Supprimer un utilisateur
    // ----------------------
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return ResponseEntity.ok("Utilisateur supprimé avec succès ✅");
    }

    // ----------------------
    // Modifier un utilisateur
    // ----------------------
    @PutMapping("/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User user) {
        User updatedUser = userService.updateUser(id, user);
        return ResponseEntity.ok(updatedUser);
    }


}
