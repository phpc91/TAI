package entidades;

public class Estado {
	
	private String nome, sigla;
	private int id;
	
	public String getNome() {
		return nome;
	}
	public String getSigla() {
		return sigla;
	}
	public int getId() {
		return id;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public void setId(int id) {
		this.id = id;
	}
}
