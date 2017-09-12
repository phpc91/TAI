<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<style>
.main {
	text-align: center;
	height: 1015px;
}
.video {
	width: 854px;
	position: relative;
	margin-left: 247.5px;
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.blue-indigo.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<meta charset="UTF-8">
<title>Solar</title>
</head>
<body>
	<div class="main">
		<h1>Home</h1>
		<div class="video">
			<h6>Veja abaixo um vídeo explicativo de como funcionam os painéis solares</h6>
			<iframe id="video" width="854" height="480" src="https://www.youtube.com/embed/ilpVP-loDak?autoplay=1&iv_load_policy=3&rel=0" frameborder="0" allowfullscreen> 
			</iframe>
		</div>
		<br>
		<div class="ebook">
			<h6>Deseja baixar um ebook grátis com mais detalhes? Insira aqui seu email e baixe!</h6>
			<form method="get" action="/Solar/resources/img/paineis-solares.png">
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
					<input class="mdl-textfield__input" type="text" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Insira endereço de email válido"> 
					<label	class="mdl-textfield__label" for="tel">Email</label>
				</div>
				<input class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored" type="submit" value="Baixar!">
			</form>
		</div>
		<br>
		<h4>Calculadoras interativas de investimento</h4>
		<h6>Estime aqui!</h6>

		<!-- Flat button with ripple -->
		<button
			class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--raised mdl-button--colored"
			style="width:215px"
			id="simples"
			onclick="location.href='/Solar/orcamento'" type="button">
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
			onclick="location.href='/Solar/orcamento-detalhado'" type="button">
			<strong>Orçamento Detalhado</strong>
		</button>
		<div class="mdl-tooltip mdl-tooltip--large" for="completo">
			Aqui o cálculo é mais completo, visando uma precisão maior 
		</div>
	</div>
</body>
</html>