/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import beans.Cliente;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author Popovicz
 */
public class DaoCliente {
    
    public boolean salvarCliente(Cliente cli){
        Connection c = null;
        Statement stmt = null;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            String sql = "INSERT INTO oacp.cliente (id,nome,tipo,data,cpf,cnpj) "
               + "VALUES ('', '"+ cli.getNome() +"', '"+ cli.isTipo() +"', '"+ cli.getData() +"','"+ cli.getCpf() +"','"+ cli.getCnpj() +"' );";
            stmt.executeUpdate(sql);
            stmt.close();
            c.commit();
            c.close();
         } catch (Exception e) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
            return false;
         }           
        return true;
    }
}
