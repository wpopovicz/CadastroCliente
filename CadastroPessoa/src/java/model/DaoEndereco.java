/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.Endereco;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author Popovicz
 */
public class DaoEndereco {
    public boolean inserir(Endereco endereco) {
        Connection c = null;
        Statement stmt = null;
        int ultimoId = 0;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            String sql = "INSERT INTO oacp.endereco (id,id_cliente,logradouro,numero,cidade,estado) "
                    + "VALUES ('', '" + endereco.getId_cliente() + "', '" + endereco.getLogradouro() + "', '" + endereco.getNumero() + "','" + endereco.getCidade() + "','" + endereco.getEstado() + "' );";
            stmt.executeUpdate(sql);            
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
            return false;
        }
        return true;
    }
}
