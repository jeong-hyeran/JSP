<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="phonebook.PhoneBookDTO" />
<jsp:setProperty property="*" name="dto"/>

<c:set var="list" value="${dao.insert(dto) }" />


<c:redirect url="list.jsp" />
</body>
</html>