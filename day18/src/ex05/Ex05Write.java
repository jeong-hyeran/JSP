package ex05;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05/write")
public class Ex05Write extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private String prefix = "/WEB-INF/views/";
	private String suffix = ".jsp";
	
	private BoardDAO dao = BoardDAO.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(prefix + "write" + suffix);
		rd.forward(request, response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		BoardDTO dto = new BoardDTO();
		dto.setContent(content);
		dto.setTitle(title);
		dto.setWriter(writer);
		
		int row = dao.insert(dto);
		request.setAttribute("row", row);
		response.sendRedirect(request.getContextPath() + "/ex05");
		
	}
}
