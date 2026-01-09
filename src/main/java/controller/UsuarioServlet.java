/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UsuarioDAO;
import model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/usuarios")
public class UsuarioServlet extends HttpServlet {

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // 🔐 Proteção: só logado acessa
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String action = request.getParameter("action");
    UsuarioDAO dao = new UsuarioDAO();

    // 👉 EDITAR USUÁRIO
    if ("edit".equals(action)) {

        int id = Integer.parseInt(request.getParameter("id"));
        Usuario usuario = dao.buscarPorId(id);

        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("editar.jsp").forward(request, response);
        return;
    }
    
    // 👉 DELETE
    if ("delete".equals(action)) {

        int id = Integer.parseInt(request.getParameter("id"));
        dao.excluir(id);

        response.sendRedirect("usuarios");
        return;
}


    // 👉 LISTAR USUÁRIOS (padrão)
    List<Usuario> usuarios = dao.listar();
    request.setAttribute("usuarios", usuarios);
    request.getRequestDispatcher("usuarios.jsp").forward(request, response);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");
    UsuarioDAO dao = new UsuarioDAO();

    // 👉 CREATE
    if ("create".equals(action)) {

        Usuario u = new Usuario();
        u.setNome(request.getParameter("nome"));
        u.setEmail(request.getParameter("email"));
        u.setSenha(request.getParameter("senha"));
        u.setCargo(request.getParameter("cargo"));

        dao.salvar(u);
        response.sendRedirect("usuarios");
        return;
    }

    // 👉 UPDATE
    if ("update".equals(action)) {

        Usuario u = new Usuario();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setNome(request.getParameter("nome"));
        u.setEmail(request.getParameter("email"));
        u.setSenha(request.getParameter("senha"));
        u.setCargo(request.getParameter("cargo"));

        dao.atualizar(u);
        response.sendRedirect("usuarios");
    }
}

}