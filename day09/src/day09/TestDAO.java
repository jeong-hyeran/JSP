package day09;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TestDAO {
	/*** 싱글톤 ***/
	private static TestDAO instance;
	
	public static TestDAO getInstance() {
		if(instance == null) {
			instance = new TestDAO(); 
			}
		return instance;
	}

	public TestDAO() {
		/*** 커넥션 풀 설정, context.xml, wed.xml 사전 설정이 필요함***/
		// META-INF/context.xml
		// WEn-INF/wed.XML
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			// 자바 컴포넌트 중, 환경 요소중에서 이름이 jdbc/oracle인 요소를 불러온다.
		} catch (NamingException e) {
			System.err.println("dataSource 불러오기 실패 : " + e);
		}
	}
	private Context init;
	private DataSource ds;
	
	
	private Connection conn;  //connectionPool : connection을 많이 만들어 둔다.
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public String getSysDate() {
		String sysdate = null;
		String sql = "select sysdate from dual";
		
		try {
			conn = ds.getConnection(); //ds안에는 {conn1, conn2,...} 있는데 같은 정보가 들어가있다.
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				sysdate = rs.getString("sysdate");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return sysdate;
	}
	

}
