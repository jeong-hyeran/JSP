<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
<div id="view">
<div class="sb">
	 <a href="${cpath }/board/list.jsp"><button>목록</button></a>
	 <c:if test="${login.userid eq dto.writer }">
		 <a href="${cpath }/board/modify.jsp?idx=${dto.idx}"><button>수정</button></a>
		 <a href="${cpath }/board/delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
	 </c:if>
</div>
<table class="viewTable">
	<tr>
		<td>제목</td>
		<td colspan="3">${dto.title }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td class="writer">${dto.writer }</td>
		<td>날짜</td>
		<td>
			<fmt:formatDate value="${dto.wdate }" pattern="yyyy-MM-dd a hh:mm"/> 
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td colspan="3">
			<c:if test="${empty dto.uploadfile }">
				<div>첨부파일이 없습니다.</div>
			</c:if>
			<c:if test="${not empty dto.uploadfile }">
				<img src="${cpath }/upload/${dto.uploadfile }" width="100">
			</c:if>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="3">${dto.content }</td>
	</tr>
</table>

</div>

</body>
</html>