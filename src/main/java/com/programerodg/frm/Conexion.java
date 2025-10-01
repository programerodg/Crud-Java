/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.programerodg.frm;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Programerodg
 */
public class Conexion {
    
    public static Connection cn;
    CallableStatement cs;
    String user = "postgres";
    String pass = "Toor14**";
    
    public Conexion()throws ClassNotFoundException{
        try {
            Class.forName("org.postgresql.Driver");
            cn = DriverManager.getConnection("jdbc:postgresql://localhost/crudjava", user , pass);
        } catch (SQLException ex) {
            System.out.println("Error al conectar a la base de datos> "+ex.getMessage());
        }
    }
    
}
