package br.ufsm.csi.dao;

import br.ufsm.csi.model.util.ConectarPostGressFactory;
import br.ufsm.csi.modelo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class CategoriasDAO {

	private Connection conn = (Connection) ConectarPostGressFactory.getConexao();
	private PreparedStatement stmt;
	private String query;
	
	
	public ArrayList<Categorias> listarCategorias() {
		
		ArrayList<Categorias> categorias = new ArrayList<Categorias>();
		
		try{
			this.query = "SELECT * FROM categorias";
			
			stmt = conn.prepareStatement(this.query);
			
			ResultSet rs = stmt.executeQuery();
			
			 while(rs.next()){
			   Categorias cat = new Categorias();

			   cat.setId(rs.getInt("id"));
			   cat.setNome(rs.getString("nome"));

			   categorias.add(cat);
			 }
			
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return categorias;
	}

	public boolean CadastrarCategoria(Categorias cat) throws Exception{
		
		query = " insert into categorias(nome) values (?); ";	
		stmt = conn.prepareStatement(query);
		stmt.setString(1, cat.getNome());
		try{
			stmt.execute();			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return true;
	}
	
	public boolean ExcluirCategoria(Categorias cat) {
		boolean retorno = false;
		Connection conn = null;
		PreparedStatement stmt = null;;
		conn = ConectarPostGressFactory.getConexao();

		try {

			String sql= "";

			System.out.println("......... vai excluir categoria ............." + cat.getId());
			
			sql = "BEGIN;"
				+ "delete from pagamentos where categoria=?;"
				+ "delete from categorias where id=?;"
				+ "COMMIT;";
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cat.getId());
			stmt.setInt(2, cat.getId());		
			stmt.execute();
			stmt.close();

			retorno = true;

		} catch (Exception e) {
			e.printStackTrace();
			return retorno;

		}

		return retorno;

	}

	public Categorias BuscarCategoria(Categorias c) {
		System.out.println("dentro do busca categorias");
		try {

			PreparedStatement stmt = ConectarPostGressFactory.getConexao().prepareStatement("select * from categorias where id=?;");
			stmt.setLong(1, c.getId());

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("Nome"));    
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}
	
	public boolean EditarCategoria(Categorias cat) {
		boolean retorno = false;
		Connection c = null;
		PreparedStatement stmt = null;
		c = ConectarPostGressFactory.getConexao();

		try {

			String sql = "";
			
			System.out.println("#...Alterar Categoria ID"+cat.getId() );
			sql = "UPDATE categorias SET nome =? WHERE id =" + cat.getId() + "";
			stmt = c.prepareStatement(sql);
			stmt.setString(1, cat.getNome());

			stmt.execute();
			stmt.close();
			retorno = true;

		} catch (Exception e) {
			e.printStackTrace();
			return retorno;

		}
		return retorno;

	}
	
	
	  
}
