package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionHelper {
	public static Connection getConnection(String dbname) {
		Connection conn = null;
		DataSource ds = null;
		if(dbname.equalsIgnoreCase("oracle")) {
			try {
				Context context = new InitialContext();
				ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
				try {
					conn = ds.getConnection();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;
	}
}
