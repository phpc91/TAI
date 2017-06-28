package dao;

import java.util.ArrayList;

import entidades.Cidade;

public interface InterfaceCidadeDAO{
	
	public ArrayList<Cidade> getTodasCidades();
	public Cidade getCidadePorNome(String cidade);
	public Cidade getCidadePorId(int idCidade);
	
	//TODO metodos para adicionar, editar excluir
}
