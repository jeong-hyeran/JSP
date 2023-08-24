<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="dto" class="board.BoardDTO" />
<jsp:setProperty property="*" name="dto"/>
<c:set var="row" value="${boardDAO.insert(dto) }"/>
<c:redirect url="/board/list.jsp"/>
</body>
</html>