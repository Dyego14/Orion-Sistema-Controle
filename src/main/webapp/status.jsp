<%-- 
    Document   : status
    Created on : [Data da criação]
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
    <title>Status do Sistema - ORION</title>

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
            max-width: 900px;
            margin: 0 auto;
            padding: 30px 20px;
            position: relative;
            z-index: 1;
        }

        h1 {
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            color: #00bcd4;
            margin: 40px 0 20px;
            letter-spacing: 2px;
            font-size: 28px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 40px;
            font-size: 16px;
        }

        .card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0,188,212,0.15);
            border: 1px solid #e0f7fa;
            margin-bottom: 30px;
        }

        .card h2 {
            font-family: 'Orbitron', sans-serif;
            color: #00bcd4;
            margin-bottom: 25px;
            text-align: center;
            font-size: 22px;
        }

        .status-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .status-item {
            background: #f8fdff;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            border: 1px solid #e0f7fa;
            transition: transform 0.3s ease;
        }

        .status-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,188,212,0.1);
        }

        .status-item i {
            font-size: 32px;
            color: #00bcd4;
            margin-bottom: 15px;
        }

        .status-item h3 {
            color: #334155;
            margin: 10px 0 5px;
            font-size: 18px;
        }

        .status-item p {
            color: #64748b;
            font-size: 14px;
            margin: 0;
        }

        .status-online {
            color: #22c55e;
            font-weight: bold;
        }

        .status-warning {
            color: #f59e0b;
            font-weight: bold;
        }

        .progress-container {
            margin: 25px 0;
        }

        .progress-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: #475569;
            font-weight: 500;
        }

        .progress-bar {
            width: 100%;
            height: 20px;
            background: #e2e8f0;
            border-radius: 10px;
            overflow: hidden;
        }

        .progress {
            height: 100%;
            background: linear-gradient(90deg, #00bcd4, #0284c7);
            color: white;
            text-align: right;
            padding-right: 10px;
            font-size: 12px;
            line-height: 20px;
            font-weight: bold;
        }

        .footer-buttons {
            text-align: center;
            margin-top: 40px;
        }

        .btn {
            padding: 12px 28px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            border: none;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
        }

        .btn-back {
            background: white;
            color: #0284c7;
            border: 2px solid #0284c7;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .btn-back:hover {
            background: #0284c7;
            color: white;
        }

        .alert {
            background: #dcfce7;
            border: 1px solid #86efac;
            border-radius: 12px;
            padding: 15px;
            margin: 20px 0;
            color: #166534;
            text-align: center;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
            }
            
            h1 {
                font-size: 22px;
            }
            
            .card {
                padding: 20px;
            }
            
            .status-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
                margin-bottom: 10px;
            }
        }
    </style>
</head>

<body>

<!-- Partículas de fundo -->
<div id="particles-js"></div>

<div class="container">

    <h1><i class="fas fa-server"></i> Status do Sistema</h1>
    
    <div class="subtitle">
        Nave ORION - Monitoramento em Tempo Real
    </div>

    <!-- Card de Status Geral -->
    <div class="card">
        <h2><i class="fas fa-heartbeat"></i> Status Geral</h2>
        
        <div class="alert">
            <i class="fas fa-check-circle"></i> Todos os sistemas estão operando normalmente
        </div>

        <div class="status-grid">
            <div class="status-item">
                <i class="fas fa-shield-alt"></i>
                <h3>Sistemas de Segurança</h3>
                <p class="status-online"><i class="fas fa-circle"></i> ONLINE</p>
                <p>100% operacional</p>
            </div>

            <div class="status-item">
                <i class="fas fa-cogs"></i>
                <h3>Sistemas de Navegação</h3>
                <p class="status-online"><i class="fas fa-circle"></i> ONLINE</p>
                <p>98% operacional</p>
            </div>

            <div class="status-item">
                <i class="fas fa-bolt"></i>
                <h3>Sistema de Energia</h3>
                <p class="status-online"><i class="fas fa-circle"></i> ONLINE</p>
                <p>82% da capacidade</p>
            </div>

            <div class="status-item">
                <i class="fas fa-network-wired"></i>
                <h3>Comunicações</h3>
                <p class="status-warning"><i class="fas fa-circle"></i> ESTÁVEL</p>
                <p>Latência: 45ms</p>
            </div>
        </div>
    </div>

    <!-- Card de Recursos -->
    <div class="card">
        <h2><i class="fas fa-chart-bar"></i> Uso de Recursos</h2>
        
        <div class="progress-container">
            <div class="progress-label">
                <span>CPU</span>
                <span>64%</span>
            </div>
            <div class="progress-bar">
                <div class="progress" style="width: 64%">64%</div>
            </div>
        </div>

        <div class="progress-container">
            <div class="progress-label">
                <span>Memória</span>
                <span>78%</span>
            </div>
            <div class="progress-bar">
                <div class="progress" style="width: 78%">78%</div>
            </div>
        </div>

        <div class="progress-container">
            <div class="progress-label">
                <span>Armazenamento</span>
                <span>45%</span>
            </div>
            <div class="progress-bar">
                <div class="progress" style="width: 45%">45%</div>
            </div>
        </div>

        <div class="progress-container">
            <div class="progress-label">
                <span>Largura de Banda</span>
                <span>32%</span>
            </div>
            <div class="progress-bar">
                <div class="progress" style="width: 32%">32%</div>
            </div>
        </div>
    </div>

    <!-- Card de Informações da Missão -->
    <div class="card">
        <h2><i class="fas fa-rocket"></i> Informações da Missão</h2>
        
        <div class="status-grid">
            <div class="status-item">
                <i class="fas fa-road"></i>
                <h3>Distância Percorrida</h3>
                <p>152 milhões km</p>
                <small>69% do trajeto</small>
            </div>

            <div class="status-item">
                <i class="fas fa-tachometer-alt"></i>
                <h3>Velocidade Atual</h3>
                <p>98,000 km/h</p>
                <small>Velocidade constante</small>
            </div>

            <div class="status-item">
                <i class="fas fa-clock"></i>
                <h3>Tempo Restante</h3>
                <p>72 dias</p>
                <small>Chegada estimada</small>
            </div>

            <div class="status-item">
                <i class="fas fa-temperature-high"></i>
                <h3>Temperatura Externa</h3>
                <p>-85°C</p>
                <small>Estável</small>
            </div>
        </div>
    </div>

    <div class="footer-buttons">
        <a href="dashboard.jsp" class="btn btn-back">
            <i class="fas fa-arrow-left"></i>
            Voltar ao Painel
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

    // Simulação de atualização dos recursos
    function updateResources() {
        const resources = ['64%', '78%', '45%', '32%'];
        const bars = document.querySelectorAll('.progress');
        
        // Atualizar apenas as barras de recursos (últimas 4)
        for (let i = 0; i < 4; i++) {
            const bar = bars[bars.length - 4 + i];
            const currentWidth = parseInt(bar.style.width);
            const targetWidth = parseInt(resources[i]);
            
            // Pequena variação aleatória (±2%)
            const variation = (Math.random() * 4) - 2;
            let newWidth = currentWidth + variation;
            
            // Manter entre 20% e 90%
            newWidth = Math.max(20, Math.min(90, newWidth));
            
            bar.style.width = newWidth.toFixed(0) + '%';
            bar.textContent = newWidth.toFixed(0) + '%';
        }
    }

    // Atualizar recursos a cada 5 segundos
    setInterval(updateResources, 5000);
</script>

</body>
</html>