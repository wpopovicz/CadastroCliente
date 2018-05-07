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
                var erro = false;
                if (cpf === "00000000000" || 
                    cpf === "11111111111" || 
                    cpf === "22222222222" || 
                    cpf === "33333333333" || 
                    cpf === "44444444444" || 
                    cpf === "55555555555" || 
                    cpf === "66666666666" || 
                    cpf === "77777777777" || 
                    cpf === "88888888888" || 
                    cpf === "99999999999") {
                    erro = true;
 		}
                
                for (i = 0; i < 9; i++) {
                    soma1 += eval(cpf.charAt(i) * (vlr - 1));
                    soma2 += eval(cpf.charAt(i) * vlr);
                    vlr--;
                }
                soma1 = (((soma1 * 10) % 11) == 10 ? 0 : ((soma1 * 10) % 11));
                soma2 = (((soma2 + (2 * soma1)) * 10) % 11);

                var digitoGerado = (soma1 * 10) + soma2;
                if (digitoGerado != digitoDigitado || erro) {
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

            }
            ;
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
            function getIdade(data) {
                var hoje = new Date();
                var nascimento = new Date(data);
                //Retorna a diferença entre hoje e a data de nascimento em anos.
                var ano = hoje.getFullYear() - nascimento.getFullYear();
                //Retorna a diferença de mês do mês de nascimento para o atual.
                var m = hoje.getMonth() - nascimento.getMonth();
                //Caso ainda não tenha ultrapassado o dia e o mês
                if (m < 0 || (m === 0 && hoje.getDate() <= nascimento.getDate() && hoje.getDate() >= nascimento.getDay())) {
                    ano--;
                }
                return ano;
            }

            function Is18(pObj)
            {
                //var data = document.getElementById("datepicker");
                if (getIdade(pObj.value) >= 18) {
                    document.getElementById('dataPessoaTrue').style.display = 'block';
                    document.getElementById('dataPessoaFalse').style.display = 'none';
                } else {
                    document.getElementById('dataPessoaFalse').style.display = 'block';
                    document.getElementById('dataPessoaTrue').style.display = 'none';
                }
            }
            ;

            function Is3(pObj)
            {
                //var data = document.getElementById("datepicker");
                if (getIdade(pObj.value) >= 3) {
                    document.getElementById('dataEmpresaTrue').style.display = 'block';
                    document.getElementById('dataEmpresaFalse').style.display = 'none';
                } else {
                    document.getElementById('dataEmpresaFalse').style.display = 'block';
                    document.getElementById('dataEmpresaTrue').style.display = 'none';
                }
            }
            ;
            function validarDados() {
                rad = document.getElementById("tipo").checked;
                rad1 = document.getElementById("tipo1").checked;
                if (rad === true) {
                    if (document.getElementById('dataPessoaTrue').style.display === 'block') {
                        if (document.getElementById('cpfResponseTrue').style.display === 'block') {
                            document.form1.submit();
                        } else {
                            alert("CPF precisa ser válido!");
                            document.form1.cpf.focus();
                        }
                    } else {
                        alert("Precisa ser maior de idade!");
                        document.form1.data.focus();
                    }
                } else if (rad1 === true) {
                    if (document.getElementById('dataEmpresaTrue').style.display === 'block'){
                        if(document.getElementById('cnpjResponseTrue').style.display === 'block'){
                            document.form1.submit();
                        }else{
                            alert("CNPJ precisa ser válido!");
                            document.form1.cnpj.focus();
                        }
                    }else{
                        alert("Empresa precisa ter no mínimo 3 anos!");
                        document.form1.data.focus();
                    }
                } else {
                    alert("Selecione o tipo do cliente");
                    document.form1.tipo.focus();
                }
            };
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
