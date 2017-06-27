package entidades;

public class Cliente {
	
	private String nome, email;
	private int id, idCidade;
	
	public String getNome() {
		return nome;
	}
	public String getEmail() {
		return email;
	}
	public int getId() {
		return id;
	}
	public int getIdCidade() {
		return idCidade;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setIdCidade(int idCidade) {
		this.idCidade = idCidade;
	}
}
