<%@ page import="entidades.Estado" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<style>
h1 {
	text-align: center;
}

p {
	text-align: center;
}

.centered {
  margin-right: auto;
  margin-left: auto;
  text-align: center;
}

.wrapper {
	text-align: center;
}

.wrapper ul {
	display: inline-block;
	/* For IE, the outcast */
	zoom: 1;
	*display: inline;
	padding-left: 45px;
	margin-top: 0px;
}

.wrapper li {
	padding: 2px 5px;
}

.list-control {
	width: 255px;
	text-align: left;
}

.list-radio {
	display: inline;
}
</style>
<link rel="shortcut icon" href="/Solar/resources/img/icon/favicon.ico">
<link rel="icon" sizes="16x16 32x32 64x64" href="/Solar/resources/img/icon/favicon.ico">
<link rel="icon" type="image/png" sizes="196x196" href="/Solar/resources/img/icon/favicon-192.png">
<link rel="icon" type="image/png" sizes="160x160" href="/Solar/resources/img/icon/favicon-160.png">
<link rel="icon" type="image/png" sizes="96x96" href="/Solar/resources/img/icon/favicon-96.png">
<link rel="icon" type="image/png" sizes="64x64" href="/Solar/resources/img/icon/favicon-64.png">
<link rel="icon" type="image/png" sizes="32x32" href="/Solar/resources/img/icon/favicon-32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/Solar/resources/img/icon/favicon-16.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.blue-indigo.min.css" />
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<link rel="stylesheet" href="/Solar/resources/getmdl-select/getmdl-select.min.css" />
<script defer src="/Solar/resources/getmdl-select/getmdl-select.min.js"></script>
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<meta charset="UTF-8">
<title>Solar</title>
</head>
<body>
	<%String[] nomesCidades = (String[]) request.getAttribute("nomesCidades"); %>
	<%Integer[] idsCidades = (Integer[]) request.getAttribute("idsCidades"); %>
	
	<div class="centered" style="width:500px">
		<h1>Orçamento rápido</h1>
		<form method="post" action="${pageContext.request.contextPath}/orcamento" accept-charset="UTF-8" style="text-align:center"> <!-- form action? -->
			<div style="width:500px">
				<h6 title="" style="text-align:center"><strong>Valor da conta de luz:</strong></h6> 
				<input class="mdl-slider mdl-js-slider" type="range" name="valor" id="valorSlider" min="10" max="10000" step="30" oninput="this.form.valorNumero.value=this.value" style="width:500px"><br>
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 128px">
					<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="valorNumero" min="10" max="10000" value="500" oninput="this.form.valorSlider.value=this.value" style="text-align:center;width:128px;margin:auto" />
					<label class="mdl-textfield__label" for="valorNumero">R$</label>
				</div>
				<!-- <p title="Inserir apenas números">CEP:</p> <input type="number" name="cep"><br><br> <!-- validar CEP -->
			</div>
			<br>
			
			<div class="wrapper" id="edificacao">
       			<h6 style="margin-bottom: 0px"><strong>Tipo de Edificação</strong></h6>
       			<ul class="list-control mdl-list">
       				<li class="mdl-list__item">
						<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="residencia">
							<input type="radio" id="residencia" class="mdl-radio__button" name="options" value="1" checked> 
							<span class="mdl-radio__label">Residencial</span>
						</label>&emsp;&emsp;
					</li>
					
					<li class="mdl-list__item">
						<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="comercial">
							<input type="radio" id="comercial" class="mdl-radio__button" name="options" value="2"> 
							<span class="mdl-radio__label">Comercial/Industrial</span>
						</label>&emsp;&emsp;
					</li>
					
					<li class="mdl-list__item">
						<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="agro">
							<input type="radio" id="agro" class="mdl-radio__button" name="options" value="3"> 
							<span class="mdl-radio__label">Agronegócio</span>
						</label>
					</li>
				</ul>
			</div><br>
			
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height" id="cidadeD">
	        	<input class="mdl-textfield__input" type="text" name="cidade" id="cidade"  readonly style="width:200px">
	            <label for="cidade">
	                <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
	            </label>
	            <label for="cidade" class="mdl-textfield__label">Cidade</label>
	            <ul for="cidade" class="mdl-menu mdl-menu--bottom-left mdl-js-menu" style="width:200px">
	            	<% for (int i = 0; i < nomesCidades.length; i++){ %>
	                <li class="mdl-menu__item" value="<%= idsCidades[i] %>"><%= nomesCidades[i] %></li>
	                <% } %>
	            </ul>
       		</div>       		
			<div style="height: 250px"></div>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="button" onclick="location.href='/Solar'" name="voltar"> <!-- style="position:absolute;left:525px;"> -->
		    	<i class="mdl-icon-toggle__label material-icons">arrow_back</i>Voltar
			</button>&ensp;&ensp;&ensp;
			<input class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored" type="submit" value="Calcular"> <!-- style="position:absolute;right:525px;"> -->
		</form>
	</div>
</body>
</html>