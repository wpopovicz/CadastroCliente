/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.Contato;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author Popovicz
 */
public class DaoContato {
    public boolean inserir(Contato contato) {
        Connection c = null;
        Statement stmt = null;
        int ultimoId = 0;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            String sql = "INSERT INTO oacp.contato (id,id_cliente,tipo,numero,operadora) "
                    + "VALUES ('', '" + contato.getId_cliente() + "', '" + contato.getTipo() + "', '" + contato.getNumero() + "','" + contato.getOperadora() + "' );";
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
