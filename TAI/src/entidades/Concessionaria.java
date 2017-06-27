package entidades;

public class Concessionaria {
	
	private String nome;
	private int id;
	private float tarifa;
	
	public String getNome() {
		return nome;
	}
	public int getId() {
		return id;
	}
	public float getTarifa() {
		return tarifa;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setTarifa(float tarifa) {
		this.tarifa = tarifa;
	}
}
