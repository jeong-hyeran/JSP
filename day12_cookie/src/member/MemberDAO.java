package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		
		private static MemberDAO instance = new MemberDAO();
		
		
		public static MemberDAO getInstance() {
			return instance;
		}


		private MemberDAO() {
			try {
				init = new InitialContext();
				ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
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
		
		public MemberDTO login(MemberDTO user) {
			MemberDTO login = null; // 여기에 객체를 생성한다면 로그인을 하면서 제대로 입력이 되지 않아도 객체가 생성이 되어서 로그인이 된것도 안된것도 아니게 된다.
									// EL Tag는 객체가 생성되었기 때문에 값이 있다고 판단한다.

			String sql = "select * from member where userid=? and userpw = ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUserid());
				pstmt.setString(2, user.getUserpw());
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
			}finally{
				close();
			}
			return login;
		}
}


