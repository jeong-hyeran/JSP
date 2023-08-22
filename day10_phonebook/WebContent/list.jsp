<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="list" value="${dao.selectList() }" />

<h3>목록</h3>
<table border="1" cellpadding="10" cellspacing="0">
<c:forEach var="line" items="${list }">
  <tr>
    <td>${line.idx }</td>
    <td>${line.name }</td>
    <td>${line.pnum }</td>
    <td><a href="${cpath }/delete.jsp?idx=${line.idx}"><button>삭제</button></a></td>
  </tr>
</c:forEach>

</table>


</body>
</html>