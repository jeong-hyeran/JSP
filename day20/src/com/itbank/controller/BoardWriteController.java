package com.itbank.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.BoardDTO;
import com.itbank.repository.BoardDAO;

public class BoardWriteController implements Controller{
	
	// 커맨드 객체 :자바 빈즈 유형의 이름에 맞는 필드에 파라미터는 자동으로 대입해준다.
	// primitive, String, Date, MultipartFile 등의 다양한 자료형을 지원한다.
	private BoardDTO getDTO(HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setWriter(request.getParameter("writer"));
		return dto;
	}
	
	private BoardDAO dao = BoardDAO.getInstance();

	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "write";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
		
		BoardDTO dto = getDTO(request);
		int row = dao.insert(dto);
		System.out.println(row + "행이 추가되었습니다.");
		
		return "redirect:/board";
	}
	
	

}
