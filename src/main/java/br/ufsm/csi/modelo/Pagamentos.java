package br.ufsm.csi.modelo;


public class Pagamentos{
    private String nome;
    private String dataI;
    private String dataF;
    private String rec;
    private float valor;
    private int id;
    private int cli;  
    private int cat;
    
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDataI() {
		return dataI;
	}
	public void setDataI(String dataI) {
		this.dataI = dataI;
	}
	public String getDataF() {
		return dataF;
	}
	public void setDataF(String dataF) {
		this.dataF = dataF;
	}
	public String getRec() {
		return rec;
	}
	public void setRec(String rec) {
		this.rec = rec;
	}
	public float getValor() {
		return valor;
	}
	public void setValor(float valor) {
		this.valor = valor;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCli() {
		return cli;
	}
	public void setCli(int cli) {
		this.cli = cli;
	}
	public int getCat() {
		return cat;
	}
	public void setCat(int cat) {
		this.cat = cat;
	}

    
}
