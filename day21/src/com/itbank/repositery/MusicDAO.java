package com.itbank.repositery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.itbank.model.MusicDTO;

public class MusicDAO {
	
	private static MusicDAO instance = new MusicDAO();

	public static MusicDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Context init;
	private DataSource ds;
	
	private MusicDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {}
	}
	
	public MusicDTO mapping(ResultSet rs) throws SQLException {
		MusicDTO dto = new MusicDTO();
		dto.setAlbum_id(rs.getInt("album_id"));
		dto.setArtist_id(rs.getInt("artist_id"));
		dto.setGenre(rs.getString("genre"));
		dto.setId(rs.getInt("id"));
		dto.setLyrics(rs.getString("lyrics"));
		dto.setName(rs.getString("name"));
		dto.setPlayCount(rs.getInt("playCount"));
		dto.setPlaytime(rs.getInt("playtime"));
		
		
		return dto;
	}
	
	public MusicDTO getMusicDTO(HttpServletRequest request) {
		MusicDTO dto = new MusicDTO();
		
		String album_id = request.getParameter("album_id");
		String artist_id = request.getParameter("artist_id");
		String genre = request.getParameter("genre");
		String id = request.getParameter("id");
		String lyrics = request.getParameter("lyrics");
		String name = request.getParameter("name");
		String playtime = request.getParameter("playtime");
		
		dto.setAlbum_id(Integer.parseInt(album_id));
		dto.setArtist_id(Integer.parseInt(artist_id));
		dto.setId(Integer.parseInt(id));
		dto.setPlaytime(Integer.parseInt(playtime));
		dto.setGenre(genre);
		dto.setLyrics(lyrics);
		dto.setName(name);
		
		return dto;
	}
	
	public ArrayList<MusicDTO> selectList(){
		ArrayList<MusicDTO> list = new ArrayList<MusicDTO>();
		String sql ="select * from music order by id desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return list;
	}
	
	
	public ArrayList<MusicDTO> selectAlbum(int album_id){
		ArrayList<MusicDTO> list = new ArrayList<MusicDTO>();
		String sql ="select * from music where album_id = ? order by id desc ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, album_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return list;
	}
	
	public int insert(MusicDTO dto) {
		int row = 0;
		String sql = "insert into music (artist_id, album_id, name, genre, playtime, lyrics) "
				+ "values (?,?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getArtist_id());
			pstmt.setInt(2, dto.getAlbum_id());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGenre());
			pstmt.setInt(5, dto.getPlaytime());
			pstmt.setString(6, dto.getLyrics());
			
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
		String sql = "delete from music where id = ?";
		
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
