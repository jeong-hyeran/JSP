<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="user" class="member.MemberDTO" />
<jsp:setProperty property="*" name="user"/>
<c:set var="login" value="${memberDAO.login(user) }" scope="session"/>

<%-- ${login } --%>

<%
	String storeID = request.getParameter("storeID");

	boolean flag1 = storeID != null;
	boolean flag2 = session.getAttribute("login") != null;
	
	Cookie c = new Cookie("userid", request.getParameter("userid"));
	c.setMaxAge(flag1 && flag2 ? 300 :0);
	response.addCookie(c);
	
	String autologin = request.getParameter("autologin");
	boolean flag3 = autologin != null;
	
	if(flag2 && flag3) {
		Cookie c1 = new Cookie("JSESSIONID", session.getId());
		c1.setMaxAge(86400);
		c1.setPath(request.getContextPath());
		response.addCookie(c1);	
	}
%>

<script>
	const login = '${login}'
	
	alert(login != '' ?'로그인 성공':'로그인 실패') 
	location.href = '${cpath}'
</script> 

</body>
</html>