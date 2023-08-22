package youtube;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class YoutubeDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private String driverClassName ="oracle.jdbc.driver.OracleDriver";
	
	public YoutubeDAO() {
		try {
			Class.forName(driverClassName);
		} catch (ClassNotFoundException e) {
			System.out.println("클래스를 불러오지 못 했습니다.");
		}
	}
	
	public ArrayList<YoutubeDTO> getData() {
		ArrayList<YoutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube order by idx";
		try {
			conn = DriverManager.getConnection(url, user, password);
			// try catch이 뜨는 이유는 url,user,password가 틀리거나,
			// 가상머신이 꺼지거나 여러 상황으로 연결이 되지 않을때가 생길 수 있어 강제 예외 처리
			pstmt = conn.prepareStatement(sql);
			// sql문을 넣어서 실행할 준비를 한다.
			rs = pstmt.executeQuery();
			
			while (rs.next()) {  // while(sc.hasNextline()){..} 와 의미가 비슷
				// 아직 처리 하지 않은 쿼리문을 가져온다.
				// 한줄만 있어서 한줄만 불러오는 상황이여도, 
				// 무조건 rs.next()를 해야 getInt,getString을 사용 할 수 있다.
				YoutubeDTO dto = new YoutubeDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setChannel(rs.getString("channel"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setMovieTag(rs.getString("movieTag"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
					} catch (SQLException e) {}
			
		}
		
		
		return list;
	}
	
	public int insert(YoutubeDTO dto) {
		int row = 0;
		
		String sql = "insert into youtube values (?, ?, ?, ?, ?, ?)";
	
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			// 물음표에 들어갈 값을 순서대로 자료형에 맞게 세팅한다.
			// 단점은, 위 방식과 달리 쿼리문이 실행되는 내용을 출력하여 확인 할 수 없다.
			// 이후, 스프링에서 로그를 출력하게 만들면 확인 하다.
			
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getChannel());
			pstmt.setInt(4, dto.getViewCount());
			pstmt.setString(5, dto.getThumbnail());
			pstmt.setString(6, dto.getMovieTag());
			
			row = pstmt.executeUpdate();		//insert, update, delete의 경우 exeucteUpdate()
												// SQL에 의해 영향을 받은 줄 수를 반환한다.
			
			System.out.println(row + "행이 추가되었습니다.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		
		
		return row;
	}
	
	public YoutubeDTO selectOne(int idx) {
		YoutubeDTO dto = null;
		String sql = "select * from youtube where idx = ?";
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				dto = new YoutubeDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setChannel(rs.getString("channel"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setMovieTag(rs.getString("movieTag"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return dto; 
	}

}
