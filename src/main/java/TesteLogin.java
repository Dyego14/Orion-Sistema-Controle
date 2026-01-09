/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Dyego
 */

import dao.UsuarioDAO;
import model.Usuario;


public class TesteLogin {

    public static void main(String[] args) {

        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = dao.login("beta@orion.com", "1234");

        if (u != null) {
            System.out.println("✅ Login OK: " + u.getNome());
        } else {
            System.out.println("❌ Login inválido");
        }
    }
}
