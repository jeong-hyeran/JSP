package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	// 1) 싱글톤
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 2) 커넥션 풀
	private MemberDAO() {
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
		} catch (Exception e) {
		}
	}
	// 함수 만들기
	// id와 pw가 일치하는 단일 멤버 객체를 반환하는 함수 (없으면 null)
	public MemberDTO login(MemberDTO user) {		// 사용자 입력값 받아서
		MemberDTO login = null;
		String sql = "select * from member where userid = ? and userpw = ?";
			// id와 pw가 일치하는 계정 하나를 조회하고 반환한다.
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());  //id와 pw를 순서대로 배치한다
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				login = new MemberDTO();
				login.setUserId(rs.getString("userId"));
				login.setUserPw(rs.getString("userPw"));
				login.setUserName(rs.getString("userName"));
				login.setBirth(rs.getString("birth"));
				login.setEmail(rs.getString("email"));
				// list가 없으니 list.add() 는 호출 할 필요 없다.
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return login;
	}
	
	// 회원가입에 필요한 모든 정보를 입력받아서 테이블에 추가하고, 정수 반환하기
	public int insert(MemberDTO user) {
		int row = 0;
		String sql ="insert into member values (?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getBirth());
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return row;
	}
	
	//id를 문자열로 전달 받아서 회원정보를 삭제하기
	public int delete(String userId) {
		int row = 0;
		String sql ="delete from member where userId = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			row = pstmt.executeUpdate();
			System.out.println(row);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return row;
	}
	
	public int update(MemberDTO user) {
		int row =0;
		String sql ="update member set username = ?, email = ?, birth = ? where userId = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getBirth());
			pstmt.setString(4, user.getUserId());
			
			row = pstmt.executeUpdate();
			} catch (Exception e) {
		}finally {
			close();
		}
		return row;
	}
}
