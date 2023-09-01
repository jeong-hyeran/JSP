package ex05;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05")
public class Ex05Servlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private String prefix = "/WEB-INF/views/";
	private String suffix = ".jsp";
	
	private BoardDAO dao = BoardDAO.getInstance();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BoardDTO> list = dao.selectList();
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher(prefix + "ex05" + suffix);
		rd.forward(request, response);
	}

}
