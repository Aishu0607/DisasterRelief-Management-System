package com.victim;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordHasher {
    public static void main(String[] args) {
        String plainPassword = "admin@123";  // Your actual password
        String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt(10));

        System.out.println("Plain Password : " + plainPassword);
        System.out.println("Hashed Password: " + hashedPassword);
    }
}
