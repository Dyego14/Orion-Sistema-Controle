/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Dyego
 */
 
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexaoBD {

    private static final String URL =
        "jdbc:mysql://localhost:3306/orion_bd?useSSL=false&serverTimezone=UTC";

    private static final String USER = "root";     // seu usuário do MySQL
    private static final String PASSWORD = "";     // sua senha (se tiver)

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Erro na conexão com o banco", e);
        }
    }
}
