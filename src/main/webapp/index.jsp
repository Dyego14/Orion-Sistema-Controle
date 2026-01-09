<%-- 
    Document   : index
    Created on : 3 de jan. de 2026, 21:39:42
    Author     : Dyego
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Login - Nave ORION</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Fontes Futuristas -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;700&family=Roboto:wght@300;400&display=swap" rel="stylesheet">

    <!-- Ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --orion-blue: #00bcd4;
            --orion-blue-light: #e0fbff;
            --orion-dark: #0f172a;
            --orion-white: #ffffff;
            --glow-intensity: 0.7;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(180deg, #ffffff, #e0fbff);
            font-family: 'Roboto', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--orion-dark);
            overflow-x: hidden;
            position: relative;
        }

        /* Partículas de fundo MAIS ESCURAS */
        #particles-js {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .orion-container {
            width: 100%;
            max-width: 420px;
            position: relative;
            z-index: 1;
        }

        /* Post-it de credenciais */
        .postit-note {
            position: fixed;
            top: 100px;
            right: 30px;
            width: 200px;      /* MODIFICADO: 180px para 200px */
            background: linear-gradient(135deg, #fff9c4, #fff59d);
            padding: 18px;     /* MODIFICADO: 15px para 18px */
            border-radius: 8px;
            box-shadow: 
                0 6px 15px rgba(0,0,0,0.1),
                inset 0 -8px 8px -8px rgba(0,0,0,0.1),
                inset 8px 0 8px -8px rgba(0,0,0,0.1);
            transform: rotate(3deg);
            z-index: 10;
            border: 1px solid rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }

        .postit-note:hover {
            transform: rotate(0deg) scale(1.05);
            box-shadow: 
                0 10px 25px rgba(0,0,0,0.15),
                inset 0 -8px 8px -8px rgba(0,0,0,0.1),
                inset 8px 0 8px -8px rgba(0,0,0,0.1);
        }

        .postit-header {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 12px;
            padding-bottom: 8px;
            border-bottom: 1px dashed rgba(0,0,0,0.1);
        }

        .postit-header i {
            color: #f57c00;
            font-size: 20px;
        }

        .postit-header span {
            font-family: 'Orbitron', sans-serif;
            font-size: 14px;   /* MODIFICADO: 12px para 14px */
            color: #5d4037;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .postit-content {
            font-size: 15px;
            color: #5d4037;
            line-height: 1.4;
        }

        .credential-line {
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 10px 0;    /* MODIFICADO: 8px para 10px */
            padding: 6px;      /* MODIFICADO: 5px para 6px */
            background: rgba(255,255,255,0.5);
            border-radius: 4px;
            border-left: 3px solid #f57c00;
        }

        .credential-line i {
            color: #f57c00;
            font-size: 12px;   /* MODIFICADO: 10px para 12px */
            width: 16px;       /* MODIFICADO: 14px para 16px */
            text-align: center;
        }

        .credential-line strong {
            font-weight: 600;
            color: #5d4037;
            font-size: 12px;   /* MODIFICADO: 10px para 12px */
            min-width: 45px;   /* MODIFICADO: 40px para 45px */
        }

        .credential-line span {
            font-family: 'Courier New', monospace;
            font-size: 12px;   /* JÁ ESTAVA CORRETO (12px) */
            color: #d84315;
            font-weight: 600;
            flex: 1;
        }

        .postit-note::before {
            content: '';
            position: absolute;
            top: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 20px;
            height: 5px;
            background: rgba(0,0,0,0.05);
            border-radius: 50%;
        }

        .orion-header {
            text-align: center;
            margin-bottom: 20px;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        .orion-logo {
            font-family: 'Orbitron', sans-serif;
            font-size: 40px;
            color: var(--orion-blue);
            letter-spacing: 4px;
            text-shadow: 
                0 0 12px rgba(0,188,212,var(--glow-intensity)),
                0 0 24px rgba(0,188,212,0.3);
            position: relative;
            margin-bottom: 10px;
        }

        .orion-logo::before {
            content: '🚀';
            position: absolute;
            left: -45px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 24px;
            animation: rocketFloat 4s ease-in-out infinite;
        }

        .orion-logo::after {
            content: '🪐';
            position: absolute;
            right: -45px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 24px;
            animation: planetRotate 10s linear infinite;
        }

        @keyframes rocketFloat {
            0%, 100% { transform: translateY(-50%) rotate(0deg); }
            25% { transform: translateY(-60%) rotate(5deg); }
            75% { transform: translateY(-40%) rotate(-5deg); }
        }

        @keyframes planetRotate {
            0% { transform: translateY(-50%) rotate(0deg); }
            100% { transform: translateY(-50%) rotate(360deg); }
        }

        .orion-subtitle {
            font-size: 14px;
            color: #64748b;
            margin-top: 5px;
            letter-spacing: 2px;
        }

        .orion-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 
                0 20px 40px rgba(0,188,212,0.25),
                0 0 0 1px rgba(0,188,212,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .orion-card::before {
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

        .mission-card:hover {
            transform: translateY(-5px);
            box-shadow: 
                0 25px 50px rgba(0,188,212,0.35),
                0 0 0 1px rgba(0,188,212,0.15);
        }

        .mission-box {
            text-align: center;
            margin-bottom: 25px;
        }

        .mission-box h2 {
            font-family: 'Orbitron', sans-serif;
            color: var(--orion-blue);
            font-size: 22px;
            margin-bottom: 12px;
            letter-spacing: 3px;
            position: relative;
            display: inline-block;
        }

        .mission-box h2::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--orion-blue), transparent);
        }

        .mission-box p {
            font-size: 14px;
            color: #475569;
            line-height: 1.6;
        }

        .form-control {
            border-radius: 12px;
            padding: 14px 16px;
            border: 1px solid #cbd5e1;
            font-family: 'Roboto', sans-serif;
            transition: all 0.3s ease;
            background: rgba(255,255,255,0.9);
            color: var(--orion-dark);
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .form-control:focus {
            border-color: var(--orion-blue);
            box-shadow: 
                0 0 0 3px rgba(0,188,212,0.25),
                inset 0 0 10px rgba(0,188,212,0.1);
            transform: scale(1.01);
            background: white;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--orion-blue);
            opacity: 0.7;
            transition: opacity 0.3s;
        }

        .form-control:focus + i {
            opacity: 1;
            animation: pulse 1s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: translateY(-50%) scale(1); }
            50% { transform: translateY(-50%) scale(1.1); }
        }

        .btn-orion {
            background: linear-gradient(135deg, #00bcd4, #0284c7);
            color: white;
            border: none;
            padding: 14px;
            border-radius: 14px;
            font-weight: bold;
            letter-spacing: 1.5px;
            font-family: 'Orbitron', sans-serif;
            font-size: 15px;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .btn-orion:hover {
            box-shadow: 
                0 10px 25px rgba(0,188,212,0.5),
                0 0 20px rgba(0,188,212,0.4);
            transform: translateY(-3px) scale(1.02);
            letter-spacing: 2px;
        }

        .btn-orion::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -60%;
            width: 40%;
            height: 200%;
            background: rgba(255,255,255,0.3);
            transform: rotate(30deg);
            transition: left 0.6s;
        }

        .btn-orion:hover::after {
            left: 120%;
        }

        .btn-orion.loading {
            opacity: 0.8;
            cursor: not-allowed;
        }

        .spinner {
            display: inline-block;
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top-color: white;
            animation: spin 0.8s linear infinite;
            margin-right: 8px;
            vertical-align: middle;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .mission-card {
            margin-bottom: 25px;
        }

        .login-card {
            margin-top: 10px;
        }

        .status-online {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 8px 20px;
            border-radius: 20px;
            background: rgba(224, 251, 255, 0.9);
            color: #0ea5e9;
            font-size: 13px;
            font-weight: 500;
            letter-spacing: 0.8px;
            box-shadow: 
                0 5px 15px rgba(14,165,233,0.2),
                inset 0 1px 0 rgba(255,255,255,0.9);
            animation: statusPulse 2s infinite;
            margin-bottom: 5px;
            border: 1px solid rgba(14,165,233,0.2);
        }

        @keyframes statusPulse {
            0%, 100% { 
                box-shadow: 
                    0 5px 15px rgba(14,165,233,0.2),
                    inset 0 1px 0 rgba(255,255,255,0.9);
            }
            50% { 
                box-shadow: 
                    0 8px 20px rgba(14,165,233,0.3),
                    inset 0 1px 0 rgba(255,255,255,0.9);
            }
        }

        .status-online .dot {
            width: 10px;
            height: 10px;
            background: #38bdf8;
            border-radius: 50%;
            box-shadow:
                0 0 10px rgba(56,189,248,0.8),
                0 0 20px rgba(56,189,248,0.4);
            animation: pulseBlue 1.5s infinite;
        }

        @keyframes pulseBlue {
            0%, 100% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.4);
                opacity: 0.8;
            }
        }

        /* Terminal effect */
        .terminal-text {
            font-family: 'Courier New', monospace;
            color: var(--orion-blue);
            font-size: 12px;
            opacity: 0.8;
            margin-top: 10px;
            text-align: center;
            height: 20px;
            overflow: hidden;
        }

        /* Contador de tripulantes online */
        .crew-online {
            text-align: center;
            margin-top: 15px;
            font-size: 12px;
            color: #64748b;
        }

        .crew-count {
            color: var(--orion-blue);
            font-weight: bold;
            animation: countPulse 3s infinite;
        }

        @keyframes countPulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }

        /* Relógio da missão */
        .mission-clock {
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            font-size: 11px;
            color: #64748b;
            margin-top: 10px;
            letter-spacing: 1px;
        }

        .mission-time {
            color: var(--orion-blue);
            font-weight: bold;
        }

        /* Alertas do sistema */
        .system-alerts {
            position: fixed;
            bottom: 20px;
            left: 20px;
            right: 20px;
            text-align: center;
            font-size: 11px;
            color: #64748b;
            opacity: 0.8;
            z-index: 1;
        }

        .alert-danger {
            animation: shake 0.4s;
        }

        @keyframes shake {
            0% { transform: translateX(0); }
            25% { transform: translateX(-6px); }
            50% { transform: translateX(6px); }
            75% { transform: translateX(-6px); }
            100% { transform: translateX(0); }
        }

        /* Label dos formulários */
        .form-label {
            color: #334155;
            font-weight: 500;
        }

        /* Texto do rodapé */
        .text-muted {
            color: #64748b !important;
        }

        /* Responsividade */
        @media (max-width: 768px) {
            .orion-logo::before,
            .orion-logo::after {
                display: none;
            }
            
            .postit-note {
                position: relative;
                top: auto;
                right: auto;
                width: 100%;
                max-width: 220px;  /* MODIFICADO: 200px para 220px */
                margin: 20px auto;
                transform: rotate(1deg);
            }
            
            .orion-container {
                max-width: 90%;
            }
        }

        /* Holographic effect */
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
    </style>
</head>

<body>
    <!-- Partículas de fundo (MAIS ESCURAS) -->
    <div id="particles-js"></div>

    <!-- Post-it de credenciais -->
    <div class="postit-note">
        <div class="postit-header">
            <i class="fas fa-key"></i>
            <span>ACESSO TESTE</span>
        </div>
        <div class="postit-content">
            <div class="credential-line">
                <i class="fas fa-envelope"></i>
                <strong>Email:</strong>
                <span>adm@orion.com</span>
            </div>
            <div class="credential-line">
                <i class="fas fa-lock"></i>
                <strong>Senha:</strong>
                <span>123456</span>
            </div>
        </div>
    </div>

    <div class="orion-container">
        <!-- HEADER -->
        <div class="orion-header">
            <div class="orion-logo">EXPLORAÇÃO ORION</div>
            <div class="orion-subtitle">Painel de Controle da Nave Interplanetária</div>
        </div>
        
        <!-- STATUS ONLINE -->
        <div class="text-center mt-3">
            <div class="status-online">
                <span class="dot"></span>
                Sistema Online
                <span class="ms-2">v4.2.1</span>
            </div>
        </div>

        <!-- CARD MISSÃO -->
        <div class="orion-card mission-card hologram">
            <div class="mission-box">
                <h2>MISSÃO ORION</h2>
                <p>
                    Exploração de recursos estratégicos no planeta Marte,
                    coordenando tripulações e operações de forma segura e eficiente.
                </p>
                
                <!-- Relógio da missão -->
                <div class="mission-clock">
                    <i class="fas fa-clock"></i> Tempo de Missão: 
                    <span class="mission-time" id="missionTime">00:00:00</span>
                </div>
                
                <!-- Contador de tripulantes -->
                <div class="crew-online">
                    <i class="fas fa-users"></i> Tripulantes Ativos: 
                    <span class="crew-count" id="crewCount">12</span>
                </div>
                
                <div class="terminal-text" id="terminalOutput"></div>
            </div>
        </div>
        
        <!-- MENSAGEM DE ERRO -->
        <% if (request.getAttribute("erro") != null) { %>
        <div class="alert alert-danger text-center mb-3"
             style="
                border-radius: 14px;
                background: rgba(224, 251, 255, 0.9);
                color: #dc2626;
                border: 1px solid rgba(220, 38, 38, 0.2);
                box-shadow: 0 5px 15px rgba(220, 38, 38, 0.2);
             ">
            <i class="fas fa-triangle-exclamation me-2"></i>
            <%= request.getAttribute("erro") %>
        </div>
        <% } %>

        <!-- CARD LOGIN -->
        <div class="orion-card login-card">
            <form action="login" method="post" id="loginForm">
                <div class="mb-4 input-icon">
                    <label class="form-label">
                        <i class="fas fa-user-astronaut me-2"></i>ID de Tripulante
                    </label>
                    <input type="email" name="email" class="form-control"
                           placeholder="tripulante@orion.com" required
                           id="emailInput">
                    <i class="fas fa-id-card"></i>
                </div>

                <div class="mb-4 input-icon">
                    <label class="form-label">
                        <i class="fas fa-key me-2"></i>Código de Acesso
                    </label>
                    <input type="password" name="senha" class="form-control"
                           placeholder="••••••••" required
                           id="passwordInput">
                    <i class="fas fa-lock"></i>
                </div>

                <button type="submit" class="btn btn-orion w-100 mt-3" id="btnLogin">
                    <i class="fas fa-rocket me-2"></i>
                    <span id="btnText">INICIAR SESSÃO</span>
                </button>

                <div class="text-center mt-4">
                    <small class="text-muted">
                        <i class="fas fa-shield-alt me-1"></i>
                        Conexão segura • Protocolo TLS 1.3 • Criptografia AES-256
                    </small>
                </div>
            </form>
        </div>
        
        <!-- Alertas do sistema -->
        <div class="system-alerts">
            <i class="fas fa-satellite me-1"></i>
            Sinal estável • Latência: 45ms • Conexão com Terra: OK
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

    <script>
        // Terminal effect
        const terminalMessages = [
            "> Inicializando sistemas...",
            "> Verificando conexão segura...",
            "> Sistema de navegação: OK",
            "> Escudos ativos: 100%",
            "> Aguardando autenticação...",
            "> Conexão com Terra estabelecida",
            "> Satélites de comunicação: ONLINE",
            "> Pronto para receber credenciais"
        ];

        let currentMessage = 0;
        let charIndex = 0;
        let isDeleting = false;

        function typeTerminalText() {
            const terminal = document.getElementById('terminalOutput');
            const message = terminalMessages[currentMessage];
            
            if (!isDeleting && charIndex < message.length) {
                terminal.textContent = message.substring(0, charIndex + 1);
                charIndex++;
                setTimeout(typeTerminalText, 50);
            } else if (isDeleting && charIndex > 0) {
                terminal.textContent = message.substring(0, charIndex - 1);
                charIndex--;
                setTimeout(typeTerminalText, 30);
            } else {
                isDeleting = !isDeleting;
                if (!isDeleting) {
                    currentMessage = (currentMessage + 1) % terminalMessages.length;
                }
                setTimeout(typeTerminalText, 1000);
            }
        }

        // Relógio da missão
        function updateMissionClock() {
            const now = new Date();
            const missionStart = new Date('2026-01-01T00:00:00');
            const diff = now - missionStart;
            
            const hours = Math.floor(diff / 3600000) % 24;
            const minutes = Math.floor(diff / 60000) % 60;
            const seconds = Math.floor(diff / 1000) % 60;
            
            const timeString = 
                hours.toString().padStart(2, '0') + ':' +
                minutes.toString().padStart(2, '0') + ':' +
                seconds.toString().padStart(2, '0');
            
            document.getElementById('missionTime').textContent = timeString;
        }

        // Contador de tripulantes (simulação)
        function updateCrewCount() {
            const countElement = document.getElementById('crewCount');
            const baseCount = 12;
            const variation = Math.floor(Math.random() * 3) - 1; // -1, 0, ou 1
            const newCount = Math.max(1, baseCount + variation);
            
            countElement.style.transform = 'scale(1.2)';
            setTimeout(() => {
                countElement.style.transform = 'scale(1)';
            }, 300);
            
            countElement.textContent = newCount;
        }

        // Preencher automaticamente as credenciais quando clicar no post-it
        document.querySelector('.postit-note').addEventListener('click', function() {
            document.getElementById('emailInput').value = 'adm@orion.com';
            document.getElementById('passwordInput').value = '123456';
            
            // Feedback visual
            this.style.transform = 'rotate(0deg) scale(1.1)';
            setTimeout(() => {
                this.style.transform = 'rotate(3deg) scale(1)';
            }, 300);
            
            // Focar no email input
            document.getElementById('emailInput').focus();
        });

        // Form submission
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const btn = document.getElementById('btnLogin');
            const btnText = document.getElementById('btnText');
            
            btn.classList.add('loading');
            btnText.innerHTML = '<span class="spinner"></span> AUTENTICANDO...';
            
            // Simular delay de autenticação
            setTimeout(() => {
                // Enviar form após animação
                this.submit();
            }, 1500);
        });

        // Input effects
        document.getElementById('emailInput').addEventListener('focus', function() {
            document.documentElement.style.setProperty('--glow-intensity', '1');
        });

        document.getElementById('emailInput').addEventListener('blur', function() {
            document.documentElement.style.setProperty('--glow-intensity', '0.7');
        });

        // Efeito de digitação nos inputs
        const inputs = document.querySelectorAll('.form-control');
        inputs.forEach(input => {
            input.addEventListener('input', function() {
                if (this.value.length > 0) {
                    this.style.boxShadow = '0 0 15px rgba(0,188,212,0.2)';
                } else {
                    this.style.boxShadow = '';
                }
            });
        });

        // Inicializar partículas MAIS ESCURAS
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
                    value: "#0077b6"  // Azul mais escuro
                },
                shape: { 
                    type: "circle" 
                },
                opacity: { 
                    value: 0.5,  // Mais opaco
                    random: true,
                    anim: {
                        enable: true,
                        speed: 1,
                        opacity_min: 0.3,
                        sync: false
                    }
                },
                size: { 
                    value: 4,  // Maior
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
                    opacity: 0.4,  // Mais opaco
                    width: 1.2
                },
                move: {
                    enable: true,
                    speed: 1.2,
                    direction: "none",
                    random: true,
                    straight: false,
                    out_mode: "out"
                }
            },
            interactivity: {
                events: {
                    onhover: { 
                        enable: true, 
                        mode: "grab"
                    },
                    onclick: { 
                        enable: true, 
                        mode: "push" 
                    }
                },
                modes: {
                    grab: {
                        distance: 140,
                        line_linked: {
                            opacity: 0.6
                        }
                    },
                    push: {
                        particles_nb: 4
                    }
                }
            }
        });

        // Inicializar elementos
        typeTerminalText();
        updateMissionClock();
        updateCrewCount();
        
        // Atualizar relógio a cada segundo
        setInterval(updateMissionClock, 1000);
        
        // Atualizar contador de tripulantes a cada 30 segundos
        setInterval(updateCrewCount, 30000);
        
        // Efeito de entrada
        document.body.style.opacity = '0';
        setTimeout(() => {
            document.body.style.transition = 'opacity 1s';
            document.body.style.opacity = '1';
        }, 100);
    </script>
</body>
</html>