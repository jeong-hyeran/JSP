<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }"/>
<c:set var="row" value="${boardDAO.modify(dto) }" />
${row }
<c:redirect url="/board/view.jsp?idx=${dto.idx }" />

</body>
</html>