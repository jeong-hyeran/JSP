<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="list" value="${boardDAO.selectOne(param.idx) }" />

</body>
</html>