package ex03;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// conn, patmt, rs
// url, user, password

// 생성자에서 Class.forName()

// 전체 목록을 ArrayList<MovieDTO>으로 반환하는 함수

// 데이터에 접근하는 객체

public class MovieDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private String driverClassName = "oracle.jdbc.driver.OracleDriver";
	
	public MovieDAO() {
			try {
			Class.forName(driverClassName);
		} catch (ClassNotFoundException e) {
			System.out.println("클래스를 불러올 수 없습니다. : " + e);
		}
	
	}
	
	public ArrayList<MovieDTO> getdata() {
		ArrayList<MovieDTO> list = new ArrayList<>();
		String sql = "select * from movie2"; 
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);		//Statement 클래스의 상속
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MovieDTO mo = new MovieDTO();
				
				mo.setMovie_rank(rs.getInt("movie_rank"));
				mo.setTitle(rs.getString("title"));
				mo.setOpenningDate(rs.getString("openningDate"));
				mo.setReserveRate(rs.getDouble("reserveRate"));
				mo.setReserveCount(rs.getInt("reserveCount"));
				mo.setWatchCount(rs.getInt("watchCount"));
				
				list.add(mo);
			}
			
		} catch (SQLException e) {
				e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {} 
		}
		
		

		return list;
	}

}
