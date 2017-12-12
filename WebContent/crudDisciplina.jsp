<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%@ page import="java.util.List"%>
		<%@ page import="br.com.prog3.trabalho5pc3.MatheusDeAzevedoFeitosa.Disciplina" %>
		<%@ page import="br.com.prog3.trabalho5pc3.MatheusDeAzevedoFeitosa.CrudDisciplina"%>
		<%
		final String PESQUISAR = "Pesquisar";
		final String INCLUIR = "Incluir";
		final String ALTERAR = "Alterar";
		final String EXCLUIR = "Excluir";
		
		CrudDisciplina crudeDisciplina = new CrudDisciplina();
		String crud = null;
		String codigo = null;
		try{
			codigo = request.getParameter("codigo");
			crud = request.getParameter("crud");
		}catch(Exception e){
			out.print("Excelção: "+e.getMessage());
		}
		switch(crud){
			case PESQUISAR:
	%>
	<table>
		<tr>
			<th>Código</th>
			<th>Descrição</th>
			<th>Carga Horária</th>
		</tr>
	<%
				if(codigo.isEmpty()){
					List<Disciplina> listaDisciplinas = crudeDisciplina.listarTodos();
					for(Disciplina d: listaDisciplinas){
	%>
		<tr>
			<td><%=d.getCodigo() %></td>
			<td><%=d.getDescricao() %></td>
			<td><%=d.getCargaHoraria() %></td>
		</tr>
	<%
					}
				}else{
					Disciplina disciplina;
					try{
						disciplina = crudeDisciplina.buscarPeloCodigo(Integer.parseInt(codigo));
	%>
		<tr>
			<td><%=disciplina.getCodigo() %></td>
			<td><%=disciplina.getDescricao() %></td>
			<td><%=disciplina.getCargaHoraria() %></td>
		</tr>
	<%
					}catch(Exception e){
						out.print("Exceção: "+e.getMessage());
					}
				}
	%>
	</table>
	<%
				break;
			case INCLUIR:
				try{
					Disciplina disciplina = new Disciplina(Integer.parseInt(codigo), 
											request.getParameter("descricao"),
											Integer.parseInt(request.getParameter("cargaHoraria")));
					if(crudeDisciplina.inserir(disciplina))
						out.print("Disciplina adicionada com sucesso!");
					else
						out.print("A Disciplina em questão já existe");
				}catch(Exception e){
					out.print("Exceção: "+e.getMessage());
				}
				break;
			case ALTERAR:
				try{
					Disciplina disciplina = new Disciplina(Integer.parseInt(codigo), 
											request.getParameter("descricao"),
											Integer.parseInt(request.getParameter("cargaHoraria")));
					crudeDisciplina.alterar(disciplina);
					out.print("Disciplina alterada com sucesso!");
				}catch(Exception e){
					out.print("Exceção: "+e.getMessage());
				}
				break;
			case EXCLUIR:
				try{
					if(crudeDisciplina.excluir(Integer.parseInt(codigo)))
						out.print("Disciplina excluida com sucesso!");
					else
						out.print("A Disciplina em questão não existe");
				}catch(Exception e){
					out.print("Exceção: "+e.getMessage());
				}
				break;
		}
	%>
	
<p><a href="disciplina.jsp">Retornar ao formulário</a></p>
</body>
</html>