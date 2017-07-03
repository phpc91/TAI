<%@page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<style>
		h1	{text-align:center;font-family:calibri}
		h3	{text-align:center;font-family:calibri}
		h4	{text-align:center;font-family:calibri}
		p	{font-family:calibri}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>TAI</title>
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
	<h4>Detalhes</h4><br>
	<p>De acordo com a sua cidade, identificamos que a tarifa por kWh é de R$<%= formatter.format(tarifa) %></p>
	<p>Portanto, seu consumo aproximado é de <%= formatter.format(consumoAprox) %></p>
	<p>Para manter sua conta de luz ativa, estipulamos um mínimo de consumo de 30kWh</p>
	<p>Então, calculamos que será necessária uma potência de <%= formatter.format(potencia) %>kWp para suprir o restante de seu consumo</p>
	<p>Para isso, serão necessárias <%= numeroDePlacas %> painéis solares</p>
	<p>Totalizando R$<%= formatter.format(precoFinal) %></p>
	
	<a href="/TAI/orcamentoCompleto.jsp">Clique aqui para realizar um orçamento mais detalhado</a><br>
	<a href="/TAI/">Voltar à página inicial</a>
</body>
</html>