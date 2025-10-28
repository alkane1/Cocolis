package com.sencolis.colis.repository;

import com.sencolis.colis.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmailAndMotDePasse(String email, String motDePasse);
}
