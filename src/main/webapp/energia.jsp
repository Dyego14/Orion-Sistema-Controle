<%-- 
    Document   : energia
    Created on : 5 de jan. de 2026, 23:11:45
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
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Controle de Energia - ORION</title>

    <!-- Fontes Futuristas -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;600;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

    <!-- Ícones Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
    :root { 
      --orion-blue: #00bcd4;
      --orion-blue-light: #e0fbff;
      --orion-white: #ffffff;
      --orion-dark: #0f172a;
      --orion-gray: #64748b;
      --energy-green: #22c55e;
      --energy-yellow: #fbbf24;
      --energy-red: #ef4444;
    }

    body {
      margin: 0;
      min-height: 100vh;
      background: linear-gradient(180deg, #ffffff, #e0fbff);
      font-family: 'Roboto', sans-serif;
      color: var(--orion-dark);
      font-size: 18px;
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

    .container {
      max-width: 1000px;
      margin: auto;
      padding: 40px 20px;
      position: relative;
      z-index: 1;
    }

    /* HEADER FUTURISTA */
    .header {
      text-align: center;
      margin-bottom: 40px;
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
      font-size: 3rem;
      font-weight: 700;
      margin-bottom: 15px;
      text-shadow: 
          0 0 20px rgba(0,188,212,0.7),
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
      content: '⚡';
      position: absolute;
      left: -40px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 2rem;
      animation: blink 2s infinite;
      color: var(--energy-green);
    }

    .logo::after {
      content: '⚡';
      position: absolute;
      right: -40px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 2rem;
      animation: blink 2s infinite reverse;
      color: var(--energy-green);
    }

    @keyframes blink {
      0%, 100% { opacity: 1; }
      50% { opacity: 0.3; }
    }

    .subtitle {
      color: var(--orion-gray);
      font-size: 1.1rem;
      letter-spacing: 2px;
      background: rgba(255,255,255,0.8);
      padding: 12px 25px;
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

    /* CARDS FUTURISTAS */
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
      margin-bottom: 30px;
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
          var(--energy-green), 
          var(--orion-blue));
      background-size: 200% 100%;
      animation: cardGlow 3s linear infinite;
    }

    @keyframes cardGlow {
      0% { background-position: 200% 0; }
      100% { background-position: -200% 0; }
    }

    .card:hover {
      transform: translateY(-5px);
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
      font-size: 1.8rem;
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
      width: 80px;
      height: 2px;
      background: linear-gradient(90deg, 
          transparent, 
          var(--orion-blue), 
          transparent);
    }

    /* BARRAS DE PROGRESSO FUTURISTAS */
    .progress-container {
      margin: 25px 0;
      position: relative;
    }

    .progress-label {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
      font-weight: 500;
    }

    .progress-label span:last-child {
      font-family: 'Orbitron', sans-serif;
      color: var(--orion-blue);
      font-weight: 600;
    }

    .progress-bar {
      width: 100%;
      height: 30px;
      background: rgba(229, 231, 235, 0.7);
      border-radius: 15px;
      overflow: hidden;
      position: relative;
      border: 2px solid rgba(255,255,255,0.8);
      box-shadow: 
          inset 0 2px 5px rgba(0,0,0,0.1),
          0 5px 15px rgba(0,0,0,0.05);
    }

    .progress {
      height: 100%;
      color: white;
      font-weight: bold;
      text-align: right;
      padding-right: 15px;
      line-height: 30px;
      font-family: 'Orbitron', sans-serif;
      letter-spacing: 1px;
      position: relative;
      transition: width 1.5s ease-in-out;
    }

    .progress::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(90deg, 
          transparent, 
          rgba(255,255,255,0.4), 
          transparent);
      animation: progressShine 2s infinite;
    }

    @keyframes progressShine {
      0% { transform: translateX(-100%); }
      100% { transform: translateX(100%); }
    }

    /* BARRAS DE ENERGIA ESPECÍFICAS */
    .energy-progress {
      background: linear-gradient(90deg, var(--energy-green), #4ade80);
      width: 82%;
    }

    .mission-progress {
      background: linear-gradient(90deg, var(--orion-blue), #0284c7);
      width: 68%;
    }

    .regen-progress {
      background: linear-gradient(90deg, #3b82f6, #60a5fa);
      width: 45%;
    }

    .shield-progress {
      background: linear-gradient(90deg, #8b5cf6, #a78bfa);
      width: 91%;
    }

    /* GRID DE STATUS DE ENERGIA */
    .energy-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 25px;
      margin: 40px 0;
    }

    .energy-card {
      background: rgba(255, 255, 255, 0.85);
      border-radius: 18px;
      padding: 25px;
      box-shadow: 
          0 10px 25px rgba(0,188,212,0.15),
          inset 0 1px 0 rgba(255,255,255,0.8);
      text-align: center;
      transition: all 0.3s ease;
      position: relative;
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255,255,255,0.3);
    }

    .energy-card:hover {
      transform: translateY(-5px);
      box-shadow: 
          0 20px 40px rgba(0,188,212,0.25),
          0 0 25px rgba(0,188,212,0.15);
    }

    .energy-card i {
      font-size: 2.5rem;
      margin-bottom: 15px;
      display: block;
    }

    .energy-card.distance i { color: var(--orion-blue); }
    .energy-card.speed i { color: var(--energy-green); }
    .energy-card.time i { color: var(--energy-yellow); }
    .energy-card.status i { color: #8b5cf6; }

    .energy-card span {
      color: var(--orion-gray);
      font-size: 0.9em;
      display: block;
      margin-bottom: 5px;
    }

    .energy-card p {
      font-size: 1.5em;
      font-weight: bold;
      font-family: 'Orbitron', sans-serif;
      letter-spacing: 1px;
    }

    .energy-card.distance p { color: var(--orion-blue); }
    .energy-card.speed p { color: var(--energy-green); }
    .energy-card.time p { color: var(--energy-yellow); }
    .energy-card.status p { color: #22c55e; }

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
      background: var(--energy-green);
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

    /* BOTÃO ORION FUTURISTA */
    .btn-orion {
      background: linear-gradient(135deg, var(--orion-blue), #0284c7);
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

    .center {
      text-align: center;
      margin-top: 40px;
    }

    /* ANIMAÇÃO DE ENTRADA */
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

    .card, .energy-card {
      animation: fadeIn 0.6s ease-out forwards;
    }

    /* RESPONSIVIDADE */
    @media (max-width: 768px) {
      .container {
        padding: 20px 15px;
      }
      
      .logo {
        font-size: 2rem;
        letter-spacing: 4px;
      }
      
      .logo::before,
      .logo::after {
        display: none;
      }
      
      .energy-grid {
        grid-template-columns: 1fr;
        gap: 15px;
      }
      
      .card {
        padding: 25px 20px;
      }
      
      .btn-orion {
        padding: 12px 24px;
        font-size: 0.85rem;
      }
    }

    /* SISTEMAS DE ENERGIA ADICIONAIS */
    .systems-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 25px;
      margin: 40px 0;
    }

    .system-card {
      background: rgba(255, 255, 255, 0.85);
      border-radius: 18px;
      padding: 25px;
      box-shadow: 0 10px 25px rgba(0,188,212,0.15);
      transition: all 0.3s ease;
      position: relative;
    }

    .system-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px rgba(0,188,212,0.25);
    }
    </style>
</head>

<body>

<!-- Partículas de fundo -->
<div id="particles-js"></div>

<!-- Status Indicator -->
<div class="status-indicator">
    <span class="status-dot"></span>
    ENERGIA: 82%
</div>

<div class="container">

    <!-- HEADER -->
    <div class="header">
        <div class="logo">⚡ CONTROLE DE ENERGIA</div>
        <div class="subtitle">Nave ORION - Sistema de Gerenciamento de Energia</div>
    </div>

    <!-- CARD PRINCIPAL DE ENERGIA -->
    <div class="card">
        <h3><i class="fas fa-bolt"></i> NÍVEL DE ENERGIA DA NAVE</h3>
        
        <div class="progress-container">
            <div class="progress-label">
                <span><i class="fas fa-car-battery"></i> Energia Total</span>
                <span>82%</span>
            </div>
            <div class="progress-bar">
                <div class="progress energy-progress"> 82% </div>
            </div>
        </div>

        <p style="color: var(--orion-gray); margin-top: 20px;">
            <i class="fas fa-info-circle"></i> 
            Status: <strong style="color: var(--energy-green);">Ótimo</strong> - 
            Capacidade suficiente para 92 dias de operação
        </p>
    </div>

    <!-- SISTEMAS DE ENERGIA -->
    <div class="systems-container">
        <div class="card">
            <h3><i class="fas fa-solar-panel"></i> ENERGIA SOLAR</h3>
            
            <div class="progress-container">
                <div class="progress-label">
                    <span>Coleta Atual</span>
                    <span>45%</span>
                </div>
                <div class="progress-bar">
                    <div class="progress regen-progress">45%</div>
                </div>
            </div>
            
            <p style="color: var(--orion-gray); margin-top: 15px;">
                <i class="fas fa-sun"></i> 
                Regeneração: 2.8% por hora
            </p>
        </div>

        <div class="card">
            <h3><i class="fas fa-shield-alt"></i> ESCUDOS</h3>
            
            <div class="progress-container">
                <div class="progress-label">
                    <span>Integridade</span>
                    <span>91%</span>
                </div>
                <div class="progress-bar">
                    <div class="progress shield-progress">91%</div>
                </div>
            </div>
            
            <p style="color: var(--orion-gray); margin-top: 15px;">
                <i class="fas fa-bolt"></i> 
                Consumo: 18% da energia total
            </p>
        </div>
    </div>

    <!-- CARD DE PROGRESSO DA MISSÃO -->
    <div class="card">
        <h3><i class="fas fa-rocket"></i> PROGRESSO DA MISSÃO</h3>
        
        <div class="progress-container">
            <div class="progress-label">
                <span><i class="fas fa-road"></i> Distância Percorrida</span>
                <span>69%</span>
            </div>
            <div class="progress-bar">
                <div class="progress mission-progress">69%</div>
            </div>
        </div>

        <p style="color: var(--orion-gray); margin-top: 20px;">
            <i class="fas fa-map-marker-alt"></i> 
            Status: <strong style="color: var(--orion-blue);">Em rota</strong> - 
            Fase: Cruzeiro interplanetário
        </p>
    </div>

    <!-- GRID DE INFORMAÇÕES -->
    <div class="energy-grid">
        <div class="energy-card distance">
            <i class="fas fa-ruler-combined"></i>
            <span>📏 Distância Percorrida</span>
            <p>152M km</p>
            <small style="color: var(--orion-gray);">Até Marte: 48M km</small>
        </div>

        <div class="energy-card speed">
            <i class="fas fa-tachometer-alt"></i>
            <span>⚡ Velocidade Atual</span>
            <p>98,000 km/h</p>
            <small style="color: var(--orion-gray);">Velocidade máxima: 120,000 km/h</small>
        </div>

        <div class="energy-card time">
            <i class="fas fa-clock"></i>
            <span>🕒 Tempo Restante</span>
            <p>72 dias</p>
            <small style="color: var(--orion-gray);">Chegada estimada: 18/03/2026</small>
        </div>

        <div class="energy-card status">
            <i class="fas fa-check-circle"></i>
            <span>🛠️ Status dos Sistemas</span>
            <p>Normais</p>
            <small style="color: var(--orion-gray);">Todos os sistemas operacionais</small>
        </div>
    </div>

    <!-- BOTÃO VOLTAR -->
    <div class="center">
        <a href="dashboard.jsp" class="btn-orion">
            <i class="fas fa-arrow-left"></i>
            VOLTAR AO PAINEL PRINCIPAL
        </a>
    </div>

</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

<script>
    // Inicializar partículas COM CONFIGURAÇÃO MAIS ESCURA
    particlesJS('particles-js', {
        particles: {
            number: { 
                value: 70, // Mais partículas para página de energia
                density: { 
                    enable: true, 
                    value_area: 800 
                } 
            },
            color: { 
                value: ["#00bcd4", "#22c55e", "#3b82f6"] // Múltiplas cores para energia
            },
            shape: { 
                type: "circle" 
            },
            opacity: { 
                value: 0.7, // Mais opaco para página de energia
                random: true,
                anim: {
                    enable: true,
                    speed: 1,
                    opacity_min: 0.4,
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
                distance: 100, // Menor distância para mais conexões
                color: "#00bcd4",
                opacity: 0.5, // Mais opaco
                width: 1.5
            },
            move: {
                enable: true,
                speed: 1.8, // Mais rápido para energia
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
                    distance: 150,
                    line_linked: {
                        opacity: 1 // Muito visível
                    }
                },
                push: {
                    particles_nb: 6 // Mais partículas ao clicar
                }
            }
        },
        retina_detect: true
    });

    // Animar barras de progresso ao carregar
    document.addEventListener('DOMContentLoaded', function() {
        const progressBars = document.querySelectorAll('.progress');
        
        progressBars.forEach(bar => {
            const width = bar.style.width;
            bar.style.width = '0%';
            
            setTimeout(() => {
                bar.style.width = width;
            }, 500);
        });

        // Atualizar dados em tempo real (simulação)
        setInterval(() => {
            const energyElement = document.querySelector('.energy-progress');
            const energyValue = parseInt(energyElement.style.width);
            
            // Simular pequena variação de energia
            const variation = (Math.random() * 0.5) - 0.25; // -0.25 a +0.25
            const newEnergy = Math.min(100, Math.max(0, energyValue + variation));
            
            energyElement.style.width = newEnergy.toFixed(1) + '%';
            energyElement.textContent = newEnergy.toFixed(1) + '%';
            
            // Atualizar status indicator
            const statusDot = document.querySelector('.status-dot');
            const statusText = document.querySelector('.status-indicator');
            
            if (newEnergy > 70) {
                statusDot.style.background = '#22c55e';
                statusText.innerHTML = '<span class="status-dot"></span> ENERGIA: ' + newEnergy.toFixed(1) + '%';
            } else if (newEnergy > 40) {
                statusDot.style.background = '#fbbf24';
                statusText.innerHTML = '<span class="status-dot"></span> ENERGIA: ' + newEnergy.toFixed(1) + '%';
            } else {
                statusDot.style.background = '#ef4444';
                statusText.innerHTML = '<span class="status-dot"></span> ENERGIA BAIXA: ' + newEnergy.toFixed(1) + '%';
            }
        }, 5000); // Atualizar a cada 5 segundos
    });
</script>

</body>
</html>