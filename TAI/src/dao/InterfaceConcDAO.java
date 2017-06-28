package dao;

import java.util.ArrayList;

import entidades.Cidade;
import entidades.Concessionaria;

public interface InterfaceConcDAO {
	
	public ArrayList<Concessionaria> getTodasConcessionarias();
	public Concessionaria getConcessionariaPorNome(String nome);
	public Concessionaria getConcessionariaPorCidade(Cidade cidade);
	public Concessionaria getConcessionariaPorId(int id);
	
	//TODO metodos para adicionar, editar excluir
}
