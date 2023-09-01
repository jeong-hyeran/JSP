<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="list" value="${boardDAO.selectAll() }" />
<div id="list">
	<c:if test="${not empty login }">
	<div class="sb">
		<a href="${cpath }/board/write.jsp"><button>새글작성</button></a>
		<a href="${cpath }/board/part.jsp?writer=${login.userid}"><button>내글보기</button></a>
	</div>
	</c:if>
	<c:if test="${empty login }">
		<h6><a href="${cpath }/member/login.jsp">로그인 후 글 작성 가능합니다.</a></h6>
	</c:if>
	<table class="listTable">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list }">
				<tr>
					<td>${item.idx }</td>
					<td>
						<a href="${cpath }/board/view.jsp?idx=${item.idx}">${item.title }</a>
						${not empty  item.uploadfile ? '💾' :''}
					</td>
					<td>${item.writer }</td>
					<td>${item.wdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>