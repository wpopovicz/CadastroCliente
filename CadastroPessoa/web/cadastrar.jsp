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
        <jsp:include page="include/scriptJs.jsp" />
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
                    <form name="form1" action="cadastrarCliente" method="post">
                        <div class="col-md-6 col-sm-12">
                            <div class="row">
                                <p style="padding-right:15px;"> Cliente é *  </p>
                                <div class="form-check" style="padding-right:15px;">
                                    <input class="form-check-input" type="radio" name="tipo" onclick="Mudarestado('box')" id="tipo" value="true">
                                    <label class="form-check-label" onclick="Mudarestado('box')" for="tipo">
                                        Pessoa física
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="tipo" onclick="Mudarestado('box1')" id="tipo1" value="false">
                                    <label class="form-check-label" onclick="Mudarestado('box1')" for="tipo1">
                                        Pessoa jurídica 
                                    </label>
                                </div>
                            </div>
                        </div>
                        <span id="box" style="display:none">
                            <div class="row" >
                                <div class="col-md-5 col-sm-12">
                                    <div class="form-group">
                                        <label for="nome">Nome completo*</label>
                                        <input class="form-control" type="text" placeholder="Digite o nome" id="nome" name="nome" maxlength="150" />
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <div class="form-group">
                                        <label for="nome">Data nascimento*</label>
                                        <input class="form-control" type="date" id="data" name="data" onBlur="Is18(this)"/>
                                        <span id="dataPessoaTrue" style="display:none">
                                            <p style="color: green;">Válido</p>
                                        </span>
                                        <span id="dataPessoaFalse" style="display:none">
                                            <p style="color: red;">Inválido (apenas maior de 18 anos)</p>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label for="nome">CPF*</label>
                                        <input class="form-control" type="text" placeholder="Digite o CPF" id="cpf" name="cpf" onBlur="ValidarCPF(form1.cpf);" onKeyPress="MascaraCPF(form1.cpf);" maxlength="14" />
                                        <span id="cpfResponseTrue" style="display:none">
                                            <p style="color: green;">CPF Válido</p>
                                        </span>
                                        <span id="cpfResponseFalse" style="display:none">
                                            <p style="color: red;">CPF Inválido</p>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </span>
                        <span id="box1" style="display:none">
                            <div class="row" >
                                <div class="col-md-5 col-sm-12">
                                    <div class="form-group">
                                        <label for="nome">Nome da empresa*</label>
                                        <input class="form-control" type="text" placeholder="Digite o nome da empresa" id="nome1" name="nome1" maxlength="150" />
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <div class="form-group">
                                        <label for="nome">Data de inaguração*</label>
                                        <input class="form-control" type="date" id="data1" name="data1" onBlur="Is3(this)" >
                                        <span id="dataEmpresaTrue" style="display:none">
                                            <p style="color: green;">Válido</p>
                                        </span>
                                        <span id="dataEmpresaFalse" style="display:none">
                                            <p style="color: red;">Inválido (apenas empresa com 3 anos)</p>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label for="nome">CNPJ*</label>
                                        <input class="form-control" placeholder="Digite o CNPJ" id="cnpj" name="cnpj" type="text" onKeyPress="MascaraCNPJ(form1.cnpj);" maxlength="18" onBlur="ValidarCNPJ(form1.cnpj);"  />
                                        <span id="cnpjResponseTrue" style="display:none">
                                            <p style="color: green;">Válido</p>
                                        </span>
                                        <span id="cnpjResponseFalse" style="display:none">
                                            <p style="color: red;">Inválido</p>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </span>
                        <div id="origem" class="row">
                            <div class="col-md-4 col-sm-12">
                                <div class="form-group">
                                    <label for="tipoTelefone">Tipo *</label>
                                    <select id="tipoTelefone" name="tipoTelefone[]" class="form-control" >
                                        <option value="telefone">Telefone</option>
                                        <option value="celular">Celular</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <div class="form-group">
                                    <label for="telefone1">Número *</label>
                                    <input type="text" class="form-control" id="fone" name="telefone[]" onkeyup="mascara(this, mtel);" maxlength="15" required/>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <div class="form-group">
                                    <label for="operadoraTelefone">Operadora</label>
                                    <select id="operadoraTelefone" name="operadoraTelefone[]" class="form-control" >
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
                        <div id="destino"></div>
                        <img  src="./img/add.png" style="cursor: pointer; padding: 5px;" onclick="duplicarCampos();" data-toggle="tooltip" data-placement="bottom" title="Adicionar mais contato">
                        <img  src="./img/remove.png" style="cursor: pointer; padding: 5px;" onclick="removerCampos(this);" data-toggle="tooltip" data-placement="bottom" title="Remover contato"> 

                        <div id="origemEnd" class="row">
                            <div class="col-md-4 col-sm-9">
                                <div class="form-group">
                                    <label for="logradouro">Logradouro *</label>
                                    <input type="text" class="form-control required" id="logradouro" name="logradouro[]" required />
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-3">
                                <div class="form-group">
                                    <label for="numeroEnd">Número *</label>
                                    <input type="text" class="form-control" id="numeroEnd" name="numeroEnd[]"  maxlength="6" required />
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-9">
                                <div class="form-group">
                                    <label for="cidade">Cidade *</label>
                                    <input type="text" class="form-control" id="cidade" name="cidade[]"  required />
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-3">
                                <div class="form-group">
                                    <label for="estado">Estado *</label>
                                    <input type="text" class="form-control" id="estado" name="estado[]"  maxlength="2" required />
                                </div>
                            </div>
                        </div>
                        <div id="destinoEnd"></div>
                        <img  src="./img/add.png" style="cursor: pointer; padding: 5px;" onclick="duplicarCamposEnd();" data-toggle="tooltip" data-placement="bottom" title="Adicionar mais endereço">
                        <img  src="./img/remove.png" style="cursor: pointer; padding: 5px;" onclick="removerCamposEnd(this);" data-toggle="tooltip" data-placement="bottom" title="Remover endereço"> 

                        <div style="text-align: right;">
                            <button type="button" class="btn btn-success " onClick="validarDados()"><i class="fa fa-check" aria-hidden="true" ></i>  Salvar dados</button>
                        </div>
                    </form>
                </main>
            </div>
        </div>
        <jsp:include page="include/foot.jsp" />
    </body>
</html>