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

		        <a class="btn btn-default pull-right" title="Cadastrar Cliente"
					href="cadastroCliente" >
					Cadastrar Cliente
				</a>
						        

		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">

				
			<form action="clienteEditar?id=${cliEdit.id}">
			 
			  <div class="form-group">
			    <label for="exampleInputEmail1">Nome</label>
			    <input type="text" class="form-control" id="nome" name="nome" value="${cliEdit.nome}" placeholder="${cliEdit.nome}" >
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email</label>
			    <input type="email" class="form-control" id="email" name="email" value="${cliEdit.email}" placeholder="${cliEdit.email}">
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">Fone</label>
			    <input type="text" class="form-control" id="fone" name="fone" value="${cliEdit.fone}" placeholder="${cliEdit.fone}">
			  </div>

				<input type="hidden"  id="id" name="id" value="${cliEdit.id}">

			  <button type="submit" class="btn btn-default pull-right">Editar!</button>
			</form>
				
 
		    </div>
		</div>
	


       
      <jsp:include page="../inc/rodape.jsp"></jsp:include>
      </div> <!-- END CONTAINER -->
      <jsp:include page="../inc/javascript.jsp"></jsp:include>
      

      
      </body>
      </html>
