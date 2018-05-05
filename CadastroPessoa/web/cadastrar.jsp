<%-- 
    Document   : cadastrar
    Created on : 05/05/2018, 07:16:37
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
        <script>
            function mascara(o, f) {
                v_obj = o
                v_fun = f
                setTimeout("execmascara()", 1)
            }
            function execmascara() {
                v_obj.value = v_fun(v_obj.value)
            }
            function mtel(v) {
                v = v.replace(/\D/g, "");             //Remove tudo o que não é dígito
                v = v.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
                v = v.replace(/(\d)(\d{4})$/, "$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
                return v;
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Exemplo cadastro</a>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="include/menu.jsp" />
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="padding-top: 40px;">
                    <h1 class="h2">Cadastrar Cliente</h1>
                    <p>Os campos com * são de preenchimento obrigatório.</p>
                    <div class="row">
                        <div class="col-md-6">
                            <p> Cliente é *</p>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="tipo" id="tipo" value="Advogado">
                                <label class="form-check-label" for="tipo">
                                    Pessoa física
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="tipo" id="tipo1" value="Estagiário">
                                <label class="form-check-label" for="tipo1">
                                    Pessoa jurídica 
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="nome">Nome completo*</label>
                                <input class="form-control" type="text" placeholder="Digite o nome" id="nome" name="nome" maxlength="150" required data-validation-required-message="nome é obrigatório">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="telefone1">1º Telefone *</label>
                                <input type="text" id="telefone1" name="telefone1" class="form-control" onkeyup="mascara(this, mtel);" maxlength="15" required />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="operadoraTelefone1">Operadora</label>
                                <select id="operadoraTelefone1" name="operadoraTelefone1" class="form-control" >
                                    <option value="">Não informado</option>
                                    <option value="CLARO">Claro</option>
                                    <option value="OI">Oi</option>
                                    <option value="TIM">Tim</option>
                                    <option value="VIVO">Vivo</option>
                                    <option value="OUTROS">Outros</option>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="telefone1">2º Telefone </label>
                                <input type="text" id="telefone2" name="telefone2" class="form-control" onkeyup="mascara(this, mtel);" maxlength="15"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="operadoraTelefone2">Operadora</label>
                                <select id="operadoraTelefone2" name="operadoraTelefone2" class="form-control" >
                                    <option value="">Não informado</option>
                                    <option value="CLARO">Claro</option>
                                    <option value="OI">Oi</option>
                                    <option value="TIM">Tim</option>
                                    <option value="VIVO">Vivo</option>
                                    <option value="OUTROS">Outros</option>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="telefone1">3º Telefone </label>
                                <input type="text" id="telefone3" name="telefone3" class="form-control" onkeyup="mascara(this, mtel);" maxlength="15"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="operadoraTelefone3">Operadora</label>
                                <select id="operadoraTelefone3" name="operadoraTelefone3" class="form-control" >
                                    <option value="">Não informado</option>
                                    <option value="CLARO">Claro</option>
                                    <option value="OI">Oi</option>
                                    <option value="TIM">Tim</option>
                                    <option value="VIVO">Vivo</option>
                                    <option value="OUTROS">Outros</option>

                                </select>
                            </div>
                        </div>
                    </div>
                    
                </main>
            </div>
        </div>
        <jsp:include page="include/foot.jsp" />
    </body>
</html>