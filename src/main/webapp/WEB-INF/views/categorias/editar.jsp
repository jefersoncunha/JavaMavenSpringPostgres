<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Categorias Listas</title>
      <jsp:include page="../inc/stylesheets.jsp"></jsp:include>
    </head>

      <div class="container">
          <jsp:include page="../inc/menu_horizontal.jsp"></jsp:include>
          
          
          
          
          <div class="panel panel-default">
		    <div class="panel-heading">
		         <h2 class="panel-title pull-left">
						Editar Categorias
		         </h2>

		        <form action="CategoriaEditar?id=${catEdit.id}" class="form-inline pull-right">
				  <div class="form-group">
				    <input type="text" class="form-control" id="nome" placeholder="Nome Categoria">
				  </div>
				  <button type="submit"  value="categoriaCadastrar" class="btn btn-default">Cadastrar</button>
				</form>
						        

		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">
		    

		        <form action="categoriaEditar" class="form-inline">
				  <div class="form-group">
				    <input type="text" class="form-control" id="nome" placeholder="${catEdit.nome}" value="${catEdit.nome}">
				  </div>
				  <input type="hidden"  id="id" name="id" value="${catEdit.id}">
				  
				  <button type="submit" class="btn btn-default">Editar!</button>
				</form>
				
 
		    </div>
		</div>
	


       
      <jsp:include page="../inc/rodape.jsp"></jsp:include>
      </div> <!-- END CONTAINER -->
      <jsp:include page="../inc/javascript.jsp"></jsp:include>
      

      
      </body>
      </html>
