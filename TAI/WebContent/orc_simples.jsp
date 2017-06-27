<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<style>
		h1	{text-align:center;font-family:calibri}
		p	{font-family:calibri}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>TAI</title>
</head>
<body>
	<h1>Orçamento rápido</h1>
	<div style="text-align:center">
		<form action="/TAI/calcular_simples.jsp" method="post">
			<p title="Inserir apenas números">Valor da conta de luz:</p> <input type="number" name="valor"><br><br>
			<!-- <p title="Inserir apenas números">CEP:</p> <input type="number" name="cep"><br><br> <!-- validar CEP -->
			<br><input type="submit" value="Calcular">
		</form>
	</div>
</body>
</html>
<!-- para selecionar a casa via google maps, 
redirecionar usuário para maps.google.com, 
pegar lat/lon do pto selecionado, retornar com local -->