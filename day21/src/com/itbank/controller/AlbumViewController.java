package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.AlbumDTO;
import com.itbank.model.MusicDTO;
import com.itbank.repositery.AlbumDAO;
import com.itbank.repositery.MusicDAO;

public class AlbumViewController extends Controller{
	
	private AlbumDAO albumdao = AlbumDAO.getInstance();
	private MusicDAO dao = MusicDAO.getInstance();
	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String param = request.getParameter("id");
		if(param != null) {
			int idx = Integer.parseInt(param);
			
			AlbumDTO albumdto = albumdao.selectOne(idx);
			request.setAttribute("albumdto", albumdto);
			
			List<MusicDTO> list = dao.selectAlbum(idx);
			request.setAttribute("list", list);

		}
		return "album/view";
	}
	

}


