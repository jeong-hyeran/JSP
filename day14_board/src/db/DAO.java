package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DAO {
	protected Connection conn;// private으로 하면 상속이 되지 않아서 변경함
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	
	protected Context init;
	protected DataSource ds;
	

	
	protected DAO() { 
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	protected void close() {
		try {
			if(rs != null) 		rs.close();
			if(pstmt != null) 	pstmt.close();
			if(conn != null) 	conn.close();
		} catch (Exception e) {}
	}
}
