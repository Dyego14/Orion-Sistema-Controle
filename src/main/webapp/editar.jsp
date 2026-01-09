<%-- 
    Document   : editar
    Created on : 5 de jan. de 2026, 23:40:22
    Author     : Dyego
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Usuario" %>

<%
    Usuario u = (Usuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Editar Tripulante - ORION</title>

    <!-- Fontes ORION -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;700&family=Roboto:wght@300;400&display=swap" rel="stylesheet">

    <!-- Ícones Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --orion-blue: #00bcd4;
            --orion-blue-light: #e0fbff;
            --orion-dark: #0f172a;
            --orion-white: #ffffff;
        }

        body {
            margin: 0;
            min-height: 100vh;
            background: linear-gradient(180deg, #ffffff, #e0fbff);
            font-family: 'Roboto', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
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
            background: rgba(255, 255, 255, 0.3);
        }

        /* Container principal */
        .editar-container {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            position: relative;
            z-index: 1;
        }

        /* Header futurista */
        .orion-header {
            text-align: center;
            margin-bottom: 30px;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        .orion-logo {
            font-family: 'Orbitron', sans-serif;
            font-size: 24px;
            color: var(--orion-blue);
            letter-spacing: 4px;
            text-shadow: 
                0 0 12px rgba(0,188,212,0.7),
                0 0 24px rgba(0,188,212,0.3);
            position: relative;
            margin-bottom: 10px;
        }

        .orion-logo::after {
            content: '▶';
            position: absolute;
            right: -25px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 16px;
            animation: blink 2s infinite;
            color: var(--orion-blue);
        }

        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.3; }
        }

        .orion-subtitle {
            font-size: 14px;
            color: #64748b;
            margin-top: 5px;
        }

        /* Card futurista */
        .card {
            background: var(--orion-white);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 
                0 20px 40px rgba(0,188,212,0.25),
                0 0 0 1px rgba(0,188,212,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--orion-blue), transparent);
            animation: scanline 3s linear infinite;
        }

        @keyframes scanline {
            0% { left: -100%; }
            100% { left: 100%; }
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 
                0 25px 50px rgba(0,188,212,0.35),
                0 0 0 1px rgba(0,188,212,0.15);
        }

        h1 {
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            color: #00bcd4;
            margin-bottom: 30px;
            letter-spacing: 1px;
            font-size: 24px;
            position: relative;
            padding-bottom: 15px;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 2px;
            background: linear-gradient(90deg, transparent, #00bcd4, transparent);
        }

        /* Formulário futurista */
        .form-group {
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
            display: block;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--orion-blue);
            opacity: 0.7;
        }

        input, select {
            width: 100%;
            padding: 14px 15px;
            border-radius: 12px;
            border: 1px solid #cbd5e1;
            font-size: 15px;
            font-family: 'Roboto', sans-serif;
            transition: all 0.3s ease;
            background: rgba(255,255,255,0.9);
        }

        input:focus, select:focus {
            outline: none;
            border-color: #00bcd4;
            box-shadow: 
                0 0 0 3px rgba(0,188,212,0.25),
                inset 0 0 10px rgba(0,188,212,0.1);
            transform: scale(1.01);
        }

        input:focus + i {
            opacity: 1;
            animation: pulse 1s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: translateY(-50%) scale(1); }
            50% { transform: translateY(-50%) scale(1.1); }
        }

        /* Badge de ID do tripulante */
        .tripulante-id {
            background: linear-gradient(135deg, #00bcd4, #0284c7);
            color: white;
            padding: 8px 16px;
            border-radius: 10px;
            font-family: 'Orbitron', sans-serif;
            font-size: 12px;
            letter-spacing: 1px;
            display: inline-block;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,188,212,0.3);
        }

        .tripulante-id i {
            margin-right: 8px;
        }

        /* Botões futuristas */
        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            gap: 15px;
        }

        .btn {
            padding: 14px 25px;
            border-radius: 14px;
            border: none;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            position: relative;
            overflow: hidden;
        }

        .btn-back {
            background: white;
            color: #0284c7;
            border: 2px solid #0284c7;
        }

        .btn-back:hover {
            background: #0284c7;
            color: white;
            box-shadow: 0 10px 25px rgba(2, 132, 199, 0.3);
            transform: translateY(-3px);
        }

        .btn-save {
            background: linear-gradient(135deg, #00bcd4, #0284c7);
            color: white;
        }

        .btn-save:hover {
            box-shadow: 
                0 15px 30px rgba(0,188,212,0.4),
                0 0 20px rgba(0,188,212,0.3);
            transform: translateY(-3px) scale(1.05);
            letter-spacing: 2px;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, 
                transparent, 
                rgba(255,255,255,0.3), 
                transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        /* Status indicator */
        .status-indicator {
            position: fixed;
            top: 20px;
            right: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            background: rgba(255,255,255,0.9);
            border-radius: 20px;
            font-size: 0.8rem;
            color: var(--orion-blue);
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
            box-shadow: 0 5px 15px rgba(0,188,212,0.2);
            z-index: 1000;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(0,188,212,0.1);
        }

        .status-dot {
            width: 8px;
            height: 8px;
            background: #fbbf24;
            border-radius: 50%;
            animation: statusPulse 2s infinite;
        }

        @keyframes statusPulse {
            0%, 100% { 
                box-shadow: 0 0 0 0 rgba(251, 191, 36, 0.7);
                opacity: 1;
            }
            50% { 
                box-shadow: 0 0 0 6px rgba(251, 191, 36, 0);
                opacity: 0.8;
            }
        }

        /* Efeito holográfico */
        .hologram {
            position: relative;
        }

        .hologram::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, 
                transparent 0%, 
                rgba(0,188,212,0.1) 50%, 
                transparent 100%);
            z-index: -1;
            border-radius: 22px;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .hologram:hover::before {
            opacity: 1;
        }

        /* Responsividade */
        @media (max-width: 600px) {
            .editar-container {
                padding: 15px;
            }
            
            .card {
                padding: 25px 20px;
            }
            
            .actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                margin-bottom: 10px;
            }
            
            .orion-logo {
                font-size: 20px;
                letter-spacing: 3px;
            }
        }

        /* Animação de entrada */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            animation: fadeIn 0.6s ease-out forwards;
        }

        /* Campo de senha */
        .senha-info {
            font-size: 12px;
            color: #64748b;
            margin-top: 5px;
            font-style: italic;
        }
    </style>
</head>

<body>

<!-- Partículas de fundo -->
<div id="particles-js"></div>

<!-- Status Indicator -->
<div class="status-indicator">
    <span class="status-dot"></span>
    MODO EDIÇÃO
</div>

<div class="editar-container">
    
    <!-- Header -->
    <div class="orion-header">
        <div class="orion-logo">EDIÇÃO DE TRIPULANTE</div>
        <div class="orion-subtitle">Atualize as informações do membro da tripulação</div>
    </div>

    <!-- Card de formulário -->
    <div class="card hologram">
        
        <h1>✏️ Editar Tripulante</h1>

        <!-- Badge com ID -->
        <div class="tripulante-id">
            <i class="fas fa-id-badge"></i>
            ID: <%= u.getId() %> | <%= u.getNome() %>
        </div>

        <form action="usuarios" method="post" id="editarForm">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= u.getId() %>">

            <div class="form-group">
                <label><i class="fas fa-user-astronaut me-2"></i>Nome Completo</label>
                <div class="input-icon">
                    <input type="text" name="nome" value="<%= u.getNome() %>" required 
                           placeholder="Digite o nome do tripulante">
                    <i class="fas fa-id-card"></i>
                </div>
            </div>

            <div class="form-group">
                <label><i class="fas fa-envelope me-2"></i>Email Institucional</label>
                <div class="input-icon">
                    <input type="email" name="email" value="<%= u.getEmail() %>" required 
                           placeholder="tripulante@orion.com">
                    <i class="fas fa-at"></i>
                </div>
            </div>

            <div class="form-group">
                <label><i class="fas fa-key me-2"></i>Código de Acesso</label>
                <div class="input-icon">
                    <input type="password" name="senha" value="<%= u.getSenha() %>" required 
                           placeholder="••••••••">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="senha-info">Deixe em branco para manter a senha atual</div>
            </div>

            <div class="form-group">
                <label><i class="fas fa-briefcase me-2"></i>Cargo na Missão</label>
                <div class="input-icon">
                    <select name="cargo" required>
                        <option value="CAPITAO" <%= u.getCargo().equals("CAPITAO") ? "selected" : "" %>>
                            👨‍✈️ Capitão
                        </option>
                        <option value="ENGENHEIRO" <%= u.getCargo().equals("ENGENHEIRO") ? "selected" : "" %>>
                            🔧 Engenheiro
                        </option>
                        <option value="QUIMICO" <%= u.getCargo().equals("QUÍMICO") || u.getCargo().equals("QUIMICO") ? "selected" : "" %>>
                            ⚗️ Químico
                        </option>
                        <option value="BIOLOGO" <%= u.getCargo().equals("BIOLOGO") ? "selected" : "" %>>
                            🧬 Biólogo
                        </option>
                        <option value="GEOLOGO" <%= u.getCargo().equals("GEOLOGO") ? "selected" : "" %>>
                            ⛰️ Geólogo
                        </option>
                        <option value="CIENTISTA" <%= u.getCargo().equals("CIENTISTA") ? "selected" : "" %>>
                            🔬 Cientista
                        </option>
                        <option value="TRIPULANTE" <%= u.getCargo().equals("TRIPULANTE") ? "selected" : "" %>>
                            👨‍🚀 Tripulante
                        </option>
                    </select>
                    <i class="fas fa-user-tie"></i>
                </div>
            </div>

            <div class="actions">
                <a href="usuarios" class="btn btn-back">
                    <i class="fas fa-arrow-left"></i>
                    VOLTAR
                </a>
                <button type="submit" class="btn btn-save" id="btnSalvar">
                    <i class="fas fa-save"></i>
                    ATUALIZAR DADOS
                </button>
            </div>

        </form>

    </div>

</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<script>
    // Inicializar partículas COM CONFIGURAÇÃO MAIS ESCURA
    particlesJS('particles-js', {
        particles: {
            number: { 
                value: 60,
                density: { 
                    enable: true, 
                    value_area: 800 
                } 
            },
            color: { 
                value: "#0077b6"
            },
            shape: { 
                type: "circle" 
            },
            opacity: { 
                value: 0.6,
                random: true,
                anim: {
                    enable: true,
                    speed: 1,
                    opacity_min: 0.3,
                    sync: false
                }
            },
            size: { 
                value: 4,
                random: true,
                anim: {
                    enable: true,
                    speed: 2,
                    size_min: 2,
                    sync: false
                }
            },
            line_linked: {
                enable: true,
                distance: 120,
                color: "#0077b6",
                opacity: 0.4,
                width: 1.5
            },
            move: {
                enable: true,
                speed: 1.5,
                direction: "none",
                random: true,
                straight: false,
                out_mode: "out",
                bounce: false
            }
        },
        interactivity: {
            detect_on: "canvas",
            events: {
                onhover: { 
                    enable: true, 
                    mode: "grab"
                },
                onclick: { 
                    enable: true, 
                    mode: "push" 
                },
                resize: true
            },
            modes: {
                grab: {
                    distance: 140,
                    line_linked: {
                        opacity: 0.8
                    }
                },
                push: {
                    particles_nb: 4
                }
            }
        },
        retina_detect: true
    });

    // Efeito de submit do formulário
    document.getElementById('editarForm').addEventListener('submit', function(e) {
        const btn = document.getElementById('btnSalvar');
        const originalText = btn.innerHTML;
        
        // Adicionar efeito de loading
        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> ATUALIZANDO...';
        btn.disabled = true;
        btn.style.opacity = '0.8';
        
        // Simular delay para efeito visual
        setTimeout(() => {
            // O formulário será submetido normalmente após o efeito
        }, 1000);
    });

    // Efeitos nos inputs
    const inputs = document.querySelectorAll('input, select');
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.querySelector('i').style.color = '#00bcd4';
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.querySelector('i').style.color = '';
        });
    });

    // Efeito de hover no card
    const card = document.querySelector('.card');
    card.addEventListener('mouseenter', () => {
        document.documentElement.style.setProperty('--orion-glow', '1');
    });
    
    card.addEventListener('mouseleave', () => {
        document.documentElement.style.setProperty('--orion-glow', '0.6');
    });

    // Validação de campo de senha
    const senhaInput = document.querySelector('input[name="senha"]');
    senhaInput.addEventListener('input', function() {
        if (this.value === '') {
            this.style.borderColor = '#fbbf24';
            this.style.backgroundColor = '#fffbeb';
        } else {
            this.style.borderColor = '';
            this.style.backgroundColor = '';
        }
    });
</script>

</body>
</html>