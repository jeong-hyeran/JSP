package ex05;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ex05/view")
public class Ex05View extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private String prefix = "/WEB-INF/views/";
	private String suffix = ".jsp";
	
	private BoardDAO dao = BoardDAO.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		int i = Integer.parseInt(idx);
		BoardDTO dto = dao.selsectOne(i);
		request.setAttribute("dto", dto);
		
		RequestDispatcher rd = request.getRequestDispatcher(prefix + "view" + suffix);
		rd.forward(request, response);
	}

}
