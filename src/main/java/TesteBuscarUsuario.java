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

public class TesteBuscarUsuario {

    public static void main(String[] args) {

        UsuarioDAO dao = new UsuarioDAO();

        // ⚠️ Use um ID que você SABE que existe no banco
        Usuario u = dao.buscarPorId(1);

        if (u != null) {
            System.out.println("ID: " + u.getId());
            System.out.println("Nome: " + u.getNome());
            System.out.println("Email: " + u.getEmail());
            System.out.println("Cargo: " + u.getCargo());
        } else {
            System.out.println("❌ Usuário não encontrado");
        }
    }
}
