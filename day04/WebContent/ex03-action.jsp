<%@page import="ex03.MovieDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-action.jsp</title> <%--데이터 처리 --%>
</head>
<body>

<%! MovieDTO[] arr = {
			new MovieDTO("밀수","2023-07-26", 2417754),
			new MovieDTO("오펜하이머","2023-08-15", 0),
			new MovieDTO("비공식작전","2023-08-02", 165433),
			new MovieDTO("더 문","2023-08-02", 121186),
			new MovieDTO("콘크리트 유토피아","2023-08-09", 4876),
			new MovieDTO("엘리멘탈","2023-06-14", 5955156),
			new MovieDTO("미션 임파서블: 데브 레코닝 PART ONE","2023-07-12", 3685013),
			new MovieDTO("바비","2023-07-19", 476594),
			new MovieDTO("몬스터 패밀리2","2023-08-02", 17678),
			new MovieDTO("명탐정 코난: 흑철의 어영","2023-07-20", 632510),

	};%>
<%
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");
	
	MovieDTO data = null;
	for(MovieDTO ob : arr){ //arr값을 하나하나씩 movie의 형태의 ob에 하나씩 대입한다.
		if(ob.getTitle().contains(search)){ //  search가 ob의 타이틀에 포함되어있으면
	data = ob; // movie객체의 data에 넣는다.
	break; // 하나 넣으면 그대로 반복문 종료
		}
	}
	session.setAttribute("data", data); 
	//사용자의 접속이 유지되는 동안 유지되는 값에 data의 값을 넣는다.
	//(인터넷 브라우저를 닫기전에는 유효)
	
	String url ="ex03-result.jsp";  // url에 응답 할 주소를 적는다.
	response.sendRedirect(url); // 응답을 url로 넘긴다.
%>

</body>
</html>