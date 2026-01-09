/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Dyego
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;
import util.conexaoBD;

public class UsuarioDAO {
    // CRUD virá aqui
    public void salvar(Usuario usuario) {

    String sql = "INSERT INTO usuario (nome, email, senha, cargo) VALUES (?, ?, ?, ?)";

    try (Connection conn = conexaoBD.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, usuario.getNome());
        ps.setString(2, usuario.getEmail());
        ps.setString(3, usuario.getSenha());
        ps.setString(4, usuario.getCargo());

        ps.executeUpdate();

    } catch (Exception e) {
        throw new RuntimeException("Erro ao salvar usuário", e);
    }
    }
    
    public List<Usuario> listar() {

    List<Usuario> usuarios = new ArrayList<>();
    String sql = "SELECT * FROM usuario";

    try (Connection conn = conexaoBD.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setEmail(rs.getString("email"));
            u.setSenha(rs.getString("senha"));
            u.setCargo(rs.getString("cargo"));

            usuarios.add(u);
        }

    } catch (Exception e) {
        throw new RuntimeException("Erro ao listar usuários", e);
    }

    return usuarios;
}

    public Usuario login(String email, String senha) {

    String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";

    try (Connection conn = conexaoBD.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, email);
        ps.setString(2, senha);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Usuario u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setEmail(rs.getString("email"));
            u.setSenha(rs.getString("senha"));
            u.setCargo(rs.getString("cargo"));
            return u;
        }

    } catch (Exception e) {
        throw new RuntimeException("Erro no login", e);
    }

    return null;
}
    
    public Usuario buscarPorId(int id) {

    Usuario u = null;
    String sql = "SELECT * FROM usuario WHERE id = ?";

    try (Connection conn = conexaoBD.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt("id"));
            u.setNome(rs.getString("nome"));
            u.setEmail(rs.getString("email"));
            u.setSenha(rs.getString("senha"));
            u.setCargo(rs.getString("cargo"));
        }

    } catch (Exception e) {
        throw new RuntimeException("Erro ao buscar usuário por ID", e);
    }

    return u;
}

    public void atualizar(Usuario u) {

    String sql = "UPDATE usuario SET nome=?, email=?, senha=?, cargo=? WHERE id=?";

    try (Connection conn = conexaoBD.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, u.getNome());
        ps.setString(2, u.getEmail());
        ps.setString(3, u.getSenha());
        ps.setString(4, u.getCargo());
        ps.setInt(5, u.getId());

        ps.executeUpdate();

    } catch (Exception e) {
        throw new RuntimeException("Erro ao atualizar usuário", e);
    }
}


    public void excluir(int id) {

    String sql = "DELETE FROM usuario WHERE id=?";

    try (Connection conn = conexaoBD.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, id);
        ps.executeUpdate();

    } catch (Exception e) {
        throw new RuntimeException("Erro ao excluir usuário", e);
    }
}

    
}
