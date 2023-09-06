package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.AlbumDTO;
import com.itbank.model.ArtistDTO;
import com.itbank.repositery.AlbumDAO;
import com.itbank.repositery.ArtistDAO;

public class ArtistViewController extends Controller{
	
	
	private ArtistDAO dao = ArtistDAO.getInstance();
	private AlbumDAO dao2 = AlbumDAO.getInstance();


	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("id");
		if(param != null) {
			int idx = Integer.parseInt(param);
			ArtistDTO dto = dao.selectOne(idx);
			request.setAttribute("dto", dto);
		
			List<AlbumDTO> list = dao2.selectAlbum(idx);
			request.setAttribute("list", list);
		
		}
		return "artist/view";
	}


}
