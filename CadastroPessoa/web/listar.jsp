<%-- 
    Document   : listar.jsp
    Created on : 07/05/2018, 03:43:01
    Author     : Popovicz
--%>

<%@page import="beans.Endereco"%>
<%@page import="beans.Contato"%>
<%@page import="java.util.List"%>
<%@page import="beans.Cliente"%>
<%@page import="model.DaoContato"%>
<%@page import="model.DaoEndereco"%>
<%@page import="model.DaoCliente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Clientes</title>
        <jsp:include page="include/head.jsp" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#minhaTabela').dataTable();
        });
    </script>
</head>
<body>
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Exemplo cadastro</a>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <jsp:include page="include/menu.jsp" />
            <%
                DaoCliente daoCliente = new DaoCliente();
                DaoEndereco daoEndereco = new DaoEndereco();
                DaoContato daoContato = new DaoContato();
                List<Cliente> clientes = daoCliente.listar();
                List<Contato> contatos = daoContato.listar();
                List<Endereco> enderecos = daoEndereco.listar();

            %> 
            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="padding-top: 40px;">
                <h1 class="h2">Listar Cliente</h1>
                <div class="table-responsive col-md-12" >
                    <table id="minhaTabela" class="display table table-striped">
                        <thead>
                            <tr>
                                <th>Tipo</th>
                                <th>Nome</th>
                                <th>Celular</th>
                                <th>Telefone</th>
                                <th>Endereço</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                
                                for (Cliente cli : clientes) {
                                    String cel = "";
                                    String tel = "";
                                    String endere = "";
                                    for (Endereco end : enderecos) {
                                        if (end.getId_cliente() == cli.getId()) {
                                            endere = endere + end.getLogradouro() + " Nº" + end.getNumero() + " " + end.getCidade() + "-" + end.getEstado() + ", ";
                                        }
                                    }
                                    for (Contato cont : contatos) {
                                        if (cont.getId_cliente() == cli.getId() && cont.getTipo().equals("celular")) {
                                            cel = cel + cont.getNumero() + " " + cont.getOperadora() + "; ";
                                        }
                                        if (cont.getId_cliente() == cli.getId() && cont.getTipo().equals("telefone")) {
                                            tel = tel + cont.getNumero() + "; ";
                                        }

                                    }
                            %>
                            <tr>
                                <td><%= cli.isTipo() == true ? "Pessoa" : "Empresa"%></td>
                                <td><%= cli.getNome()%></td>
                                <td><%= cel%></td>
                                <td><%= tel%></td>
                                <td><%= endere%></td>

                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>

</body>
</html>
