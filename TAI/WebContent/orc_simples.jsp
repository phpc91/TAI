<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TAI</title>
</head>
<body>
	<h1>Orçamento rápido</h1>
	<form action="/TAI/calcular_simples.jsp" method="post">
		Valor da conta de luz:<br> <input type="number" name="valor"><br>
		CEP:<br> <input type="number" name="cep"><br> <!-- validar CEP -->
		<br> <input type="submit" value="Calcular">
	</form>
</body>
</html>
<!-- para selecionar a casa via google maps, 
redirecionar usuário para maps.google.com, 
pegar lat/lon do pto selecionado, retornar com local -->