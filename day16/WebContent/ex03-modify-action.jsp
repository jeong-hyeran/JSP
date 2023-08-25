<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ex03-header.jsp" %>
<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }"/>
<c:set var="row" value="${dao.update(dto }" /> 

<c:redirect url="/ex03-list.jsp" />
<body>

</body>
</html>