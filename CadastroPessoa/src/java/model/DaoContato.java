/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.Contato;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Popovicz
 */
public class DaoContato {
    public boolean inserir(Contato contato) {
        Connection c = null;
        Statement stmt = null;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            String sql = "INSERT INTO oacp.contato (id_cliente,tipo,numero,operadora) "
                    + "VALUES ('" + contato.getId_cliente() + "', '" + contato.getTipo() + "', '" + contato.getNumero() + "','" + contato.getOperadora() + "' );";
            stmt.executeUpdate(sql);            
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            return false;
        }
        return true;
    }
    
    public List<Contato> listar() {
        Connection c = null;
        Statement stmt = null;
        ArrayList<Contato> listaContato = new ArrayList<Contato>();
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM oacp.contato");
            while (rs.next()) {
                 Contato contato = new Contato();
                 contato.setId(rs.getInt("id"));
                 contato.setId_cliente(rs.getInt("id_cliente"));
                 contato.setTipo(rs.getString("tipo"));
                 contato.setNumero(rs.getString("numero"));
                 contato.setOperadora(rs.getString("operadora"));
                 listaContato.add(contato);
            }
            rs.close();
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        
        return listaContato;
    }
}
