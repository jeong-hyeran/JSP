package ex05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex05/delete")
public class Ex05Delete extends HttpServlet{

	private static final long serialVersionUID = 1L;
	

	
	private BoardDAO dao = BoardDAO.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idx = request.getParameter("idx");
		int row = dao.delete(Integer.parseInt(idx));
		
		System.out.println(row != 0 ?row + "행이 삭제 되었습니다." : "삭제되지 않았습니다.");	
		response.sendRedirect(request.getContextPath()+ "/ex05");
	}

}
