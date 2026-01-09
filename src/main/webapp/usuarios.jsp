<%-- 
    Document   : usuarios
    Created on : 4 de jan. de 2026, 22:40:40
    Author     : Dyego
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Usuario" %>

<%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
    Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");
    if (usuarioLogado == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Tripulação - ORION</title>

    <!-- Fontes ORION -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Roboto&display=swap" rel="stylesheet">
    
    <!-- Ícones simples -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(180deg, #ffffff, #e0fbff);
            font-family: 'Roboto', sans-serif;
            overflow-x: hidden;
        }

        /* Partículas de fundo */
        #particles-js {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 30px 20px;
            position: relative;
            z-index: 1;
        }

        h1 {
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            color: #00bcd4;
            margin: 40px 0 30px;
            letter-spacing: 2px;
            font-size: 28px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
            font-size: 16px;
        }

        .card {
            background: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(0,188,212,0.15);
            border: 1px solid #e0f7fa;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background: #00bcd4;
            color: white;
            padding: 14px;
            text-align: center;
            font-weight: 600;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e2e8f0;
            text-align: center;
            font-size: 15px;
        }

        tr:hover {
            background-color: #f0fdff;
        }

        .cargo {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 600;
            background: #e0f7fa;
            color: #007c91;
        }

        .actions {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .btn {
            padding: 8px 16px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 13px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            border: none;
        }

        .btn-edit {
            background: #e0f7fa;
            color: #007c91;
            border: 1px solid #00bcd4;
        }

        .btn-delete {
            background: #ffebee;
            color: #c62828;
            border: 1px solid #ef5350;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .btn-edit:hover {
            background: #00bcd4;
            color: white;
        }

        .btn-delete:hover {
            background: #ef5350;
            color: white;
        }

        .footer-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .btn-back {
            background: white;
            color: #0284c7;
            border: 2px solid #0284c7;
            padding: 12px 24px;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
        }

        .btn-new {
            background: linear-gradient(135deg, #00bcd4, #0284c7);
            color: white;
            border: none;
            padding: 12px 24px;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
        }

        .btn-back:hover {
            background: #0284c7;
            color: white;
        }

        .btn-new:hover {
            box-shadow: 0 8px 20px rgba(0,188,212,0.3);
        }

        .user-count {
            text-align: center;
            color: #64748b;
            margin-top: 10px;
            font-size: 14px;
        }

        .current-user {
            background-color: #f0fdff;
            border-left: 4px solid #00bcd4;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
            }
            
            h1 {
                font-size: 22px;
            }
            
            .card {
                padding: 15px;
                overflow-x: auto;
            }
            
            table {
                font-size: 14px;
            }
            
            th, td {
                padding: 10px 8px;
            }
            
            .footer-buttons {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn-back, .btn-new {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>

<body>

<!-- Partículas de fundo -->
<div id="particles-js"></div>

<div class="container">

    <h1><i class="fas fa-users"></i> Tripulação ORION</h1>
    
    <div class="subtitle">
        Usuário: <strong><%= usuarioLogado.getNome() %></strong> | 
        Cargo: <strong><%= usuarioLogado.getCargo() %></strong>
    </div>

    <div class="card">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Cargo</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for (Usuario u : usuarios) { 
                    boolean isCurrentUser = u.getId() == usuarioLogado.getId();
                %>
                <tr class="<%= isCurrentUser ? "current-user" : "" %>">
                    <td><strong>#<%= u.getId() %></strong></td>
                    <td><%= u.getNome() %></td>
                    <td><%= u.getEmail() %></td>
                    <td>
                        <span class="cargo">
                            <%= u.getCargo() %>
                        </span>
                    </td>
                    <td>
                        <div class="actions">
                            <a href="usuarios?action=edit&id=<%= u.getId() %>" 
                               class="btn btn-edit">
                                <i class="fas fa-edit"></i>
                                Editar
                            </a>

                            <% if (!isCurrentUser) { %>
                            <a href="usuarios?action=delete&id=<%= u.getId() %>"
                               class="btn btn-delete"
                               onclick="return confirm('Excluir tripulante?')">
                                <i class="fas fa-trash"></i>
                                Excluir
                            </a>
                            <% } else { %>
                            <span class="btn" style="opacity: 0.6; cursor: default;">
                                <i class="fas fa-user"></i>
                                Você
                            </span>
                            <% } %>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <div class="user-count">
            <i class="fas fa-user-check"></i> Total de tripulantes: <%= usuarios.size() %>
        </div>
    </div>

    <div class="footer-buttons">
        <a href="dashboard.jsp" class="btn btn-back">
            <i class="fas fa-arrow-left"></i>
            Voltar ao Painel
        </a>
        
        <a href="cadastro.jsp" class="btn btn-new">
            <i class="fas fa-user-plus"></i>
            Novo Tripulante
        </a>
    </div>

</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<script>
    // Configuração simples das partículas
    particlesJS('particles-js', {
        particles: {
            number: { 
                value: 40,
                density: { 
                    enable: true, 
                    value_area: 800 
                } 
            },
            color: { 
                value: "#00bcd4"
            },
            shape: { 
                type: "circle" 
            },
            opacity: { 
                value: 0.3,
                random: true
            },
            size: { 
                value: 3,
                random: true
            },
            line_linked: {
                enable: true,
                distance: 150,
                color: "#00bcd4",
                opacity: 0.2,
                width: 1
            },
            move: {
                enable: true,
                speed: 1,
                direction: "none",
                random: true,
                straight: false,
                out_mode: "out"
            }
        },
        interactivity: {
            events: {
                onhover: { enable: true, mode: "repulse" },
                onclick: { enable: true, mode: "push" }
            }
        }
    });
</script>

</body>
</html>