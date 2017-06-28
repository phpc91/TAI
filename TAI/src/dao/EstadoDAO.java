package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entidades.Estado;

public class EstadoDAO implements InterfaceEstadoDAO {
	
	private static final EstadoDAO instance = new EstadoDAO();
	//esconder credenciais de conexao
	private String user="admin", passwd="admin123";
	private String endpoint="tai-db.cyki8d0w5wwv.sa-east-1.rds.amazonaws.com/database";
	
	public EstadoDAO(){
		try{
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		}
	}
	
	public Connection createConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:mariadb://"+endpoint+"?user="+user+"&password="+passwd);
	}

	public static EstadoDAO getInstance() {
		return instance;
	}

	public ArrayList<Estado> getTodosEstados() {
		ArrayList<Estado> estados = new ArrayList<Estado>();
		
		try{
			Connection conn = createConnection();
			Statement statement = conn.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM Estado ORDER BY id_estado");
			
			while (resultSet.next()){
				Estado estado = new Estado();
				estado.setId(resultSet.getInt("id_estado"));
				estado.setNome(resultSet.getString("nome_estado"));
				estado.setSigla(resultSet.getString("sigla"));
				
				estados.add(estado);
			}
			
			conn.close();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return estados;
	}

	public Estado getEstadoPorNome(String nome) {
		Estado estado = new Estado();
		
		try{
			Connection conn = createConnection();
			Statement stat = conn.createStatement();
			
			ResultSet result = stat.executeQuery("SELECT * FROM Estado WHERE nome_estado LIKE '" +nome+ "%'");
			result.next();
			
			estado.setId(result.getInt("id_estado"));
			estado.setNome(result.getString("nome_estado"));
			estado.setSigla(result.getString("sigla"));
			
			conn.close();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return estado;
	}
	
	public Estado getEstadoPorSigla(String sigla) {
Estado estado = new Estado();
		
		try{
			Connection conn = createConnection();
			Statement stat = conn.createStatement();
			
			ResultSet result = stat.executeQuery("SELECT * FROM Estado WHERE sigla LIKE '" +sigla+ "%'");
			result.next();
			
			estado.setId(result.getInt("id_estado"));
			estado.setNome(result.getString("nome_estado"));
			estado.setSigla(result.getString("sigla"));
			
			conn.close();
			
		} catch (SQLException e){
			e.printStackTrace();
		}
		
		return estado;
	}

	public void atualizaEstado() {
		//TODO implementar EstadoDAO.atualizaEstado (PreparedStatement, setString, executeUpdate)
	}

	public void apagaEstado() {
		//TODO implementar EstadoDAO.apagaEstado (PreparedStatement, setString, executeUpdate)
	}
}
