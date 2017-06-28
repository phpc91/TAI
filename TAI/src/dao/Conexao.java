package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

final class Conexao {
	
	private static String user="admin",
			passwd="admin123",
			endpoint="tai-db.cyki8d0w5wwv.sa-east-1.rds.amazonaws.com/database";
	
	protected static final Connection createConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:mariadb://"+endpoint+"?user="+user+"&password="+passwd);
	}
}
