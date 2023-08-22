package ex04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MelonDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private String driverClassName = "oracle.jdbc.driver.OracleDriver";

	public MelonDAO() {
		try {
			Class.forName(driverClassName);
		} catch (Exception e) {
			System.out.println("클래스를 불러 올 수 없습니다.");
		}
	}
	
	public ArrayList<MelonDTO> getdata(){
		ArrayList<MelonDTO> list = new ArrayList<>();
		String sql = "select * from melon";
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();  // 쿼리문을 실해하면 결과는 10줄로 반환된다.
			
			while (rs.next()) {	// 아직 처리하지 않은 다음 줄이 있다면
				MelonDTO melon = new MelonDTO(); // 테이블의 레코드를 담을 수 있는 빈 객체를 생성
				melon.setRanking(rs.getInt("ranking"));	// 컬럼이름으로 데이터를 불러와서 자바객체에 setting
				melon.setTitle(rs.getString("title"));
				melon.setArtist(rs.getString("artist"));
				melon.setAlbum(rs.getString("album"));			// 자료형에 따라서 getString혹은 getInt
				melon.setLikeCount(rs.getInt("likeCount"));		// getDuble, getDate 등으로 가져온다.
				
				
				list.add(melon); // 테이블의 데이터로 채워진 객체를 리스트에 추가한다.
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {}
		}
		
		return list;
	}
	
	
}
