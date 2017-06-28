package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Cidade;
import entidades.Concessionaria;
import entidades.Estado;

public class CidadeDAO implements InterfaceCidadeDAO {
	
	private static final CidadeDAO instance = new CidadeDAO();
	
	public CidadeDAO(){
		try{
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		}
	}

	public static CidadeDAO getInstance() {
		return instance;
	}
	
	@Override
	public ArrayList<Cidade> getTodasCidades() {
		ArrayList<Cidade> cidades = new ArrayList<>();
		EstadoDAO estadoDAO = EstadoDAO.getInstance();
		ConcDAO concDAO = ConcDAO.getInstance();
		
		try{
			Connection conn = Conexao.createConnection();
			Statement statement = conn.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM Estado ORDER BY id_estado");
			
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
		// TODO implementar
		return null;
	}

}
