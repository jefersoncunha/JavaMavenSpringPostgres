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
						Listar Pagamentos
		         </h2>
		         
		   
		         <a class="btn btn-default pull-right" title="Cadastrar Cliente"
					href="cadastroPagamento" >
					Cadastrar Pagamentos
				</a>


		        <div class="clearfix"></div>
		    </div>
		    <div class="panel-body">
		    
		    
		    
				  <c:if test="${pagList!=null}">
		          <table class="table table-striped table-bordered">
		            <tr>
		              <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      ID
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      Nome
		                    </span>
		                  </strong>
		                </div>
		              </td>
		               <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      Cliente
		                    </span>
		                  </strong>
		                </div>
		              </td>
		               <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      Categoria
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      Valor
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      Recorrencia
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div aling="center">
		                  <strong>
		                    <span class="style5">
		                      Data I
		                    </span>
		                  </strong>
		                </div>
		              </td>
		               <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      Data F
		                    </span>
		                  </strong>
		                </div>
		              </td>
		              <td>
		                <div>
		                  <strong>
		                    <span class="style5">
		                      Ações
		                    </span>
		                  </strong>
		                </div>
		              </td>
		            </tr>
		            
		            <c:forEach var="pag" items="${pagList}">
		              <tr>
		              
				        <td>${pag.id}</td>
		                <td>${pag.nome}</td>
		                <td>${pag.cli}</td>
		                <td>${pag.cat}</td>
		                <td>${pag.valor}</td>
		                <td>${pag.rec}</td>
		                <td>${pag.dataI}</td>
		                <td>${pag.dataF}</td>
		                
		                

		                <td><a class="btn btn-default " title="Alterar"
		                		href="buscarPagamento?id=${pag.id}">
								<span class="glyphicon glyphicon-edit"></span> 
							</a> 
							<a class="btn btn-default" title="Deletar"
							   href="pagamentoExcluir?id=${pag.id}" >
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
