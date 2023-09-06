package org.springframework.web.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.controller.Controller;

public class DispatcherServlet extends HttpServlet {
	// 모든 요청을 받아서 처리하는 유일한 서블릿
	private static final long serialVersionUID = 1L;
	
	private final String prefix = "/WEB-INF/views/";
	private final String suffix = ".jsp";
	
	private Map<String, Controller> map = new HashMap<>();
	
	@Override
	public void init() throws ServletException {		// 서버 시작할때 한번만 실행(필요한 모든 객체를 모두 준비해놓는다)
		// 1) web.xml에 서블릿을 등록할 때, 미리 지정한 설정파일을 불러온다
		String configFile = getInitParameter("configFile");
		Properties pro = new Properties();		// Map<String, String>
		FileInputStream fis = null;
		
		String configFilePath = getServletContext().getRealPath(configFile);
		try {
			fis = new FileInputStream(configFilePath);
			pro.load(fis);		// 설정 파일의 내용을 pro에 담는다 (주소=클래스)
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null) fis.close();
			} catch(Exception e) {}
		}
		
		// 2) pro에 저장된 클래스 이름을 기반으로 실제 클래스를 불러오고, 객체를 하나 생성해서
		// 주소=객체 의 형식으로 map에 저장한다
		Iterator<Object> it = pro.keySet().iterator();
		while(it.hasNext()) {
			String command = (String) it.next();
			String handlerClassName = pro.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				Controller handlerInstance = (Controller) handlerClass.newInstance();
				map.put(command, handlerInstance);
			} catch(ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				System.err.println("\n\t[ 컨트롤러 객체를 로드하는데 실패했습니다 ]\n");
				return;		// 실패시 리턴
			}
		}
		System.out.println("\n\t서블릿 초기화 성공\n");
		for(String key : map.keySet()) {
			System.out.println(key + " : " + map.get(key).getClass().getSimpleName());
		}
	}
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getRequestURI();
		if(command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		Controller controller = map.get(command);
		
		String viewName = null;
		try {
			switch(request.getMethod()) {
			case "GET":		viewName  = controller.doGet(request, response); break;
			case "POST":	viewName  = controller.doPost(request, response); break;
			}
		} catch(Throwable e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
		if(viewName != null) {
			if(viewName.startsWith("redirect:")) {
				String redirect = viewName.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + redirect);
			}
			else {
				viewName = prefix + viewName + suffix;
				request.getRequestDispatcher(viewName).forward(request, response);				
			}
		}
		
		System.out.println("요청받은 주소 : " + command);
		System.out.println("함수를 실행할 컨트롤러 이름 : " + map.get(command).getClass().getSimpleName());
		System.out.println("요청메서드 : " + request.getMethod());
		System.out.println("화면을 보여줄 JSP : " + viewName);
		System.out.println();
	}


}
