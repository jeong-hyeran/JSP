<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- <c:set var="list" value="${boardDAO.selectAll() }" /> --%>
<c:set var="list" value="${boardDAO.selectPart(login.userid) }"/>
<div id="part">
	<c:if test="${not empty login }">
	<div class="sb">
		<a href="${cpath }/board/write.jsp"><button>새글작성</button></a>
		<a href="${cpath }/board/list.jsp"><button>전체보기</button></a>
	</div>
	</c:if>
	<c:if test="${empty login }">
		<c:redirect url="/" />
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