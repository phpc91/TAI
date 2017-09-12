<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 480px;
	/*width: 640px;*/
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
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700"	type="text/css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<script async src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<meta charset="UTF-8">
<title>Solar</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
</head>
<body>
	<h1 style="text-align:center">Orçamento Detalhado</h1>
	<div style="text-align: center">
		<div class="mdl-grid">
			<div id="formulario" class="mdl-cell mdl-cell--6-col" style="text-align: center">
				<h5>Por favor, insira seus dados abaixo</h5><br>
				<form method="post" action="retornaremos.jsp" enctype="multipart/form-data">
					<!-- form action? -->
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="nome"> 
						<label class="mdl-textfield__label" for="nome">Nome Completo</label>
					</div>
					<br>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="tel" pattern="-?[0-9]*(\.[0-9]+)?" title="Insira apenas números">
						<label class="mdl-textfield__label" for="tel">Telefone</label>
					</div>
					<br>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="Insira endereço de email válido">
						<label class="mdl-textfield__label" for="tel">Email</label>
					</div>
					<br>
					<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input class="mdl-textfield__input" type="text" id="valor" pattern="-?[0-9]*(\.[0-9]+)?" title="Insira apenas números">
						<label class="mdl-textfield__label" for="valor">Valor da Conta de Luz</label>
					</div>
					<br>
					<div>
						<h6>Como prefere ser contatado?</h6>
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
					<br> <br>
					<h6>Faça o upload da sua conta de luz para obtermos uma precisão ainda maior!</h6>
					<input class="ng-hide" id="arquivo" multiple type="file" />
					<label for="arquivo" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect">
					Escolher Arquivo</label>
					<h6>Ou nos envie no nosso whatsapp!&ensp;<img alt="" src="/Solar/resources/img/whatsapp-logo-icone.png" height="27px" width="27px">(11) 99999-9999</h6><br><br>
					<input type="submit" id="submit-form" class="hidden" />
					<!-- <input type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" value="Calcular">  -->
				</form>
				<br> 
				<br>
			</div>
			<div class="mdl-cell mdl-cell--6-col" style="text-align: center">
				<h6>Se desejar, podemos fazer um <strong>modelo 3D</strong> de sua residência!<br>
					Basta digitar seu CEP na busca abaixo<br>
					e depois reposicionar o marcador exatamente no seu telhado</h6>
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
					<input class="mdl-textfield__input" type="text" id="enderecoCasa" pattern="-?[0-9]*(\.[0-9]+)?" title="Insira apenas números">
					<label class="mdl-textfield__label" for="valor">CEP</label>
					<input id="localizar" type="button" style="position: absolute; left: 66.6666%" onclick="" 
					class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" value="Localizar">
				</div><br>
				<div id="map"></div>
			</div>
		</div>
		<br>
		<br>
		<label id="botao-form" for="submit-form" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect">Enviar dados</label>
	</div>

	<!-- TODO coordenadas p/ backend -->
	<script>
		var map;
		var geocoder;
		var marker = null;
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
			zoom : 12,
			mapTypeId: 'hybrid',
			fullscreenControl: false,
			mapTypeControl: false,
			zoomControl: true,
			center : {
				lat: -23.494341,
				lng: -46.850773
			}
		});
			map.setTilt(0);
			geocoder = new google.maps.Geocoder();
			
			document.getElementById('localizar').addEventListener('click',
					function() {
						geocodeAddress(geocoder, map);
					});
		}
		
		function geocodeAddress(geocoder, resultsMap) {
			var address = document.getElementById('enderecoCasa').value;
			geocoder.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									resultsMap.setCenter(results[0].geometry.location);
									if(marker != null) {
										marker.setMap(null);
									}
									marker = new google.maps.Marker(
											{
												map : resultsMap,
												position : results[0].geometry.location,
												animation: google.maps.Animation.DROP,
												draggable : true,
												title:"Coloque sobre o telhado da sua casa!"
											});
									resultsMap.setZoom(18); //ou 19
									
									marker.addListener('dragend', function(){
										var lat = marker.getPosition().lat();
										var lng = marker.getPosition().lng();
										console.log("lat: "+lat);
										console.log("lng: "+lng);
										resultsMap.setZoom(19);
										resultsMap.panTo(marker.getPosition());
									});
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		}
	</script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA4JJ9AxSaKKm7D4lE5pUMXDEunaggaSsk&callback=initMap"></script>
</body>
</html>