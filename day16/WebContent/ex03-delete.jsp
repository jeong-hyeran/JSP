<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ex03-header.jsp" %>
<c:set var="row" value="${dao.delete(param.idx) }" /> 
<c:redirect url="/ex03-list.jsp" />
</body>
</html>