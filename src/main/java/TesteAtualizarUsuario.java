/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import dao.UsuarioDAO;
import model.Usuario;

/**
 *
 * @author Dyego
 */
public class TesteAtualizarUsuario {

    public static void main(String[] args) {

        Usuario u = new Usuario();
        u.setId(1); // ID EXISTENTE
        u.setNome("Capitao Caverna");
        u.setEmail("caverna@orion.com");
        u.setSenha("9999");
        u.setCargo("CAPITAO");

        UsuarioDAO dao = new UsuarioDAO();
        dao.atualizar(u);

        System.out.println("✅ Usuário atualizado com sucesso!");
    }
}
