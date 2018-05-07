/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.Endereco;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Popovicz
 */
public class DaoEndereco {
    public boolean inserir(Endereco endereco) {
        Connection c = null;
        Statement stmt = null;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            String sql = "INSERT INTO oacp.endereco (id_cliente,logradouro,numero,cidade,estado) "
                    + "VALUES ('" + endereco.getId_cliente() + "', '" + endereco.getLogradouro() + "', '" + endereco.getNumero() + "','" + endereco.getCidade() + "','" + endereco.getEstado() + "' );";
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
    public List<Endereco> listar() {
        Connection c = null;
        Statement stmt = null;
        ArrayList<Endereco> listaEndereco = new ArrayList<Endereco>();
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM oacp.endereco");
            while (rs.next()) {
                 Endereco endereco = new Endereco();
                 endereco.setId(rs.getInt("id"));
                 endereco.setId_cliente(rs.getInt("id_cliente"));
                 endereco.setLogradouro(rs.getString("logradouro"));
                 endereco.setNumero(rs.getString("numero"));
                 endereco.setCidade(rs.getString("cidade"));
                 endereco.setEstado(rs.getString("estado"));
                 listaEndereco.add(endereco);
            }
            rs.close();
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        
        return listaEndereco;
    }
}
