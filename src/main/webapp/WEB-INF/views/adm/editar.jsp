<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Admin Listas</title>
      <jsp:include page="../inc/stylesheets.jsp"></jsp:include>
    </head>

      <div class="container">
          <jsp:include page="../inc/menu_horizontal.jsp"></jsp:include>




          <div class="panel panel-default">
		    <div class="panel-heading">
		         <h2 class="panel-title pull-left">
						Editar Admin
		         </h2>

						 <form action="adicionarAdmLogado" class="form-inline pull-right">
 							<div class="form-group">
 								<input type="text" class="form-control" id="nome" name="nome" placeholder="nome">
 								</div>
 								<div class="form-group">
 									<input type="password" class="form-control" id="senha" name="senha" placeholder="senha">
 									</div>
 									<button type="submit" class="btn btn-default">Enviar</button>
 								</form>


		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">


		        <form action="admEditar" class="form-inline">
				  <div class="form-group">
				    <input type="text" class="form-control" 
				    
				    name="nome" id="nome" 
				    placeholder="${admEdit.nome}" 
				    value="${admEdit.nome}">
				  </div>
					<div class="form-group">
				    <input type="text" class="form-control" id="senha" name="senha"
				    placeholder="${admEdit.senha}" 
				    value="${admEdit.senha}">
				  </div>
				  <input type="hidden"  id="codigo" name=codigo value="${admEdit.codigo}">

				  <button type="submit" class="btn btn-default">Editar!</button>
				</form>


		    </div>
		</div>




      <jsp:include page="../inc/rodape.jsp"></jsp:include>
      </div> <!-- END CONTAINER -->
      <jsp:include page="../inc/javascript.jsp"></jsp:include>



      </body>
      </html>
