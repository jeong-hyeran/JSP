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

public class MusicAddController extends Controller{
	
	private AlbumDAO albumdao = AlbumDAO.getInstance();
	private MusicDAO dao = MusicDAO.getInstance();
	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int idx = Integer.parseInt(id);
		AlbumDTO dto = albumdao.selectOne(idx);
		request.setAttribute("dto", dto);
		
		List<MusicDTO> list = dao.selectAlbum(idx);
		request.setAttribute("list", list);
		
		return "music/add";
	}
	
	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		int idx = Integer.parseInt(id);
		
		MusicDTO dto = dao.getMusicDTO(request);
		int row = dao.insert(dto);
		System.out.println(row +"행이 추가되었습니다.");
		return "redirect:/album/view?id="+idx;
	}
}
