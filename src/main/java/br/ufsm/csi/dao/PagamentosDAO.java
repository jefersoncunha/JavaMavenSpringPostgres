package br.ufsm.csi.dao;

import br.ufsm.csi.modelo.*;
import br.ufsm.csi.model.util.ConectarPostGressFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PagamentosDAO {

	private Connection conn = (Connection) ConectarPostGressFactory.getConexao();
	private PreparedStatement stmt;
	String query;

	
	public ArrayList<Pagamentos> listarPagamentos() {
		
		System.out.println("#....Pagamentos DAO -  ... ");
		
		ArrayList<Pagamentos> pag = new ArrayList<Pagamentos>();
		
		try{
			this.query = "SELECT * FROM pagamentos";
			
			stmt = conn.prepareStatement(this.query);
			
			ResultSet rs = stmt.executeQuery();
			

			while(rs.next()){
				
				Pagamentos p = new Pagamentos (); 
		    	 
		    	  p.setId(rs.getInt("id"));
		    	  p.setNome(rs.getString("nome"));
		    	  p.setValor(rs.getFloat("valor"));
		    	  p.setRec(rs.getString("recorrencia"));
		    	  p.setDataI(rs.getString("datai"));
		    	  p.setDataF(rs.getString("dataf"));  
		    	  
		    	  p.setCat(rs.getInt("categoria"));
		    	  p.setCli(rs.getInt("cliente"));
		    	  
	 
		         pag.add(p);
		      }
			
			
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pag;
	}
	
	public boolean cadastrarPagamento(Pagamentos pag) throws Exception{
		System.out.println("#....Pagamento DAO - CADASTRAR ... ");
		
		query = " insert into Pagamentos(nome, valor, categoria, recorrencia, cliente, datai, dataf) values (?,?,?,?,?,?,?); ";	
		
		stmt = conn.prepareStatement(query);
		stmt.setString(1, pag.getNome());
		stmt.setFloat(2,  pag.getValor());
		stmt.setInt(3,    pag.getCat());
		stmt.setString(4, pag.getRec());
		stmt.setInt(5,    pag.getCli());
		
		stmt.setString(6, pag.getDataI());
		stmt.setString(7, pag.getDataF());

		try{
			stmt.execute();			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return true;
	}
	
	public Pagamentos BuscarPagamento(Pagamentos p) {
		System.out.println("#....PAGAMENTOS DAO - BuscarPagamento... "+p.getId());
		
		try {

			PreparedStatement stmt = ConectarPostGressFactory.getConexao().prepareStatement("select * from pagamentos where id=?;");
			stmt.setLong(1, p.getId());

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				  p.setId(rs.getInt("id"));
		    	  p.setNome(rs.getString("nome"));
		    	  p.setValor(rs.getFloat("valor"));
		    	  p.setRec(rs.getString("recorrencia"));
		    	  p.setDataI(rs.getString("datai"));
		    	  p.setDataF(rs.getString("dataf"));  
		    	  
		    	  p.setCat(rs.getInt("categoria"));
		    	  p.setCli(rs.getInt("cliente"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}
	public boolean EditarPagamento(Pagamentos pag) {
		
		System.out.println("#....PAGAMENTOS DAO - EditarPagamento... "+pag.getId());
		
		boolean retorno = false;
		Connection c = null;
		PreparedStatement stmt = null;
		c = ConectarPostGressFactory.getConexao();

		try {

			String sql = "";
			
			System.out.println("#...UPDATE Pagamento ID"+pag.getId() );
			sql = "UPDATE pagamentos SET nome=?, valor=?, categoria=?, recorrencia=?, cliente=?, datai=?, dataf=? WHERE id =" + pag.getId() + "";
			

			stmt = c.prepareStatement(sql);
			stmt.setString(1, pag.getNome());
			stmt.setFloat(2, pag.getValor());
			stmt.setInt(3, pag.getCat());
			stmt.setString(4, pag.getRec());
			stmt.setInt(5, pag.getCli());
			stmt.setString(6, pag.getDataI());
			stmt.setString(7, pag.getDataF());

			stmt.execute();
			stmt.close();
			retorno = true;

		} catch (Exception e) {
			e.printStackTrace();
			return retorno;

		}
		return retorno;

	}
	public boolean ExcluirPagamento(Pagamentos pag) {
		System.out.println("#....PAGAMENTO DAO - ExcluirPagamento... "+pag.getId());
		
		boolean retorno = false;
		Connection conn = null;
		PreparedStatement stmt = null;
		conn = ConectarPostGressFactory.getConexao();

		try {

			String sql = "";

			sql = "delete from Pagamentos where id=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, pag.getId());

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

