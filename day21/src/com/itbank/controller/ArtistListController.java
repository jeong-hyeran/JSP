package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.ArtistDTO;
import com.itbank.repositery.ArtistDAO;

public class ArtistListController extends Controller{
	
	private ArtistDAO dao = ArtistDAO.getInstance();


	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ArtistDTO> list = dao.selectList();
		request.setAttribute("list", list);
		
		return "artist/list";
	}


}
