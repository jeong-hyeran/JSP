package com.itbank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.ArtistDTO;
import com.itbank.repositery.ArtistDAO;
import com.itbank.repositery.ArtistFileUtil;

public class ArtistAddController extends Controller{
	
	private ArtistDAO dao = ArtistDAO.getInstance();
	private ArtistFileUtil fileutil = ArtistFileUtil.getInstance();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/artist/add";
	}
	
	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArtistDTO dto = fileutil.getArtistDTO(request);
		int row = dao.insert(dto);
		System.out.println(row + "행이 추가되었습니다");
		
		return "redirect:/artist/list";
	}
	

}
