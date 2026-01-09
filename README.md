## 🚀 Projeto ORION — Sistema de Controle Espacial

Sistema web desenvolvido em **Java com JSP, Servlets e JDBC**, com interface futurista inspirada em painéis de controle de naves espaciais.

---

## 🎯 Objetivo
Gerenciar informações da nave, tripulantes, energia e status geral do sistema.

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia | Finalidade |
|-----------|-----------|
| Java | Lógica de negócio |
| JSP | Páginas dinâmicas |
| Servlets | Controladores |
| JDBC | Conexão com banco |
| MySQL | Banco de dados |
| Apache Tomcat | Servidor web |
| HTML5 / CSS3 | Interface |
| Bootstrap | Layout responsivo |
| JavaScript | Interatividade |

---

## ✨ Funcionalidades
- 🔐 Sistema de Login com autenticação
- 👨‍🚀 Gerenciamento de Tripulantes (CRUD)
- ⚡ Monitoramento de Energia da nave
- 📊 Dashboard com status geral
- 🎨 Interface futurista com animações CSS
- 🔄 Controle de sessão com `HttpSession`
- 📱 Design responsivo

---

## 👨‍✈️ Credenciais de Teste

Use as credenciais abaixo para acessar o sistema:

Email: adm@orion.com

Senha: 123456


---

## 🗄️ Banco de Dados (MySQL)

### 📌 Criação do Banco e Tabela


CREATE DATABASE orion_bd;

USE orion_bd;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

INSERT INTO usuario (nome, email, senha, cargo)
VALUES ('Capitão Orion', 'adm@orion.com', '123456', 'Capitão');

SELECT * FROM usuario;


📁 Estrutura do Projeto

orion/
├── src/
│   ├── controller/
│   │   ├── LoginServlet.java
│   │   └── UsuarioServlet.java
│   ├── dao/
│   │   └── UsuarioDAO.java
│   └── model/
│       └── Usuario.java
│
├── web/
│   ├── index.jsp
│   ├── dashboard.jsp
│   ├── usuarios.jsp
│   ├── editar.jsp
│   └── database/
│       └── orion_bd.sql
│
└── README.md



▶️ Como Executar o Projeto

Clone o repositório:

git clone https://github.com/seu-usuario/projeto-orion.git


Abra o projeto no Apache NetBeans

Configure o Apache Tomcat

Crie o banco de dados no MySQL usando o script SQL

Execute o projeto e acesse:

http://localhost:8080/orion/index.jsp





























