package student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;






public class StudentDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static StudentDAO instance;

	public static StudentDAO getInstance() {
		if(instance == null) {
			instance = new StudentDAO();
		}
		return instance;
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			System.out.println("정상적으로 연결 종료");
		} catch (Exception e2) {}
	}
	
	public StudentDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<StudentDTO> selectList(){
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		String sql = "select student.*, kor + eng + math as total," + 
				"		    trunc((kor + eng + math) /3,1) as avg" + 
				"		    from student order by avg";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setAvg(rs.getDouble("avg"));
				dto.setEng(rs.getInt("eng"));
				dto.setKor(rs.getInt("kor"));
				dto.setMath(rs.getInt("math"));
				dto.setName(rs.getString("name"));
				dto.setTotal(rs.getInt("total"));
				
				list.add(dto);
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
	
	public int insert(StudentDTO dto) {
		int row = 0;
		String sql="insert into student values (?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMath());

			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return row;
	}

	public int delete(String name) {
		int row = 0;
		String sql = "delete from student where name=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			row = pstmt.executeUpdate();
			System.out.println(row + "행이 삭제 되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return row;
	}
	
	public int update(StudentDTO dto,String name) {
		int row = 0;
		String sql ="update student set kor=?,eng=?, math=? where name=?";
//		StudentDTO user = new StudentDTO();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMath());
			pstmt.setString(4, name);
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}
		
		System.out.println(row + "(행)이 수정 되었습니다.");
		return row;
	}

	public StudentDTO view(String name){
	
		StudentDTO dto = new StudentDTO();
		String sql ="  select student.*,kor + eng + math as total," + 
				"		    trunc((kor + eng + math) /3, 1) as avg" + 
				"		    from student where name=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			dto.setAvg(rs.getDouble("avg"));
			dto.setEng(rs.getInt("eng"));
			dto.setKor(rs.getInt("kor"));
			dto.setMath(rs.getInt("math"));
			dto.setName(rs.getString("name"));
			dto.setTotal(rs.getInt("total"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close();
		}

		return dto;
	}
	
	public StudentDTO selectOne(String name){
		StudentDTO dto = new StudentDTO();
		String sql ="  select student.*,kor + eng + math as total," + 
				"		    trunc((kor + eng + math) /3, 1) as avg" + 
				"		    from student where name=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setAvg(rs.getDouble("avg"));
				dto.setEng(rs.getInt("eng"));
				dto.setKor(rs.getInt("kor"));
				dto.setMath(rs.getInt("math"));
				dto.setName(rs.getString("name"));
				dto.setTotal(rs.getInt("total"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	
		return dto;
	}


}
