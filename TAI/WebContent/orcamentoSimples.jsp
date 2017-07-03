<%@ page import="entidades.Estado" %>
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
	<%String[] nomesCidades = (String[]) request.getAttribute("nomesCidades"); %>
	<%Integer[] idsCidades = (Integer[]) request.getAttribute("idsCidades"); %>
	
	<h1>Orçamento rápido</h1>
	<div style="text-align:center">
		<form method="post" action="${pageContext.request.contextPath}/orcamento"> <!-- form action? -->
			<p title="Inserir apenas números. É necessário que o valor seja acima de R$10,00">
			Valor da conta de luz:</p> <input type="number" name="valor" id="valor"><br><br>
			<!-- <p title="Inserir apenas números">CEP:</p> <input type="number" name="cep"><br><br> <!-- validar CEP -->
			<p title="Cidade onde reside">Cidade:</p> 
			<select name="cidade" id="cidade">
				<% for (int i = 0; i < nomesCidades.length; i++){ %>
				<option value="<%= idsCidades[i] %>"><%= nomesCidades[i] %></option>
				<% } %>
			</select>
			<p title=""></p> <input type="radio" value="Fisica">Pessoa Física<br>
			<p title=""></p> <input type="radio" value="Juridica">Pessoa Jurídica<br>
			<br><br><input type="submit" value="Calcular">
		</form>
	</div>
</body>
</html>
<!-- para selecionar a casa via google maps, 
redirecionar usuário para maps.google.com, 
pegar lat/lon do pto selecionado, retornar com local -->