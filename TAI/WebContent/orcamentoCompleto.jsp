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
	/*	position: absolute; */
	top: 10px;
	left: 25%;
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div id="form">
		<form method="post" action="retornaremos.jsp">
			<!-- form action? -->
			<p title="Nome completo">Nome:</p>
			<input type="text" name="nome" id="nome"><br>
			<br>
			<p title="Insira apenas números">Telefone para contato:</p>
			<input type="tel" name="telefone" id="telefone"><br>
			<br>
			<p>Email:</p>
			<input type="email" name="email" id="email"><br>
			<br>
			<p
				title="Inserir apenas números. É necessário que o valor seja acima de R$10,00">
				Valor da conta de luz:</p>
			<input type="number" name="valor" id="valor"><br>
			<br>
			<p>Endereço:</p>
			<input type="text" name="endereco" id="endereco"><br>
			<br>
			<p>Como prefere que entremos em contato?</p>
			<input type="radio" name="pref" id="pref" value="Telefone">Telefone<br>
			<input type="radio" name="pref" id="pref" value="Email">Email<br>
			<br>
			<p>Deseja pré agendar uma visita técnica?</p>
			<input type="date" name="data" id="data"><br>
			<br> <br>
			<br>
			<p>Foto da conta de luz</p>
			<input type="file">
			<input type="submit" value="Calcular">
		</form>
	</div>
	<div id="floating-panel">
				<input id="address" type="textbox"> <input id="submit"
					type="button" value="Localizar">
			</div>
			<div id="map"></div>

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

			document.getElementById('submit').addEventListener('click',
					function() {
						geocodeAddress(geocoder, map);
					});
		}

		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('address').value;
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap
											.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : resultsMap,
										position : results[0].geometry.location
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