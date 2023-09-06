package com.itbank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.AlbumDTO;
import com.itbank.repositery.AlbumDAO;
import com.itbank.repositery.AlbumFileUtil;

public class AlbumUpdateController extends Controller{
	
	private AlbumDAO dao = AlbumDAO.getInstance();
	private AlbumFileUtil fileUtil = AlbumFileUtil.getInstance();
	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int idx = Integer.parseInt(id);
		AlbumDTO dto = dao.selectOne(idx);
		request.setAttribute("dto", dto);
		int row = dao.update(dto);
		System.out.println(row + "행이 수정 되었습니다.");
		return "album/update";
	}
	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AlbumDTO dto = fileUtil.getAlbumDTO(request);
		int row = dao.update(dto);
		System.out.println(row + "행이 수정되었습니다.");
		
		return"redirect:/album/list";
	}

}
