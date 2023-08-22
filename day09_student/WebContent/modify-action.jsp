<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
${dto.kor }
${dao.update(dto, name) }
<c:redirect url="list.jsp" />
</body>
</html>