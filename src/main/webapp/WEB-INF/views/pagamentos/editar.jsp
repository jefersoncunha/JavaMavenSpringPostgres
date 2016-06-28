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
					Cadastrar Catagoria
				</a>
						        

		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">

				

			
			<form action="pagamentoEditar?id=${pagEdit.id}">
			 
			  <div class="form-group">
			    <label for="nome">Nome</label>
			    <input type="text" class="form-control" id="nome" name="nome" placeholder="${pagEdit.nome}"  value="${pagEdit.nome}">
			  </div>
			  

			  <div class="form-group">
			    <label for="valor">Valor</label>
			    <input type="text" class="form-control" id="valor" name="valor" placeholder="${pagEdit.valor}"  value="${pagEdit.valor}">
			  </div>

  
			  <div class="form-group">
			    <label for="datai">Data Inicial</label>
			    <input type="text" class="form-control" id="dataI" name="dataI" placeholder="${pagEdit.dataI}"  value="${pagEdit.dataI}">
			  </div>
			  <div class="form-group">
			    <label for="dataf">Data Final</label>
			    <input type="text" class="form-control" id="dataF"  name="dataF" placeholder="${pagEdit.dataF}"  value="${pagEdit.dataF}">
			  </div>
			  
			   <div class="form-group">
		          <label>Cliente  -- ${pagEdit.cli} </label>
		          <select  name="cli" id="cli" onchange="CarregarCliente(this.value)">
		            <c:forEach var="cli" items="${cliList}">
		              <option value="${cli.id}">${cli.nome}</option>
		            </c:forEach>
		          </select>
		         </div>
		        
		         <div class="form-group">
		          <label>Categoria -- ${pagEdit.cat}</label>
		          <select  name="cat" id="cat" onchange="CarregarCategoria(this.value)">
		           	 <c:forEach var="cat" items="${catList}">	
		              <option value="${cat.id}">${cat.nome}</option>
		            </c:forEach>
		          </select>
		        </div>
		        
		         <div class="form-group">
		          <label>Recorrencia --  ${pagEdit.rec}</label>
		          <select name="rec" id="rec" onchange="CarregarRecorrencia(this.value)">
		          	  <option value="${pagEdit.rec}">${pagEdit.rec}</option>
		              <option value="unitaria">Unica</option>
		              <option value="semestral">semestral</option>
		              <option value="mensal">mensal</option>
		              <option value="anual">anual</option>
		          </select>
		        </div>
		        
		        <input type="hidden" value="${pagEdit.rec}" id="recorrencia"  name="recorrencia">
		        <input type="hidden" value="${pagEdit.cat}" id="categoria"  name="categoria">
		        <input type="hidden" value="${pagEdit.cli}" id="cliente"  name="cliente">
		        <input type="hidden"  id="id" name="id" value="${pagEdit.id}">


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
