package board2;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DAO;

public class BoardDAO extends DAO{
	
	private BoardDAO() {}

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	
	public BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		
		dto.setContent(rs.getString("content"));
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setUploadFile(rs.getString("uploadFile"));
		dto.setWdate(rs.getDate("wdate"));
		dto.setWriter(rs.getString("writer"));
	
		return dto;
	}
	
	public int insert(BoardDTO dto) {
		int row = 0;
		String sql ="insert into board2 (title, writer, content, uploadFile) "
				+ "values (?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getUploadFile());
			 
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return row;
	}
	
	public ArrayList<BoardDTO> selectAll(){
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql = "select * from board2 order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(1);
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
	public BoardDTO selectOne(int idx){
		BoardDTO item = new BoardDTO();
		String sql = "select * from board2 where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				item = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return item;
	}
}


