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

import com.itbank.model.ArtistDTO;

public class ArtistDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static ArtistDAO instance = new ArtistDAO();
	public static ArtistDAO getInstance() {
		return instance;
	}
	
	private ArtistDAO() {
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
	
	private ArtistDTO mapping(ResultSet rs) throws SQLException {
		ArtistDTO dto = new ArtistDTO();
		dto.setCompany(rs.getString("company"));
		dto.setCountry(rs.getString("country"));
		dto.setMember(rs.getString("member"));
		dto.setName(rs.getString("name"));
		dto.setProfileimg(rs.getString("profileimg"));
		dto.setType(rs.getString("type"));
		dto.setId(rs.getInt("id"));
		dto.setDebut(rs.getDate("debut"));
		return dto;
	}
	
	public int insert(ArtistDTO dto) {
		int row = 0;
		String sql="insert into artist (name, company, country, member, debut, type, profileimg) values (?,?,?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getCompany());
			pstmt.setString(3, dto.getCountry());
			pstmt.setString(4, dto.getMember());
			pstmt.setDate(5, dto.getDebut());
			pstmt.setString(6, dto.getType());
			pstmt.setString(7, dto.getProfileimg());
			
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return row;
	}
	
	public ArrayList<ArtistDTO> selectList(){
		ArrayList<ArtistDTO> list = new ArrayList<ArtistDTO>();
		String sql = "select * from artist order by name, id";
		
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
	public ArtistDTO selectOne(int idx){
		ArtistDTO dto = new ArtistDTO();
		String sql = "select * from artist where id=?";
		
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

	
	public int update(ArtistDTO dto) {
		int row = 0;
		String sql;
		int index = 0;
		if(dto.getProfileimg() != null) {
			sql = "update artist set member =?,company=? ,profileimg=? where id=?";
		}else {
			sql = "update artist set member =?,company=? where id=?";
		}
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++index, dto.getMember());
			pstmt.setString(++index, dto.getCompany());
			if(dto.getProfileimg() != null) {
				pstmt.setString(++index, dto.getProfileimg());
			}
			pstmt.setInt(++index, dto.getId());
			
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
		String sql = "delete from artist where id = ?";
		
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























