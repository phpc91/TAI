package entidades;

public class Cidade {
	
	private String nome;
	private int id;
	private Estado estado;
	private Concessionaria conc;
	
	public String getNome() {
		return nome;
	}
	public int getId() {
		return id;
	}
	public Estado getEstado() {
		return estado;
	}
	public Concessionaria getConc() {
		return conc;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setEstado(Estado estado) {
		this.estado = estado;
	}
	public void setConc(Concessionaria conc) {
		this.conc = conc;
	}
}
