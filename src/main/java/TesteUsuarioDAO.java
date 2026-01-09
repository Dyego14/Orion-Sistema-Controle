/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Dyego    usuarioDAO --- FALA COM O BANCO DE DADOS
 */
import dao.UsuarioDAO;
import model.Usuario;

public class TesteUsuarioDAO {

    public static void main(String[] args) {

        Usuario u = new Usuario();
        u.setNome("Tripulante Beta");
        u.setEmail("beta@orion.com");
        u.setSenha("1234");
        u.setCargo("TRIPULANTE");

        UsuarioDAO dao = new UsuarioDAO();
        dao.salvar(u);

        System.out.println("✅ Usuário salvo com sucesso!");
    }
    
    
    
    
}
