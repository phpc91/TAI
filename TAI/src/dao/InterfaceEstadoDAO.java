package dao;
import java.util.ArrayList;

import entidades.Estado;

public interface InterfaceEstadoDAO {
	
	public ArrayList<Estado> getTodosEstados();
	public Estado getEstadoPorNome(String nome);
	public Estado getEstadoPorSigla(String sigla);
	public void atualizaEstado();
	public void apagaEstado();
}
