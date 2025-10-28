package com.sencolis.colis.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // Désactive complètement CSRF (utile pour tests API avec Postman)
                .csrf(csrf -> csrf.disable())

                // Autorise toutes les requêtes sur /api/trajets/** et d'autres routes publiques
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/test/**").permitAll()
                        .requestMatchers("/api/users/**").permitAll()
                        .requestMatchers("/api/trajets/**").permitAll()
                        .anyRequest().authenticated() // le reste nécessite authentification
                );

        return http.build();
    }
}
