package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Cidade;
import entidades.Concessionaria;

public class ConcDAO implements InterfaceConcDAO {
	
	private static final ConcDAO instance = new ConcDAO();
	
	public ConcDAO(){
		try{
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		}
	}

	public static ConcDAO getInstance() {
		return instance;
	}
	
	@Override
	public ArrayList<Concessionaria> getTodasConcessionarias() {
		ArrayList<Concessionaria> concessionarias = new ArrayList<>();
		
		try{
			Connection conn = Conexao.createConnection();
			Statement statement = conn.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM Concessionaria ORDER BY nome_conc");
			
			while (resultSet.next()){
				Concessionaria conc = new Concessionaria();
				conc.setId(resultSet.getInt("id_conc"));
				conc.setNome(resultSet.getString("nome_conc"));
				conc.setTarifa(resultSet.getFloat("tarifa"));
				
				concessionarias.add(conc);
			}
			
			conn.close();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return concessionarias;
	}

	@Override
	public Concessionaria getConcessionariaPorNome(String nome) {
		// TODO implementar
		return null;
	}

	@Override
	public Concessionaria getConcessionariaPorCidade(Cidade cidade) {
		// TODO implementar
		return null;
	}

	@Override
	public Concessionaria getConcessionariaPorId(int id) {
		Concessionaria conc = new Concessionaria();
		
		try{
			Connection conn = Conexao.createConnection();
			Statement statement = conn.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM Concessionaria ORDER BY nome_conc");
			resultSet.next(); //TODO if(resultSet.next) -- se sim, impactar todos DAOs?
			
			conc.setId(resultSet.getInt("id_conc"));
			conc.setNome(resultSet.getString("nome_conc"));
			conc.setTarifa(resultSet.getFloat("tarifa"));
			
			conn.close();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return conc;
	}

}
