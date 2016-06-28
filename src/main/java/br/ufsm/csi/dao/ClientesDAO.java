package br.ufsm.csi.dao;

import br.ufsm.csi.model.util.ConectarPostGressFactory;
import br.ufsm.csi.modelo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class ClientesDAO {

	private Connection conn = (Connection) ConectarPostGressFactory.getConexao();
	private PreparedStatement stmt;
	private String query;


	public ArrayList<Clientes> listarClientes() {

		System.out.println("#....CLIENTES DAO - clientes_listar ... ");

		ArrayList<Clientes> Clientes = new ArrayList<Clientes>();

		try{
			this.query = "SELECT * FROM clientes";

			stmt = conn.prepareStatement(this.query);
			
			ResultSet rs = stmt.executeQuery();


			while(rs.next()){

				Clientes cli_new = new Clientes();

				cli_new.setId(rs.getInt("id"));
				cli_new.setNome(rs.getString("nome"));
				cli_new.setEmail(rs.getString("email"));
				cli_new.setFone(rs.getString("fone"));

		        Clientes.add(cli_new);
		      }


			stmt.close();
			conn.close();

		}catch(Exception e){
			e.printStackTrace();
		}

		return Clientes;
	}

	public boolean CadastrarCliente(Clientes cli) throws Exception{
		System.out.println("#....CLIENTES DAO - CadastrarCliente ... ");

		query = " insert into Clientes(nome, email, fone) values (?,?,?); ";
		stmt = conn.prepareStatement(query);
		stmt.setString(1, cli.getNome());
		stmt.setString(2, cli.getEmail());
		stmt.setString(3, cli.getFone());
		try{
			stmt.execute();
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}

	public boolean ExcluirCliente(Clientes cli) {
		System.out.println("#....CLIENTES DAO - ExcluirCliente... ");

		boolean retorno = false;
		Connection conn = null;
		PreparedStatement stmt = null;
		conn = ConectarPostGressFactory.getConexao();

		try {

			String sql= "";

			System.out.println("......... vai excluir Cliente ............." + cli.getId());

			sql = "BEGIN;"
				+ "delete from pagamentos where cliente=?;"
				+ "delete from clientes where id=?;"
				+ "COMMIT";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cli.getId());
			stmt.setInt(2, cli.getId());
			stmt.execute();
			stmt.close();

			retorno = true;

		} catch (Exception e) {
			e.printStackTrace();
			return retorno;

		}

		return retorno;

	}

	public Clientes BuscarCliente(Clientes cli) {
		System.out.println("#....CLIENTES DAO - BuscarCliente... "+cli.getId());

		try {

			PreparedStatement stmt = ConectarPostGressFactory.getConexao().prepareStatement("select * from Clientes where id=?;");
			stmt.setLong(1, cli.getId());

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				cli.setId(rs.getInt("id"));
				cli.setNome(rs.getString("nome"));
				cli.setEmail(rs.getString("email"));
				cli.setFone(rs.getString("fone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return cli;
	}

	public boolean EditarCliente(Clientes cli) {

		System.out.println("#....CLIENTES DAO - EditarCliente... "+cli.getId());

		boolean retorno = false;
		Connection c = null;
		PreparedStatement stmt = null;
		c = ConectarPostGressFactory.getConexao();

		try {

			String sql = "";

			System.out.println("#...UPDATE Cliente ID"+cli.getId() );
			sql = "UPDATE clientes SET nome =?, email =?, fone =? WHERE id =" + cli.getId() + "";

			stmt = c.prepareStatement(sql);
			stmt.setString(1, cli.getNome());
			stmt.setString(2, cli.getEmail());
			stmt.setString(3, cli.getFone());

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
