package member;

import java.sql.ResultSet;
import java.sql.SQLException;

import db.DAO;

public class MemberDAO extends DAO{
	
	private MemberDAO() {}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	
	public MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		
		dto.setBirth(rs.getString("birth"));
		dto.setEmail(rs.getString("email"));
		dto.setUserid(rs.getString("userid"));
		dto.setUsername(rs.getString("username"));
		dto.setUserpw(rs.getString("userpw"));
	
		return dto;
	}
	
	public MemberDTO login(MemberDTO dto) {
		
		System.out.println(dto.getUserid());
		System.out.println(dto.getUserpw());
		
		MemberDTO login = null;
		String sql = "select * from member where userid=? and userpw=?";
	
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			rs = pstmt.executeQuery();
			System.out.println(conn);
			System.out.println(pstmt);
			System.out.println(rs);
			
			while(rs.next()){
				login = mapping(rs);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		System.out.println(login);
		return login;
	}


	
}