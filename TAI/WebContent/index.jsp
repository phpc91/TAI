<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<style>
div {
	text-align: center
}
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.blue-indigo.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<meta charset="UTF-8">
<title>TAI</title>
</head>
<body>
	<!-- TODO passar para google card -->
	<div class="container">
		<h1>Home</h1>
		<h6>Estime aqui seu investimento</h6>

		<!-- Flat button with ripple -->
		<button
			class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored"
			style="width:215px"
			id="simples"
			onclick="location.href='/TAI/orcamento'" type="button">
			<strong>Orçamento Simples</strong>
		</button>
		<div class="mdl-tooltip mdl-tooltip--large" for="simples">
			Utiliza apenas:<br>
			&#9679 Valor da sua conta de luz<br>
			&#9679 CEP de sua residência
		</div>
		&ensp;&ensp;&ensp;
		<button
			class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored"
			style="width:215px"
			id="completo"
			onclick="location.href='/TAI/orcamentoCompleto.jsp'" type="button">
			<strong>Orçamento Detalhado</strong>
		</button>
		<div class="mdl-tooltip mdl-tooltip--large" for="completo">
			Aqui o cálculo é mais completo, visando uma precisão maior 
		</div>
	</div>
</body>
</html>