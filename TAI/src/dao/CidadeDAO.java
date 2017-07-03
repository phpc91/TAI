package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Cidade;
import entidades.Concessionaria;
import entidades.Estado;

public class CidadeDAO extends BaseDAO implements InterfaceCidadeDAO {
	
	private static final CidadeDAO instance = new CidadeDAO();
	private static final EstadoDAO estadoDAO = EstadoDAO.getInstance();
	private static final ConcDAO concDAO = ConcDAO.getInstance();

	public static CidadeDAO getInstance() {
		return instance;
	}
	
	@Override
	public ArrayList<Cidade> getTodasCidades() {
		ArrayList<Cidade> cidades = new ArrayList<>();
		
		try{
			Connection conn = createConnection();
			Statement statement = conn.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM Cidade ORDER BY nome_cidade");
			
			while (resultSet.next()){
				
				Estado estado = estadoDAO.getEstadoPorId(resultSet.getInt("estado_id"));
				Concessionaria conc = concDAO.getConcessionariaPorId(resultSet.getInt("conc_id"));
				
				Cidade cidade = new Cidade();
				cidade.setId(resultSet.getInt("id_cidade"));
				cidade.setNome(resultSet.getString("nome_cidade"));
				cidade.setEstado(estado);				
				cidade.setConc(conc);
				
				cidades.add(cidade);
			}
			
			conn.close();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return cidades;
	}

	@Override
	public Cidade getCidadePorNome(String cidade) {
		// TODO implementar
		return null;
	}

	@Override
	public Cidade getCidadePorId(int idCidade) {
		Cidade cidade = new Cidade();
		
		try{
			Connection conn = createConnection();
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM Cidade WHERE id_cidade LIKE '" +idCidade+ "%'");
			resultSet.next();
			
			cidade.setConc(concDAO.getConcessionariaPorId(resultSet.getInt("conc_id")));
			cidade.setEstado(estadoDAO.getEstadoPorId(resultSet.getInt("estado_id")));
			cidade.setId(resultSet.getInt("id_cidade"));
			cidade.setNome(resultSet.getString("nome_cidade"));
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return cidade;
	}

}
