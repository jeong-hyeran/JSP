package com.itbank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.repositery.MusicDAO;

public class MusicDeteleController extends Controller{
	
	private MusicDAO dao = MusicDAO.getInstance();
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		int idx = Integer.parseInt(id);
		int row = dao.dalete(idx);
		System.out.println(row + "행이 삭제 되었습니다.");
		return "redirect:/music/list";
	}

}
