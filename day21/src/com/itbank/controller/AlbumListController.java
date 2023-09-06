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

public class AlbumListController extends Controller{
	
	private AlbumDAO dao = AlbumDAO.getInstance();
	private ArtistDAO dao2 = ArtistDAO.getInstance();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AlbumDTO> list = dao.selectList();
		request.setAttribute("list", list);
		
		String param = request.getParameter("id");
		if(param != null) {
			int idx = Integer.parseInt(param);
			ArtistDTO dto2 = dao2.selectOne(idx);
			request.setAttribute("dto2", dto2);
		}
		return "/album/list";
	}

}
