package br.ufsm.csi.controler;

import java.sql.SQLException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.ufsm.csi.dao.*;
import br.ufsm.csi.modelo.*;

@Controller
public class Controler {

	protected int id;


	/*#------------------ LOGIN------------------#*/

	@RequestMapping("login")
	public String login() {
		System.out.println("@....chamou o login");
		return "adm/login";
	}
	@RequestMapping("indexRedireciona")
	public String voltarIndex() {
		System.out.println("@....chamou o index");
		return "home";
	}

	@RequestMapping("home")
	public String sair() {
		System.out.println("@....chamou home");
		id=0;
		return "home";
	}

	/*#------------------ Adm------------------#*/
	@RequestMapping("adicionarAdm")
	public String CadastarAdm(Adm adm) throws Exception {
		System.out.println("@.... chamou o cadastrar adm ... ");
		boolean retorno = new AdmDAO().cadastrarAdm(adm);
		if (retorno) {
			return "adm/login";
		} else {
			return "erro";
		}
	}
	
	@RequestMapping("adicionarAdmLogado")
	public String CadastarAdmLogado(Adm adm) throws Exception {
		System.out.println("@.... chamou o cadastrar adm ... ");
		boolean retorno = new AdmDAO().cadastrarAdm(adm);
		if (retorno) {
			return "forward:AdmListar";
		} else {
			return "erro";
		}
	}

	@RequestMapping("logarAdm")
	public String Logar(Adm adm) throws SQLException {
		System.out.println("@.... chamou o LogarAdm  ... ");
		int re = new AdmDAO().LOGAR(adm);
		id = re;// passa id do Adm logado
		if (re > 0) {
			System.out.println("User Login sucesso de id " + id);
			return "forward:home";
		} else {
			return "erro";
		}
	}

	@RequestMapping("AdmListar")
	public ModelAndView listarAdm(Adm a) {
		System.out.println("@....Adm_listar ... ");

		ModelAndView mv = new ModelAndView("adm/listar");
		mv.addObject("listaDeAdm", new AdmDAO().listarAdm());

		return mv;
	}

	@RequestMapping("cadastraAdm")
	public String CadAdm() {
		System.out.println("@....chamou o cadastraAdm");
		return "adm/cadastrarAdm";
	}

	@RequestMapping("adminExcluir")
	public String AdmExcluir(Adm c, HttpServletResponse response) throws SQLException {
		System.out.println("@.... ExcluirAdm ... ");
		boolean retorno = new AdmDAO().ExcluirAdm(c);
		if (retorno) {
			return "forward:AdmListar";
		} else {
			return "erro";
		}
	}

	@RequestMapping("buscarAdm")
	public ModelAndView BuscarAdm(Adm a) {

		System.out.println("@... BuscarAdmin "+a.getCodigo());
		ModelAndView mv = new ModelAndView("adm/editar");
		mv.addObject("admEdit", new AdmDAO().BuscarAdm(a));
		return mv;
	}

	@RequestMapping("admEditar")
	public String EditarCategoria(Adm c) throws SQLException {
		System.out.println("@... EditarAdm ... ");
		boolean retorno = new AdmDAO().EditarAdm(c);
		if (retorno) {
			return "forward:AdmListar";
		} else {
			return "erro";
		}
	}

	/*#------------------ CATEGORIAS------------------#*/

	@RequestMapping("categoriasListar")
	public ModelAndView listarCategorias(Categorias c) {
		System.out.println("@....Categorias_listar ... ");

		ModelAndView mv = new ModelAndView("categorias/listar");
		mv.addObject("listaDeCategorias", new CategoriasDAO().listarCategorias());

		return mv;
	}

	@RequestMapping("categoriaCadastrar")
	public String CadastarCategoria(Categorias c) throws Exception {
		System.out.println("@... Categeoria Cadastrar");
		boolean retorno = new CategoriasDAO().CadastrarCategoria(c);
		if (retorno) {
			return "forward:categoriasListar";
		} else {
			return "erro";
		}
	}


	@RequestMapping("categoriaExcluir")
	public String CategoriaExcluir(Categorias c, HttpServletResponse response) throws SQLException {
		System.out.println("@.... ExcluirProduto ... ");
		boolean retorno = new CategoriasDAO().ExcluirCategoria(c);
		if (retorno) {
			return "forward:categoriasListar";
		} else {
			return "erro";
		}
	}

	@RequestMapping("buscarCategoria")
	public ModelAndView BuscarCategoria(Categorias cat) {

		System.out.println("@... BuscarCategoria "+cat.getId());
		ModelAndView mv = new ModelAndView("categorias/editar");
		mv.addObject("catEdit", new CategoriasDAO().BuscarCategoria(cat));
		return mv;
	}

	@RequestMapping("categoriaEditar")
	public String EditarCategoria(Categorias c) throws SQLException {
		System.out.println("@... EditarCategorias ... ");
		boolean retorno = new CategoriasDAO().EditarCategoria(c);
		if (retorno) {
			return "forward:categoriasListar";
		} else {
			return "erro";
		}
	}

	/*#------------------ CLIENTES------------------#*/

	@RequestMapping("clientesListar")
	public ModelAndView listarclientes(Clientes c) {
	  System.out.println("@....clientes_listar ... ");

	  ModelAndView mv = new ModelAndView("clientes/listar");
	  mv.addObject("cliList", new ClientesDAO().listarClientes());

	  return mv;
	}

	@RequestMapping("cadastroCliente")
	public String irCadastrarCliente() {
		System.out.println("@....Ir Clientes Cadastrar");
		return "clientes/cadastrar";
	}

	@RequestMapping("clienteCadastrar")
	public String Cadastarcliente(Clientes c) throws Exception {
	  System.out.println("@... Categeoria Cadastrar");
	  boolean retorno = new ClientesDAO().CadastrarCliente(c);
	  if (retorno) {
	    return "forward:clientesListar";
	  } else {
	    return "erro";
	  }
	}

	@RequestMapping("clienteExcluir")
	public String clienteExcluir(Clientes c, HttpServletResponse response) throws SQLException {
	  System.out.println("@.... ExcluirProduto ... ");
	  boolean retorno = new ClientesDAO().ExcluirCliente(c);
	  if (retorno) {
	    return "forward:clientesListar";
	  } else {
	    return "erro";
	  }
	}

	@RequestMapping("buscarCliente")
	public ModelAndView Buscarcliente(Clientes cli) {

	  System.out.println("@... Buscarcliente "+cli.getId());
	  ModelAndView mv = new ModelAndView("clientes/editar");
	  mv.addObject("cliEdit", new ClientesDAO().BuscarCliente(cli));
	  return mv;
	}

	@RequestMapping("clienteEditar")
	public String Editarcliente(Clientes c) throws SQLException {
	  System.out.println("@... Editarclientes ... "+c.getId());

	  boolean retorno = new ClientesDAO().EditarCliente(c);
	  if (retorno) {
	    return "forward:clientesListar";
	  } else {
	    return "erro";
	  }
	}

/*#------------------ Pagamentos------------------#*/

	@RequestMapping("pagamentosListar")
	public ModelAndView listarpagamentos(Pagamentos c) {
	  System.out.println("@....Pagamentos_listar ... ");

	  ModelAndView mv = new ModelAndView("pagamentos/listar");
	  mv.addObject("pagList", new PagamentosDAO().listarPagamentos());

	  return mv;
	}

	@RequestMapping("cadastroPagamento")
	public ModelAndView irCadastrarPagamento() {
		System.out.println("@....Ir Pagamentos Cadastrar");

		 ModelAndView mv = new ModelAndView("pagamentos/cadastrar");

		 mv.addObject("catList", new CategoriasDAO().listarCategorias());
		 mv.addObject("cliList", new ClientesDAO().listarClientes());

		 return mv;
	}

	@RequestMapping("pagamentoCadastrar")
	public String Cadastarpagamento(Pagamentos c) throws Exception {
	  System.out.println("@... Categeoria Cadastrar");

	  boolean retorno = new PagamentosDAO().cadastrarPagamento(c);

	  if (retorno) {
	    return "forward:pagamentosListar";
	  } else {
	    return "erro";
	  }
	}


	@RequestMapping("pagamentoExcluir")
	public String pagamentoExcluir(Pagamentos c, HttpServletResponse response) throws SQLException {
	  System.out.println("@.... ExcluirProduto ... ");
	  boolean retorno = new PagamentosDAO().ExcluirPagamento(c);
	  if (retorno) {
	    return "forward:pagamentosListar";
	  } else {
	    return "erro";
	  }
	}

	@RequestMapping("buscarPagamento")
	public ModelAndView Buscarpagamento(Pagamentos pag) {

	  System.out.println("@... BuscarPagamento "+pag.getId());
	  ModelAndView mv = new ModelAndView("pagamentos/editar");

	  mv.addObject("pagEdit", new PagamentosDAO().BuscarPagamento(pag));
	  mv.addObject("catList", new CategoriasDAO().listarCategorias());
	  mv.addObject("cliList", new ClientesDAO().listarClientes());
	  return mv;
	}

	@RequestMapping("pagamentoEditar")
	public String Editarpagamento(Pagamentos c) throws SQLException {
	  System.out.println("@... EditarPagamentos ... "+c.getId());

	  boolean retorno = new PagamentosDAO().EditarPagamento(c);
	  if (retorno) {
	    return "forward:pagamentosListar";
	  } else {
	    return "erro";
	  }
	}

}
