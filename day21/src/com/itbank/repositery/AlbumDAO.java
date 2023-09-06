package com.itbank.repositery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.itbank.model.AlbumDTO;

public class AlbumDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static AlbumDAO instance = new AlbumDAO();
	public static AlbumDAO getInstance() {
		return instance;
	}
	
	private AlbumDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {}
	}
	
	private AlbumDTO mapping(ResultSet rs) throws SQLException {
		AlbumDTO dto = new AlbumDTO();
		dto.setArtist_id(rs.getString("artist_id"));
		dto.setId(rs.getInt("id"));
		dto.setPlaytime(rs.getInt("playtime"));
		dto.setName(rs.getString("name"));
		dto.setType(rs.getString("type"));
		dto.setRdate(rs.getDate("rdate"));
		dto.setCoverimg(rs.getString("coverimg"));
		
		return dto;
	}
	
	public int insert(AlbumDTO dto) {
		int row = 0;
		String sql="insert into album (artist_id, name, type, rDate, playTime, coverImg) values (?,?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getArtist_id());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getType());
			pstmt.setDate(4, dto.getRdate());
			pstmt.setInt(5, dto.getPlaytime());
			pstmt.setString(6, dto.getCoverimg());
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return row;
	}
	
	public ArrayList<AlbumDTO> selectList(){
		ArrayList<AlbumDTO> list = new ArrayList<AlbumDTO>();
		String sql = "select * from album order by name";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	public AlbumDTO selectOne(int idx){
		AlbumDTO dto = new AlbumDTO();
		String sql = "select * from album where id=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}
	
	public ArrayList<AlbumDTO> selectAlbum(int artist_id){
		ArrayList<AlbumDTO> list = new ArrayList<AlbumDTO>();
		String sql = "select * from album where artist_id=? order by rdate desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, artist_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	

	public int update(AlbumDTO dto) {
		int row = 0;
		String sql= "update album set coverimg=? where id=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCoverimg());
			pstmt.setInt(2, dto.getId());
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return row;
	}
	
	public int dalete(int id) {
		int row = 0;
		String sql = "delete from album where id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return row;
	}

}
