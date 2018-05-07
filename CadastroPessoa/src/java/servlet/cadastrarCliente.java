/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Cliente;
import beans.Contato;
import beans.Endereco;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DaoCliente;
import model.DaoContato;
import model.DaoEndereco;

/**
 *
 * @author Popovicz
 */
public class cadastrarCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean tipo = Boolean.parseBoolean(request.getParameter("tipo"));
        String nome;
        String data;
        String cpf = " ";
        String cnpj = " ";
        int idCliente = 0;
        String er = "false";
        String msg = null;
        Cliente cliente = new Cliente();
        DaoCliente daoCliente = new DaoCliente();
        DaoContato daoContato = new DaoContato();
        DaoEndereco daoEndereco = new DaoEndereco();
        if (tipo) {
            nome = request.getParameter("nome");
            data = request.getParameter("data");
            cpf = request.getParameter("cpf");
        } else {
            nome = request.getParameter("nome1");
            data = request.getParameter("data1");
            cnpj = request.getParameter("cnpj");
        }
        if (daoCliente.verificarCPF(cpf)) {
            msg = "Cadastro Efetuado com sucesso!";
        } else {
            request.setAttribute("erro", "true");
            request.setAttribute("mensagem", "Já possui registro com esse CPF !");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        if (daoCliente.verificarCNPJ(cnpj)) {
            msg = "Cadastro Efetuado com sucesso!";
        } else {
            request.setAttribute("erro", "true");
            request.setAttribute("mensagem", "Já possui registro com esse CNPJ !");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        byte ar[] = nome.getBytes("ISO-8859-1");
        String nomeCerto = new String(ar, "UTF-8");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date startDate = sdf.parse(data);
            cliente.setNome(nomeCerto);
            cliente.setCpf(cpf);
            cliente.setCnpj(cnpj);
            cliente.setData(startDate);
            cliente.setTipo(tipo);
            if (daoCliente.inserir(cliente)) {
                msg = "Cadastro Efetuado com sucesso!";
            } else {
                request.setAttribute("erro", "true");
                request.setAttribute("mensagem", "Erro em cadastrar cliente");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
            idCliente = daoCliente.getUltimoId();
            
        } catch (ParseException ex) {
            Logger.getLogger(cadastrarCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String[] tipoTelefone = request.getParameterValues("tipoTelefone[]");
        String[] telefone = request.getParameterValues("telefone[]");
        String[] operadoraTelefone = request.getParameterValues("operadoraTelefone[]");
        for (int i = 0; i < tipoTelefone.length; i++) {
            Contato contato = new Contato();
            contato.setId_cliente(idCliente);
            contato.setNumero(telefone[i]);
            contato.setTipo(tipoTelefone[i]);
            contato.setOperadora(operadoraTelefone[i]);
            if (daoContato.inserir(contato)) {
                msg = "Cadastro Efetuado com sucesso!";
            } else {
                request.setAttribute("erro", "true");
                request.setAttribute("mensagem", "Erro ao cadastrar cliente");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        String[] logradouro = request.getParameterValues("logradouro[]");
        String[] numeroEnd = request.getParameterValues("numeroEnd[]");
        String[] cidade = request.getParameterValues("cidade[]");
        String[] estado = request.getParameterValues("estado[]");
        for (int i = 0; i < logradouro.length; i++) {
            byte array[] = logradouro[i].getBytes("ISO-8859-1");
            String novaLogradouro = new String(array, "UTF-8");
            byte vetor[] = cidade[i].getBytes("ISO-8859-1");
            String novaCidade = new String(vetor, "UTF-8");
            Endereco endereco = new Endereco();
            endereco.setId_cliente(idCliente);
            endereco.setLogradouro(novaLogradouro);
            endereco.setNumero(numeroEnd[i]);
            endereco.setCidade(novaCidade);
            endereco.setEstado(estado[i]);
            if (daoEndereco.inserir(endereco)) {
                msg = "Cadastro Efetuado com sucesso!";
            } else {
                request.setAttribute("erro", "true");
                request.setAttribute("mensagem", "Erro ao cadastrar cliente");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        request.setAttribute("erro", er);
        request.setAttribute("mensagem", msg);
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
