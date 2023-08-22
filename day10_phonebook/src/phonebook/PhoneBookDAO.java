package phonebook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PhoneBookDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static PhoneBookDAO instance;

	public static PhoneBookDAO getInstance() {
		if(instance == null) {
			instance = new PhoneBookDAO();
		}
		return instance;
	}

	public PhoneBookDAO() {
		 try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			System.out.println("정상종료됨");
		} catch (Exception e) {}
	}
	
	public ArrayList<PhoneBookDTO> selectList() {
		ArrayList<PhoneBookDTO> list = new ArrayList<>();
		String sql = "select * from phonebook order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PhoneBookDTO dto = new PhoneBookDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPnum(rs.getString("pnum"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public int insert(PhoneBookDTO dto) {
		int row = 0;
		String sql = "insert into phonebook (name,pnum) values (?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPnum());
			
			row = pstmt.executeUpdate();
			System.out.println(row + "행이 추가되었습니다");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return row;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete from phonebook where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			row = pstmt.executeUpdate();
			System.out.println(row + "행이 삭제 되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return row;
	}
}
