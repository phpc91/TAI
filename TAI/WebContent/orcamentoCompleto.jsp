<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<style>
h1 {
	text-align: center;
	font-family: calibri
}

p {
	font-family: calibri
}

/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 480px;
	width: 640px;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 10px;
	padding: 5px;
}

#floating-panel {
	position: absolute;
	width:300px;
	/*top: 10px;*/
	left: 525px;
	z-index: 5;
	background-color: #fff;
	margin: 20px;
	padding: 5px;
	border: 1px solid #999;
	text-align: center;
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}
</style>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.blue-indigo.min.css" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	type="text/css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<meta charset="UTF-8">
<title>TAI</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
</head>

<!-- <body>
	<!-- esse cara não serve, não posso marcar pto no mapa
	<iframe width="600" height="450" frameborder="0" style="border: 0"
		src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAp9acaoEF3Vc9m0uy980KDtdox0r-oDD8
		&maptype=satellite
		&zoom=15
		&q=06519405+Brazil"
		allowfullscreen> </iframe>
</body> -->
<body>
	<h1>Orçamento Detalhado</h1>
	<div id="form" style="text-align: center">
		<form method="post" action="retornaremos.jsp">
			<!-- form action? -->
			<div
				class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="nome"> <label
					class="mdl-textfield__label" for="nome">Nome Completo</label>
			</div>
			<br>
			<div
				class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="tel"
					pattern="-?[0-9]*(\.[0-9]+)?" title="Insira apenas números">
				<label class="mdl-textfield__label" for="tel">Telefone</label>
			</div>
			<br>
			<div
				class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="email"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
					title="Insira endereço de email válido"> <label
					class="mdl-textfield__label" for="tel">Email</label>
			</div>
			<br>
			<div
				class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="valor"
					pattern="-?[0-9]*(\.[0-9]+)?" title="Insira apenas números">
				<label class="mdl-textfield__label" for="valor">Valor da
					Conta de Luz</label>
			</div>
			<br>
			<!-- <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="endereco" title="Logradouro, número, CEP, cidade, estado">
				<label class="mdl-textfield__label" for="endereco">Endereço</label>
			</div><br>  -->
			<div style="font-family: helvetica">
				<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
					for="telcontato"> <input type="radio" id="telcontato"
					class="mdl-radio__button" name="contato" value="1" checked>
					<span class="mdl-radio__label">Telefone</span>
				</label>&emsp;&emsp; 
				<label
					class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
					for="emailcontato"> 
					<input type="radio" id="emailcontato"
					class="mdl-radio__button" name="contato" value="2"> 
					<span
					class="mdl-radio__label">Email</span>
				</label>
			</div>
<!-- TODO trocar botoes para MDL, icone de upload -->
			<p>Deseja pré agendar uma visita técnica?</p>
			<input type="date" name="data" id="data"><br> <br>
			<br> <br>
			<p>Foto da conta de luz</p>
			<input type="file"> <input type="submit" value="Calcular">
		</form><br>
		<div id="floating-panel">
			<input id="enderecoCasa" type="text"> 
			<input id="buscar" type="button" value="Localizar">
		</div>
		<br><div id="map" style="position:relative;left:355px"></div>
	</div>

	<!-- TODO satelite, autozoom, zerar pins após nova busca, balao info do pin, reverse geocode-> coordenadas p/ backend -->
	<script>
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : {
					lat : -23.5890617,
					lng : -46.651651
				}
			});
			var geocoder = new google.maps.Geocoder();

			document.getElementById('buscar').addEventListener('click',
					function() {
						geocodeAddress(geocoder, map);
					});
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('enderecoCasa').value;
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker(
											{
												map : resultsMap,
												position : results[0].geometry.location,
												draggable : true
											});
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4JJ9AxSaKKm7D4lE5pUMXDEunaggaSsk&callback=initMap">
</script>
</body>
</html>