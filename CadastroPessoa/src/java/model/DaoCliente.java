/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.Cliente;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Popovicz
 */
public class DaoCliente {

    public boolean inserir(Cliente cli) {
        Connection c = null;
        Statement stmt = null;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            String sql = "INSERT INTO oacp.cliente (nome,tipo,data,cpf,cnpj) "
                    + "VALUES ('" + cli.getNome() + "', '" + cli.isTipo() + "', '" + cli.getData() + "', '" + cli.getCpf() + "','" + cli.getCnpj() + "' );";
            stmt.executeUpdate(sql);
//            ResultSet rsID = stmt.getGeneratedKeys();
//            if (rsID.next()) {
//               ultimoId = rsID.getInt(1);
//            }
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            return false;
        }
        return true;
    }
    public int getUltimoId() {
        Connection c = null;
        Statement stmt = null;
        int ultimoId = 0;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT MAX(ID) as id FROM oacp.cliente;");
            while (rs.next()) {
                ultimoId = rs.getInt("id");
            }
            rs.close();
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            return ultimoId;

        }
        return ultimoId;
    }

    public boolean verificarCPF(String cpf) {
        Connection c = null;
        Statement stmt = null;
        int id = 0;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id FROM oacp.cliente WHERE cpf LIKE '" + cpf + "';");
            while (rs.next()) {
                id = rs.getInt("id");
            }
            rs.close();
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            return false;
        }
        if(id > 0){
            return false;
        }
        return true;
    }
    public boolean verificarCNPJ(String cnpj) {
        Connection c = null;
        Statement stmt = null;
        int id = 0;
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id FROM oacp.cliente WHERE cnpj LIKE '" + cnpj + "';");
            while (rs.next()) {
                id = rs.getInt("id");
            }
            rs.close();
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            return false;
        }
        if(id > 0){
            return false;
        }
        return true;
    }
    
    public List<Cliente> listar() {
        Connection c = null;
        Statement stmt = null;
        ArrayList<Cliente> listaCliente = new ArrayList<Cliente>();
        try {
            Conexao con = new Conexao();
            c = con.Conectar();
            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM oacp.cliente");
            while (rs.next()) {
                 Cliente cliente = new Cliente();
                 cliente.setId(rs.getInt("id"));
                 cliente.setNome(rs.getString("nome"));
                 cliente.setTipo(rs.getBoolean("tipo"));
                 cliente.setData(rs.getDate("data"));
                 cliente.setCpf(rs.getString("cpf"));
                 cliente.setCnpj(rs.getString("cnpj"));
                 listaCliente.add(cliente);
            }
            rs.close();
            stmt.close();
            c.commit();
            c.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
        
        return listaCliente;
    }
}
