package com.itbank.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.AlbumDTO;
import com.itbank.model.ArtistDTO;
import com.itbank.model.MusicDTO;
import com.itbank.repositery.AlbumDAO;
import com.itbank.repositery.ArtistDAO;
import com.itbank.repositery.MusicDAO;

public class MusicListController extends Controller{
	
	private MusicDAO dao = MusicDAO.getInstance();
	private ArtistDAO dao2 = ArtistDAO.getInstance();
	private AlbumDAO dao3 = AlbumDAO.getInstance();
	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MusicDTO> list = dao.selectList();
		request.setAttribute("list", list);
		
		List<ArtistDTO> list2 = dao2.selectList();
		request.setAttribute("list2", list2);

		List<AlbumDTO> list3 = dao3.selectList();
		request.setAttribute("list3", list3);
		
		return "music/list";
	}

}
