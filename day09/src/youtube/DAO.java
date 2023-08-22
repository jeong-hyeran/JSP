package youtube;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class DAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;  // 객체 컨테이너(context.xml에 있는 객체)를 가르키는 것
	private DataSource ds;	// 커넥션풀 관리 객체
	
	private static DAO instance; // 싱글톤 객체 저장
	

	public static DAO getInstance() {
		if(instance == null) {
			instance = new DAO();
		}
		return instance;
	}

	public DAO() { /// 커넥션 풀을 이용하기 위한 것
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("DAO생성자 예외 발생 !!: " + e);
			e.printStackTrace();
		}
	}
	
	

	

	public ArrayList<DTO> selectList(){
		 ArrayList<DTO> list = new  ArrayList<>();
		 String sql = "select * from youtube order by idx";
		 
		 try {
			 // 연결
			 conn = ds.getConnection(); /// 커넥션풀

			 // sql적재
			 pstmt = conn.prepareStatement(sql);
			 
			 // 실행 및 결과 반환
			 // 실행문 => 결과 반환 형태
			 // select => ResultSet, insert/update/delete => int
			 rs = pstmt.executeQuery();
			 
			 // 결과를 자바 객체로 변환하여 리스트에 추가(SELECT인 경우에만 해당)
			 while (rs.next()) {
				DTO dto = new DTO();
				dto.setChannel(rs.getString("channel"));
				dto.setIdx(rs.getInt("idx"));
				dto.setMovieTag(rs.getString("movieTag"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
			
				list.add(dto);
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
		 
		 
		 
		 // 리스트를 반환 (select가 아니면 int타입의 row를 반환)
		 return list;
	}

}
