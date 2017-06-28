package daotest;

import static org.junit.Assert.*;

import dao.EstadoDAO;
import entidades.Estado;

import org.junit.Test;

public class TestEstadoDAO {
	static EstadoDAO dao = EstadoDAO.getInstance();

	@Test
	public void testGetTodosEstadosSize() {
		int size = dao.getTodosEstados().size();
		assertTrue(size == 26);
	}
	
	@Test
	public void testGetEstadoPorNome() {
		Estado acre = dao.getEstadoPorNome("Acre");
		//acre é ID=1
		assertEquals(1, acre.getId());
		assertEquals("AC", acre.getSigla());
	}

	@Test
	public void testGetEstadoPorSigla() {
		Estado sp = dao.getEstadoPorSigla("SP");
		//sp ID=24
		assertEquals(24, sp.getId());
		assertEquals("São Paulo", sp.getNome());
	}

}
