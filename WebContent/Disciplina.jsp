<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="form1" action="crudDisciplina.jsp" method="post">
	<table>
	<tr>
		<td>C�digo:</td><td><input type="text" name="codigo"/></td>
	</tr>
	<tr>
		<td>Descri��o:</td><td><input type="text" name="descricao"/></td>
	</tr>
	<tr>
		<td>Carga hor�ria:</td><td><input type="text" name="cargaHoraria"/></td>
	</tr>
	<tr>
		<td><input type="submit" name="crud" value="Pesquisar"/></td>
		<td><input type="submit" name="crud" value="Incluir"/></td>
		<td><input type="submit" name="crud" value="Alterar"/></td>
		<td><input type="submit" name="crud" value="Excluir"/></td>
	</tr>
</table>
</form>
</body>
</html>