<%-- 
    Document   : dashboard
    Created on : 4 de jan. de 2026, 22:23:11
    Author     : Dyego
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Usuario" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Painel da Nave ORION</title>

    <!-- Fontes Futuristas -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

    <!-- Ícones Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Bootstrap (opcional, se quiser usar alguns componentes) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    :root { 
      --orion-blue: #00bcd4;
      --orion-blue-light: #e0fbff;
      --orion-white: #ffffff;
      --orion-dark: #0f172a;
      --orion-glow: 0.6;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      min-height: 100vh;
      background: linear-gradient(180deg, #ffffff, #e0fbff);
      font-family: 'Roboto', sans-serif;
      color: var(--orion-dark);
      font-size: 18px;
      overflow-x: hidden;
    }

    /* Partículas de fundo - NOVO */
    #particles-js {
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: -1;
        background: rgba(255, 255, 255, 0.3); /* Fundo levemente branco para contraste */
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 40px 20px;
      position: relative;
      z-index: 1;
    }

    /* HEADER FUTURISTA */
    .header {
      text-align: center;
      margin-bottom: 60px;
      position: relative;
      padding: 30px 0;
    }

    .header::before {
      content: '';
      position: absolute;
      top: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 300px;
      height: 1px;
      background: linear-gradient(90deg, 
          transparent, 
          var(--orion-blue), 
          transparent);
    }

    .header::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 200px;
      height: 1px;
      background: linear-gradient(90deg, 
          transparent, 
          rgba(0,188,212,0.5), 
          transparent);
    }

    .logo {
      font-family: 'Orbitron', sans-serif;
      color: var(--orion-blue);
      letter-spacing: 6px;
      font-size: 3.5rem;
      font-weight: 700;
      margin-bottom: 20px;
      text-transform: uppercase;
      text-shadow: 
          0 0 20px rgba(0,188,212,var(--orion-glow)),
          0 0 40px rgba(0,188,212,0.4),
          0 0 60px rgba(0,188,212,0.2);
      position: relative;
      display: inline-block;
      animation: float 6s ease-in-out infinite;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-8px); }
    }

    .logo::before {
      content: '▶';
      position: absolute;
      left: -40px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 1.5rem;
      animation: blink 2s infinite;
      color: var(--orion-blue);
    }

    .logo::after {
      content: '◀';
      position: absolute;
      right: -40px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 1.5rem;
      animation: blink 2s infinite reverse;
      color: var(--orion-blue);
    }

    @keyframes blink {
      0%, 100% { opacity: 1; }
      50% { opacity: 0.3; }
    }

    .subtitle {
      color: #64748b;
      font-size: 1.2rem;
      font-weight: 300;
      letter-spacing: 2px;
      background: rgba(255,255,255,0.8);
      padding: 15px 30px;
      border-radius: 12px;
      display: inline-block;
      backdrop-filter: blur(10px);
      border: 1px solid rgba(0,188,212,0.1);
      box-shadow: 0 10px 30px rgba(0,188,212,0.1);
      position: relative;
      overflow: hidden;
    }

    .subtitle::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, 
          transparent, 
          rgba(0,188,212,0.1), 
          transparent);
      animation: subtitleGlow 3s linear infinite;
    }

    @keyframes subtitleGlow {
      0% { left: -100%; }
      100% { left: 100%; }
    }

    .subtitle strong {
      color: var(--orion-blue);
      font-weight: 600;
      font-family: 'Orbitron', sans-serif;
      letter-spacing: 1px;
    }

    /* GRID DE CARDS FUTURISTA */
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 30px;
      margin: 50px 0;
    }

    .card {
      background: rgba(255, 255, 255, 0.85);
      border-radius: 20px;
      padding: 30px 25px;
      box-shadow: 
          0 15px 35px rgba(0,188,212,0.15),
          inset 0 1px 0 rgba(255,255,255,0.8);
      text-align: center;
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      position: relative;
      overflow: hidden;
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255,255,255,0.3);
    }

    .card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 4px;
      background: linear-gradient(90deg, 
          var(--orion-blue), 
          #3b82f6, 
          var(--orion-blue));
      background-size: 200% 100%;
      animation: cardGlow 3s linear infinite;
    }

    @keyframes cardGlow {
      0% { background-position: 200% 0; }
      100% { background-position: -200% 0; }
    }

    .card:hover {
      transform: translateY(-10px) scale(1.02);
      box-shadow: 
          0 25px 50px rgba(0,188,212,0.25),
          0 0 30px rgba(0,188,212,0.2),
          inset 0 1px 0 rgba(255,255,255,0.9);
      background: rgba(255, 255, 255, 0.95);
    }

    .card h3 {
      font-family: 'Orbitron', sans-serif;
      color: var(--orion-blue);
      margin-bottom: 15px;
      font-size: 1.5rem;
      font-weight: 600;
      letter-spacing: 1.5px;
      position: relative;
      display: inline-block;
      padding-bottom: 10px;
    }

    .card h3::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 40px;
      height: 2px;
      background: linear-gradient(90deg, 
          transparent, 
          var(--orion-blue), 
          transparent);
    }

    .card p {
      color: #475569;
      font-size: 0.95rem;
      line-height: 1.6;
      margin-bottom: 20px;
      min-height: 60px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    /* BOTÃO ORION AVANÇADO */
    .btn-orion {
      margin-top: 10px;
      background: linear-gradient(135deg, #00bcd4, #0284c7);
      color: white;
      border: none;
      padding: 14px 28px;
      border-radius: 14px;
      font-weight: 600;
      cursor: pointer;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      font-family: 'Orbitron', sans-serif;
      letter-spacing: 1.5px;
      font-size: 0.9rem;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
      z-index: 1;
      text-transform: uppercase;
    }

    .btn-orion::before {
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

    .btn-orion:hover::before {
      left: 100%;
    }

    .btn-orion:hover {
      box-shadow: 
          0 15px 30px rgba(0,188,212,0.4),
          0 0 20px rgba(0,188,212,0.3);
      transform: translateY(-3px) scale(1.05);
      letter-spacing: 2px;
    }

    .btn-orion:active {
      transform: translateY(-1px) scale(1.02);
    }

    /* ÁREA DE LOGOUT */
    .logout {
      text-align: center;
      margin-top: 60px;
      padding-top: 40px;
      position: relative;
    }

    .logout::before {
      content: '';
      position: absolute;
      top: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 300px;
      height: 1px;
      background: linear-gradient(90deg, 
          transparent, 
          rgba(0,188,212,0.3), 
          transparent);
    }

    /* EFEITOS ESPECIAIS PARA ÍCONES */
    .card i {
      font-size: 2.5rem;
      margin-bottom: 15px;
      color: var(--orion-blue);
      display: block;
      transition: transform 0.3s ease;
    }

    .card:hover i {
      transform: scale(1.2) rotate(5deg);
      animation: iconFloat 2s ease-in-out infinite;
    }

    @keyframes iconFloat {
      0%, 100% { transform: scale(1.2) rotate(5deg) translateY(0); }
      50% { transform: scale(1.2) rotate(5deg) translateY(-5px); }
    }

    /* RESPONSIVIDADE */
    @media (max-width: 768px) {
      .container {
        padding: 20px 15px;
      }
      
      .logo {
        font-size: 2.5rem;
        letter-spacing: 4px;
      }
      
      .grid {
        grid-template-columns: 1fr;
        gap: 20px;
      }
      
      .card {
        padding: 25px 20px;
      }
      
      .btn-orion {
        padding: 12px 24px;
        font-size: 0.85rem;
      }
    }

    @media (max-width: 480px) {
      .logo {
        font-size: 2rem;
        letter-spacing: 3px;
      }
      
      .logo::before,
      .logo::after {
        display: none;
      }
      
      .subtitle {
        font-size: 1rem;
        padding: 12px 20px;
      }
    }

    /* ANIMAÇÃO DE ENTRADA DOS CARDS */
    @keyframes cardEntrance {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .card {
      animation: cardEntrance 0.6s ease-out forwards;
      opacity: 0;
    }

    .card:nth-child(1) { animation-delay: 0.1s; }
    .card:nth-child(2) { animation-delay: 0.2s; }
    .card:nth-child(3) { animation-delay: 0.3s; }

    /* STATUS INDICATOR */
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
      background: #22c55e;
      border-radius: 50%;
      animation: statusPulse 2s infinite;
    }

    @keyframes statusPulse {
      0%, 100% { 
        box-shadow: 0 0 0 0 rgba(34, 197, 94, 0.7);
        opacity: 1;
      }
      50% { 
        box-shadow: 0 0 0 6px rgba(34, 197, 94, 0);
        opacity: 0.8;
      }
    }

    /* Efeito holográfico nos cards - NOVO */
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

<!-- Partículas de fundo - NOVO -->
<div id="particles-js"></div>

<!-- Status Indicator -->
<div class="status-indicator">
    <span class="status-dot"></span>
    SISTEMA ONLINE
</div>

<div class="container">

    <!-- HEADER FUTURISTA -->
    <div class="header">
        <div class="logo">PAINEL ORION</div>
        <div class="subtitle">
            <i class="fas fa-user-astronaut"></i>
            Tripulante: <strong><%= usuario.getNome() %></strong> |
            <i class="fas fa-briefcase"></i>
            Cargo: <strong><%= usuario.getCargo() %></strong>
        </div>
    </div>

    <!-- GRID DE CARDS FUTURISTA -->
    <div class="grid">

        <div class="card hologram">
            <i class="fas fa-cogs"></i>
            <h3>⚙️ SISTEMA</h3>
            <p>Monitoramento completo do status geral da nave e sistemas críticos</p>
            <a href="status.jsp" class="btn-orion">
                <i class="fas fa-terminal"></i>
                ACESSAR
            </a>
        </div>

        <div class="card hologram">
            <i class="fas fa-users"></i>
            <h3>👥 TRIPULAÇÃO</h3>
            <p>Gerenciamento avançado de tripulantes e equipes da missão</p>
            <a href="usuarios" class="btn-orion">
                <i class="fas fa-user-shield"></i>
                ACESSAR
            </a>
        </div>

        <div class="card hologram">
            <i class="fas fa-bolt"></i>
            <h3>🔋 ENERGIA</h3>
            <p>Controle e monitoramento dos níveis de energia da nave</p>
            <a href="energia.jsp" class="btn-orion">
                <i class="fas fa-charging-station"></i>
                VER DASHBOARD
            </a>
        </div>

    </div>

    <!-- LOGOUT FUTURISTA -->
    <div class="logout">
        <a href="logout" class="btn-orion">
            <i class="fas fa-sign-out-alt"></i>
            ENCERRAR SESSÃO
        </a>
    </div>

</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<script>
    // Inicializar partículas COM CONFIGURAÇÃO MAIS ESCURA (igual ao login)
    particlesJS('particles-js', {
        particles: {
            number: { 
                value: 60,  // Aumentei a quantidade
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
                value: 0.6,  // Aumentei a opacidade
                random: true,
                anim: {
                    enable: true,
                    speed: 1,
                    opacity_min: 0.3,
                    sync: false
                }
            },
            size: { 
                value: 4,  // Aumentei o tamanho
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
                distance: 120,  // Diminuí a distância para mais conexões
                color: "#0077b6",  // Mesma cor mais escura
                opacity: 0.4,  // Aumentei a opacidade das linhas
                width: 1.5  // Aumentei a espessura
            },
            move: {
                enable: true,
                speed: 1.5,  // Aumentei a velocidade
                direction: "none",
                random: true,
                straight: false,
                out_mode: "out",
                bounce: false,
                attract: {
                    enable: false,
                    rotateX: 600,
                    rotateY: 1200
                }
            }
        },
        interactivity: {
            detect_on: "canvas",
            events: {
                onhover: { 
                    enable: true, 
                    mode: "grab"  // Mudei para "grab" para ser mais visível
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
                        opacity: 0.8  // Mais visível ao passar o mouse
                    }
                },
                push: {
                    particles_nb: 4
                }
            }
        },
        retina_detect: true
    });

    // Efeito de digitação no logo
    document.addEventListener('DOMContentLoaded', function() {
        // Adicionar efeito de hover nos cards
        const cards = document.querySelectorAll('.card');
        
        cards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.setProperty('--orion-glow', '1');
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.setProperty('--orion-glow', '0.6');
            });
        });
        
        // Efeito de brilho interativo com as partículas
        document.addEventListener('mousemove', function(e) {
            const cards = document.querySelectorAll('.card');
            const mouseX = e.clientX / window.innerWidth;
            const mouseY = e.clientY / window.innerHeight;
            
            cards.forEach(card => {
                const rect = card.getBoundingClientRect();
                const cardCenterX = rect.left + rect.width / 2;
                const cardCenterY = rect.top + rect.height / 2;
                
                const distanceX = Math.abs(e.clientX - cardCenterX);
                const distanceY = Math.abs(e.clientY - cardCenterY);
                const distance = Math.sqrt(distanceX * distanceX + distanceY * distanceY);
                
                if (distance < 200) {
                    const intensity = 1 - (distance / 200);
                    card.style.boxShadow = 
                        `0 25px 50px rgba(0,188,212,${0.15 + intensity * 0.2}),
                         0 0 ${30 + intensity * 20}px rgba(0,188,212,${0.2 + intensity * 0.3})`;
                }
            });
        });
        
        // Animar entrada dos elementos
        setTimeout(() => {
            document.body.style.opacity = '1';
        }, 100);
    });
</script>

</body>
</html>