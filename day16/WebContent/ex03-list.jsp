<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ex03-header.jsp" %>

<c:set var="list" value="${dao.selectAll() }" />
<table>
	<thead>
		 <tr>
		   <th>번호</th>
		   <th>제목</th>
		   <th>파일 경로</th>
		   <th>이미지</th>
		   <th>삭제/수정</th>
		 </tr>
  </thead>
  <tbody>
	 <c:forEach var="item" items="${list }">
	  <tr>
	    <td>${item.idx }</td>
	    <td>${item.title }</td>
	    <td>${item.filePath }</td>
	    <td><img src="${item.filePath }" width="100"></td>
	    <td>
	    	<a href="${cpath }/ex03-delete.jsp?idx=${item.idx}"><button>삭제</button></a>
	    	<br><br>
	    	<a href="${cpath }/ex03-modify.jsp?idx=${item.idx}"><button>수정</button></a>
	    </td>
	  </tr>
	 </c:forEach>
  </tbody>
</table>

</body>
</html>