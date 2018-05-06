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
            //adiciona mascara ao CPF
            function MascaraCPF(cpf) {
                if (mascaraInteiro(cpf) == false) {
                    event.returnValue = false;
                }
                return formataCampo(cpf, '000.000.000-00', event);
            }
            //formata de forma generica os campos
            function formataCampo(campo, Mascara, evento) {
                var boleanoMascara;

                var Digitato = evento.keyCode;
                exp = /\-|\.|\/|\(|\)| /g
                campoSoNumeros = campo.value.toString().replace(exp, "");

                var posicaoCampo = 0;
                var NovoValorCampo = "";
                var TamanhoMascara = campoSoNumeros.length;
                ;

                if (Digitato != 8) { // backspace 
                    for (i = 0; i <= TamanhoMascara; i++) {
                        boleanoMascara = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                                || (Mascara.charAt(i) == "/"))
                        boleanoMascara = boleanoMascara || ((Mascara.charAt(i) == "(")
                                || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " "))
                        if (boleanoMascara) {
                            NovoValorCampo += Mascara.charAt(i);
                            TamanhoMascara++;
                        } else {
                            NovoValorCampo += campoSoNumeros.charAt(posicaoCampo);
                            posicaoCampo++;
                        }
                    }
                    campo.value = NovoValorCampo;
                    return true;
                } else {
                    return true;
                }
            }
            //valida o CPF digitado
            function ValidarCPF(Objcpf) {
                var cpf = Objcpf.value;
                exp = /\.|\-/g;
                cpf = cpf.toString().replace(exp, "");
                var digitoDigitado = eval(cpf.charAt(9) + cpf.charAt(10));
                var soma1 = 0, soma2 = 0;
                var vlr = 11;

                for (i = 0; i < 9; i++) {
                    soma1 += eval(cpf.charAt(i) * (vlr - 1));
                    soma2 += eval(cpf.charAt(i) * vlr);
                    vlr--;
                }
                soma1 = (((soma1 * 10) % 11) == 10 ? 0 : ((soma1 * 10) % 11));
                soma2 = (((soma2 + (2 * soma1)) * 10) % 11);

                var digitoGerado = (soma1 * 10) + soma2;
                if (digitoGerado != digitoDigitado) {
                    document.getElementById('cpfResponseTrue').style.display = 'none';
                    document.getElementById('cpfResponseFalse').style.display = 'block';
                } else {
                    document.getElementById('cpfResponseTrue').style.display = 'block';
                    document.getElementById('cpfResponseFalse').style.display = 'none';
                }
            }
            //adiciona mascara de cnpj
            function MascaraCNPJ(cnpj) {
                if (mascaraInteiro(cnpj) == false) {
                    event.returnValue = false;
                }
                return formataCampo(cnpj, '00.000.000/0000-00', event);
            }
            //valida numero inteiro com mascara
            function mascaraInteiro() {
                if (event.keyCode < 48 || event.keyCode > 57) {
                    event.returnValue = false;
                    return false;
                }
                return true;
            }
            //valida o CNPJ digitado
            function ValidarCNPJ(ObjCnpj) {
                var cnpj = ObjCnpj.value;
                var valida = new Array(6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2);
                var dig1 = new Number;
                var dig2 = new Number;

                exp = /\.|\-|\//g
                cnpj = cnpj.toString().replace(exp, "");
                var digito = new Number(eval(cnpj.charAt(12) + cnpj.charAt(13)));

                for (i = 0; i < valida.length; i++) {
                    dig1 += (i > 0 ? (cnpj.charAt(i - 1) * valida[i]) : 0);
                    dig2 += cnpj.charAt(i) * valida[i];
                }
                dig1 = (((dig1 % 11) < 2) ? 0 : (11 - (dig1 % 11)));
                dig2 = (((dig2 % 11) < 2) ? 0 : (11 - (dig2 % 11)));

                if (((dig1 * 10) + dig2) != digito) {
                    document.getElementById('cnpjResponseTrue').style.display = 'none';
                    document.getElementById('cnpjResponseFalse').style.display = 'block';
                } else {
                    document.getElementById('cnpjResponseTrue').style.display = 'block';
                    document.getElementById('cnpjResponseFalse').style.display = 'none';
                }

            };
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

            function Mudarestado(el) {
                var vari = document.getElementById(el);
                var display = document.getElementById(el).style.display;
                document.getElementById(el).style.display = 'block';
                alert(vari);
            }

            function duplicarCampos() {
                var clone = document.getElementById('origem').cloneNode(true);
                var destino = document.getElementById('destino');
                destino.appendChild(clone);
                var camposClonados = clone.getElementsByTagName('input');
                var selectClonados = clone.getElementsByTagName('select');
                for (i = 0; i < camposClonados.length; i++) {
                    camposClonados[i].value = '';
                    selectClonados[i].value = '';
                }
            }
            function removerCampos(id) {
                var node1 = document.getElementById('destino');
                node1.removeChild(node1.childNodes[0]);
            }
            function duplicarCamposEnd() {
                var clone = document.getElementById('origemEnd').cloneNode(true);
                var destino = document.getElementById('destinoEnd');
                destino.appendChild(clone);
                var camposClonados = clone.getElementsByTagName('input');
                for (i = 0; i < camposClonados.length; i++) {
                    camposClonados[i].value = '';
                }
            }
            function removerCamposEnd(id) {
                var node1 = document.getElementById('destinoEnd');
                node1.removeChild(node1.childNodes[0]);
            }

            function is_cnpj(c) {
                var b = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

                if ((c = c.replace(/[^\d]/g, "")).length !== 14)
                    return false;

                if (/0{14}/.test(c))
                    return false;

                for (var i = 0, n = 0; i < 12; n += c[i] * b[++i])
                    ;
                if (c[12] !== (((n %= 11) < 2) ? 0 : 11 - n))
                    return false;

                for (var i = 0, n = 0; i <= 12; n += c[i] * b[i++])
                    ;
                if (c[13] !== (((n %= 11) < 2) ? 0 : 11 - n))
                    return false;

                return true;
            }
            ;
            function Mudarestado(el) {
                var boxs = ["box", "box1"];
                var display = document.getElementById(el).style.display;
                if (el == "box") {
                    document.getElementById(el).style.display = 'block';
                    document.getElementById(el).required = true;
                    document.getElementById("nome").required = true;
                    document.getElementById("data").required = true;
                    document.getElementById('box1').style.display = 'none';
                    document.getElementById("box1").required = false;
                    document.getElementById("nome1").required = false;
                    document.getElementById("data1").required = false;
                }
                if (el == "box1") {
                    document.getElementById(el).style.display = 'block';
                    document.getElementById(el).required = true;
                    document.getElementById("nome1").required = true;
                    document.getElementById("data1").required = true;
                    document.getElementById('box').style.display = 'none';
                    document.getElementById("box").required = false;
                    document.getElementById("nome").required = false;
                    document.getElementById("data").required = false;
                }
            }
            ;
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
                    <form name="form1">
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
                                        <input class="form-control" type="date" id="data" name="data" >
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
                                        <input class="form-control" type="text" placeholder="Digite o nome da empresa" id="nome1" name="nome" maxlength="150" />
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12">
                                    <div class="form-group">
                                        <label for="nome">Data de inaguração*</label>
                                        <input class="form-control" type="date" id="data1" name="data" >
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
                        <img  src="./img/add.png" style="cursor: pointer; padding: 5px;" onclick="duplicarCampos();">
                        <img  src="./img/remove.png" style="cursor: pointer; padding: 5px;" onclick="removerCampos(this);"> 

                        <div id="origemEnd" class="row">
                            <div class="col-md-4 col-sm-9">
                                <div class="form-group">
                                    <label for="logradouro">Logradouro *</label>
                                    <input type="text" class="form-control" id="logradouro" name="logradouro[]" required/>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-3">
                                <div class="form-group">
                                    <label for="numeroEnd">Número *</label>
                                    <input type="text" class="form-control" id="numeroEnd" name="numeroEnd[]"  maxlength="6" required/>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-9">
                                <div class="form-group">
                                    <label for="cidade">Cidade *</label>
                                    <input type="text" class="form-control" id="cidade" name="cidade[]"  required/>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-3">
                                <div class="form-group">
                                    <label for="estado">Estado *</label>
                                    <input type="text" class="form-control" id="estado" name="estado[]"  maxlength="2" required/>
                                </div>
                            </div>
                        </div>
                        <div id="destinoEnd"></div>
                        <img  src="./img/add.png" style="cursor: pointer; padding: 5px;" onclick="duplicarCamposEnd();">
                        <img  src="./img/remove.png" style="cursor: pointer; padding: 5px;" onclick="removerCamposEnd(this);"> 
                    </form>
                </main>
            </div>
        </div>
        <jsp:include page="include/foot.jsp" />
    </body>
</html>