<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Clientes Listas</title>
      <jsp:include page="../inc/stylesheets.jsp"></jsp:include>
    </head>

      <div class="container">
          <jsp:include page="../inc/menu_horizontal.jsp"></jsp:include>
              
          <div class="panel panel-default">
		    <div class="panel-heading">
		         <h2 class="panel-title pull-left">
						Listar Clientes
		         </h2>
		         
		        <a class="btn btn-default pull-right" title="Listar Cliente"
					href="clienteListar" >
					voltar
				</a>


		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">
		    
		    
		    <form action="clienteCadastrar">
			 
			  <div class="form-group">
			    <label for="exampleInputEmail1">Nome</label>
			    <input type="text" class="form-control" id="nome" placeholder="Nome Cliente" name="nome">
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">Email</label>
			    <input type="email" class="form-control" id="email" placeholder="Email Cliente" name="email">
			  </div>
			  
			  <div class="form-group">
			    <label for="exampleInputEmail1">Fone</label>
			    <input type="text" class="form-control" id="fone" placeholder="Email Fone" name="fone">
			  </div>


			  <button type="submit" class="btn btn-default pull-right">Cadastrar!</button>
			</form>
				  

		    
		    </div>
		</div>

       
      <jsp:include page="../inc/rodape.jsp"></jsp:include>
      </div> <!-- END CONTAINER -->
      <jsp:include page="../inc/javascript.jsp"></jsp:include>
      

      
      </body>
      </html>
