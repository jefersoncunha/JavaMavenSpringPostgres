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
						Listar Categorias
		         </h2>

		        <form action="categoriaCadastrar" class="form-inline pull-right">
				  <div class="form-group">
				    <input type="text" class="form-control" id="nome" name="nome" placeholder="Nome Categoria">
				  </div>
				  <button type="submit" class="btn btn-default">Cadastrar</button>
				</form>
						        

		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">
		    
		    
		    
				  <c:if test="${listaDeCategorias!=null}">
		          <table class="table table-striped table-bordered">
		            <tr>
		              <td>
		                <div aling="center">
		                  <strong>
		                    <span class="style5">
		                      ID
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div aling="center">
		                  <strong>
		                    <span class="style5">
		                      Nome
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div aling="center">
		                  <strong>
		                    <span class="style5">
		                      Ferramentas
		                    </span>
		                  </strong>
		                </div>
		              </td>
		            </tr>
		            
		            <c:forEach var="cat" items="${listaDeCategorias}">
		              <tr>
		                <td>${cat.id}</td>
		                <td>${cat.nome}</td>
		                <td><a class="btn btn-default " title="Alterar"
		                		href="buscarCategoria?id=${cat.id}">
								<span class="glyphicon glyphicon-edit"></span> 
							</a> 

							<a class="btn btn-default"
									onclick="return confirm('Apagando esta Categoria, voce apagara todos os seus pagamentos, Confirma?');"
									href="categoriaExcluir?id=${cat.id}"> 
									<span class="glyphicon glyphicon-trash"></span> 
							</a>
						</td>
		              </tr>
		            </c:forEach>
		          </table>
		     	 </c:if>

		    
		    </div>
		</div>

       
      <jsp:include page="../inc/rodape.jsp"></jsp:include>
      </div> <!-- END CONTAINER -->
      <jsp:include page="../inc/javascript.jsp"></jsp:include>
      

      
      </body>
      </html>
