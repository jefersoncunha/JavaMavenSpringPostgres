<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Pagamentos Cadastrar</title>
      <jsp:include page="../inc/stylesheets.jsp"></jsp:include>
    </head>

      <div class="container">
          <jsp:include page="../inc/menu_horizontal.jsp"></jsp:include>
              
          <div class="panel panel-default">
		    <div class="panel-heading">
		         <h2 class="panel-title pull-left">
						Listar Pagamentos
		         </h2>
		         
		        <a class="btn btn-default pull-right" title="Pagamentos Listar"
					href="pagamentosListar" >
					voltar
				</a>


		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">
		    
		    
		    <form action="pagamentoCadastrar">
			 
			  <div class="form-group">
			    <label for="nome">Nome</label>
			    <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome">
			  </div>
			  

			  <div class="form-group">
			    <label for="valor">Valor</label>
			    
			    <input type="text" class="form-control" id="valor" placeholder="Valor" name="valor">
			  </div>

  
			  <div class="form-group">
			    <label for="datai">Data Inicial</label>
			    <input type="text" class="form-control" id="dataI" name="dataI" placeholder="data Inicial" >
			  </div>
			  <div class="form-group">
			    <label for="dataf">Data Final</label>
			    <input type="text" class="form-control" id="dataF"  name="dataF" placeholder="Data Final">
			  </div>
			  
			   <div class="form-group">
		          <label>Clientes</label>
		          <select  name="cli" id="cli" onchange="CarregarCliente(this.value)">
		            <option value="0">Selecione o Cliente</option>
		            <c:forEach var="cli" items="${cliList}">
		            	
		              <option value="${cli.id}">${cli.nome}</option>
		            </c:forEach>
		          </select>
		         </div>
		        
		         <div class="form-group">
		          <label>Categoria</label>
		          <select  name="cat" id="cat" onchange="CarregarCategoria(this.value)">
		          	<option value="0">Selecione Categoria</option>
		           	 <c:forEach var="cat" items="${catList}">	
		              <option value="${cat.id}">${cat.nome}</option>
		            </c:forEach>
		          </select>
		        </div>
		        
		         <div class="form-group">
		          <label>Recorrencia</label>
		          <select name="rec" id="rec" onchange="CarregarRecorrencia(this.value)">
		          	 <option value="0">Selecione a Recorrencia</option>
		              <option value="unitaria">Unica</option>
		              <option value="semestral">semestral</option>
		              <option value="mensal">mensal</option>
		              <option value="anual">anual</option>
		          </select>
		        </div>
		        
		        <input type="hidden" value="" id="recorrencia"  name="recorrencia">
		        <input type="hidden" value="" id="categoria"  name="categoria">
		        <input type="hidden" value="" id="cliente"  name="cliente">

	
						        



			  <button type="submit" class="btn btn-default pull-right">Cadastrar!</button>
			</form>
				  

		    
		    </div>
		</div>

       
      <jsp:include page="../inc/rodape.jsp"></jsp:include>
      </div> <!-- END CONTAINER -->
      <jsp:include page="../inc/javascript.jsp"></jsp:include>
      
      <script>
      

	  	function CarregarRecorrencia(valor){
	  		
	  		document.getElementById("recorrencia").value = valor;
	  		console.log(valor);
	  		
	  	}
		function CarregarCategoria(valor){
	  		
	  		document.getElementById("categoria").value = valor;
	  		console.log(valor);
	  		
	  	}
		function CarregarCliente(valor){
	  		
	  		document.getElementById("cliente").value = valor;
	  		console.log(valor);
	  		
	  	}
      
      </script>
      

      
      </body>
      </html>
