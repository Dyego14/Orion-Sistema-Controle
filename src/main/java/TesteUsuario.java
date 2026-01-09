/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Dyego
 */

import model.Usuario;

public class TesteUsuario {

    public static void main(String[] args) {

        Usuario u = new Usuario();
        u.setId(1);
        u.setNome("Capitão Orion");
        u.setEmail("capitao@orion.com");
        u.setSenha("1234");
        u.setCargo("CAPITAO");

        System.out.println("Nome: " + u.getNome());
        System.out.println("Email: " + u.getEmail());
        System.out.println("Cargo: " + u.getCargo());
    }
}
