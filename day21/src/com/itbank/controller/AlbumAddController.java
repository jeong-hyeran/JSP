package com.itbank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.AlbumDTO;
import com.itbank.model.ArtistDTO;
import com.itbank.repositery.AlbumDAO;
import com.itbank.repositery.AlbumFileUtil;
import com.itbank.repositery.ArtistDAO;


public class AlbumAddController extends Controller{
	private AlbumDAO dao = AlbumDAO.getInstance();
	private ArtistDAO dao2 = ArtistDAO.getInstance();
	private AlbumFileUtil fileutil = AlbumFileUtil.getInstance();
	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param = request.getParameter("id");
		if(param != null) {
			int idx = Integer.parseInt(param);
			ArtistDTO dto2 = dao2.selectOne(idx);
			request.setAttribute("dto2", dto2);
		}
		return "album/add";
	}
	
	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AlbumDTO dto = fileutil.getAlbumDTO(request);
		int row = dao.insert(dto);
		System.out.println(row + "행이 추가되었습니다");
		
		return "redirect:/album/list";
	}

}
