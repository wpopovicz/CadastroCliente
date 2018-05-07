<%-- 
    Document   : index
    Created on : 05/05/2018, 06:39:01
    Author     : Popovicz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exemplo cadastro</title>
        <jsp:include page="include/head.jsp" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Exemplo cadastro</a>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="include/menu.jsp" />
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="padding-top: 40px;">
                    <%
                        String erro = (String) request.getAttribute("erro");
                        String mensagem = (String) request.getAttribute("mensagem");
                        if(erro != null && erro.equals("true")){
                            if (mensagem != null) {%>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert" >
                                <strong>${mensagem}</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </div>
                    <%      }
                        }else{
                            if (mensagem != null) {%>
                            <div class="alert alert-success alert-dismissible fade show" role="alert" >
                                <strong>${mensagem}</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </div>
                    <%      }
                        }%>
                    <h1 class="h2">Exemplo Cadastro</h1>
                </main>
            </div>
        </div>
        <jsp:include page="include/foot.jsp" />
    </body>
</html>