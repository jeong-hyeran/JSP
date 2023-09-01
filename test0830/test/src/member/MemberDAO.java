package member;

import java.sql.SQLException;

import db.DAO;

public class MemberDAO extends DAO{
	
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	
	private MemberDAO() {}
	
	// 회원 로그인
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = null;
		String sql = "select * from member where userid=? and userpw=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				login = new MemberDTO();
				login.setBirth(rs.getString("birth"));
				login.setEmail(rs.getString("email"));
				login.setUserid(rs.getString("userid"));
				login.setUsername(rs.getString("username"));
				login.setUserpw(rs.getString("userpw"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return login;
	}
	
	// 회원가입
	public int join(MemberDTO dto) {
		int row = 0;
		String sql ="insert into member values (?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getBirth());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return row;
	}

}
