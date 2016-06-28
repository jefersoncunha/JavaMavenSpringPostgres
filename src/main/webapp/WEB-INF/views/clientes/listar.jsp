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
		         
		   
		         <a class="btn btn-default pull-right" title="Cadastrar Cliente"
					href="cadastroCliente" >
					Cadastrar Cliente
				</a>


		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">
		    
		    
		    
				  <c:if test="${cliList!=null}">
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
		                      Email
		                    </span>
		                  </strong>
		                </div>
		              </td>
		               <td>
		                <div aling="center">
		                  <strong>
		                    <span class="style5">
		                      Fone
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div aling="center">
		                  <strong>
		                    <span class="style5">
		                      Ações
		                    </span>
		                  </strong>
		                </div>
		              </td>
		            </tr>
		            
		            <c:forEach var="cli" items="${cliList}">
		              <tr>
		                <td>${cli.id}</td>
		                <td>${cli.nome}</td>
		                <td>${cli.email}</td>
		                <td>${cli.fone}</td>
		                <td><a class="btn btn-default " title="Alterar"
		                		href="buscarCliente?id=${cli.id}">
								<span class="glyphicon glyphicon-edit"></span> 
							</a> 
	
							<a class="btn btn-default"
									onclick="return confirm('Apagamento Este Cliente, Voce apagara todos os seus pagamentos, Confirma?');"
									href="clienteExcluir?id=${cli.id}"> 
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
