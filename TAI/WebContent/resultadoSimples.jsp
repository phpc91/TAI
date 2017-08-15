<%@page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<style>
h1 {
	text-align: center;
}

h3 {
	text-align: center;
}

h4 {
	text-align: center;
}

.material-icons.branco {
	color: #FFFFFF;
}
</style>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-blue.min.css" />
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	<meta charset="UTF-8">
	<title>Solar</title>
</head>
<body>
	<% 
	Integer numeroDePlacas = (Integer) request.getAttribute("numeroDePlacas"); 
	Integer preco = (Integer) request.getAttribute("preco"); 
	Double precoFinal = (Double) request.getAttribute("precoFinal"); 
	Float consumoAprox = (Float) request.getAttribute("consumo"); 
	Float tarifa = (Float) request.getAttribute("tarifa"); 
	Double potencia = (Double) request.getAttribute("potencia");
	
	DecimalFormat formatter = new DecimalFormat("#0.00"); 
	%>
	
	
	<h3>Resultado</h3>
	<div class="container" style="text-align:center;margin:auto">
		<h4>Detalhes</h4><br>
		<p>De acordo com a sua cidade, identificamos que a tarifa por kWh é de R$<%= formatter.format(tarifa) %></p>
		<p>Portanto, seu consumo aproximado é de <%= formatter.format(consumoAprox) %>kWh</p>
		<p>Para manter sua conta de luz ativa, estipulamos um mínimo de consumo de 30kWh</p>
		<p>Então, calculamos que será necessária uma potência de <%= formatter.format(potencia) %>kWp para suprir o restante de seu consumo</p>
		<p>Para isso, serão necessárias <%= numeroDePlacas %> painéis solares</p>
		<p>Totalizando R$<%= formatter.format(precoFinal) %></p>
		
		
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" type="button" onclick="location.href='/Solar'" name="voltar">
	    	<i class="mdl-icon-toggle__label material-icons">home</i>Voltar
		</button>&ensp;&ensp;&ensp;
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" 
		type="button" onclick="location.href='/Solar/orcamentoCompleto.jsp'" 
		name="voltar" style="padding-left: 24px">
	    	Seguir para orçamento detalhado<i class="mdl-icon-toggle__label material-icons branco">arrow_forward</i>
		</button>
	</div>
</body>
</html>