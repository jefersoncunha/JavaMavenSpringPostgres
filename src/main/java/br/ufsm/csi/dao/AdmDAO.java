package br.ufsm.csi.dao;

import java.util.ArrayList;


import br.ufsm.csi.model.util.ConectarPostGressFactory;
import br.ufsm.csi.modelo.*;
import java.sql.*;

public class AdmDAO {
	private Connection conn = (Connection) ConectarPostGressFactory.getConexao();
	private PreparedStatement stmt;
	private boolean autenticado = false;
	private String sql, query;

	public int LOGAR(Adm a) throws SQLException {
		String query = "select id from login where nome =? and senha=?";
		PreparedStatement pstmt = ConectarPostGressFactory.getConexao().prepareStatement(query);
		pstmt.setString(1, a.getNome());
		pstmt.setString(2, a.getSenha());

		int id=0;
		ResultSet resultSet = pstmt.executeQuery();
		resultSet.next();
		id = resultSet.getInt("id");
		a.setCodigo(id);
		//a.codigo=id;
		System.out.println("%%%Codigo%%"+id);

		if (id > 0)
			return id;
		else
			return 0;

	}

	public boolean cadastrarAdm (Adm a) throws Exception{

		sql = " insert into login(nome,senha) values (?,?); ";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, a.getNome());
		stmt.setString(2, a.getSenha());

		try{
			stmt.execute();
			autenticado = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return autenticado;
	}
	public ArrayList<Adm> listarAdm() {

	  ArrayList<Adm> Adm = new ArrayList<Adm>();

	  try{
	    this.query = "SELECT * FROM login";

	    stmt = conn.prepareStatement(this.query);

	    ResultSet rs = stmt.executeQuery();

	     while(rs.next()){
	       Adm a = new Adm();

	       a.setCodigo(rs.getInt("id"));
	       a.setNome(rs.getString("nome"));
	       a.setSenha(rs.getString("senha"));

	       Adm.add(a);
	     }

	    stmt.close();
	    conn.close();

	  }catch(Exception e){
	    e.printStackTrace();
	  }
	  return Adm;
	}

	public boolean ExcluirAdm(Adm a) {
	  System.out.println("#....Adm DAO - ExcluirAdm... ");

	  boolean retorno = false;
	  Connection conn = null;
	  PreparedStatement stmt = null;
	  conn = ConectarPostGressFactory.getConexao();

	  try {

	    String sql= "";

	    System.out.println("......... vai excluir Adm ............." + a.getCodigo());

	    sql ="delete from login where id=?;";

	    stmt = conn.prepareStatement(sql);
	    stmt.setInt(1, a.getCodigo());
	    stmt.execute();
	    stmt.close();

	    retorno = true;

	  } catch (Exception e) {
	    e.printStackTrace();
	    return retorno;
	  }

	  return retorno;
	}

	public Adm BuscarAdm(Adm a) {
	  System.out.println("#....Adm DAO - BuscarAdm... "+a.getCodigo());

	  try {

	    PreparedStatement stmt = ConectarPostGressFactory.getConexao().prepareStatement("select * from login where id=?;");
	    stmt.setLong(1, a.getCodigo());

	    ResultSet rs = stmt.executeQuery();
	    while (rs.next()) {
	      a.setCodigo(rs.getInt("id"));
	      a.setNome(rs.getString("nome"));
	      a.setSenha(rs.getString("senha"));
	    }
	  } catch (Exception e) {
	    e.printStackTrace();
	  }

	  return a;
	}

	public boolean EditarAdm(Adm a) {

	  System.out.println("#....Adm DAO - EditarAdm... "+a.getCodigo());

	  boolean retorno = false;
	  Connection c = null;
	  PreparedStatement stmt = null;
	  c = ConectarPostGressFactory.getConexao();

	  try {

	    String sql = "";

	    System.out.println("#...UPDATE login ID"+a.getCodigo() );
	    sql = "UPDATE login SET nome =?, senha =? WHERE id =" + a.getCodigo() + "";

	    stmt = c.prepareStatement(sql);
	    stmt.setString(1, a.getNome());
	    stmt.setString(2, a.getSenha());

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
