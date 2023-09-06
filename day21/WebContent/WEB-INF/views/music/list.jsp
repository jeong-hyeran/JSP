<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>

<table>
	<thead>
		<tr>
			<th>앨범</th>		
			<th>가수</th>		
			<th>노래제목</th>		
			<th>장르</th>		
			<th>재생시간</th>		
			<th class="lyricstite">가사</th>		
			<th>삭제</th>		
		</tr>
	</thead>
	<tbody>
		 <c:forEach var="dto" items="${list }">
		 	<tr>
		 <c:forEach var="dto3" items="${list3 }">
		 	<c:if test="${dto3.id eq dto.album_id }">
		 		<td>
		 			<img src="${cpath }/album_img/${dto3.coverimg}" width="50"> 
		 		</td>
		 	</c:if>
	 	</c:forEach>
		 <c:forEach var="dto2" items="${list2 }">
		 	<c:if test="${dto.artist_id eq dto2.id }">
		 		<td>${dto2.name }</td>
		 	</c:if>
	 	</c:forEach>
		 		<td>
		 			<a href="${cpath}/album/view?id=${dto.album_id}">${dto.name }</a>
		 		</td>
		 		<td>${dto.genre }</td>
		 		<td>${dto.playtime }</td>
		 		<td>
		 		<details>
		 				<summary>가사보기</summary>
			 			<fieldset class="lyrics" >
			 			 <pre>${dto.lyrics }</pre>
			 			</fieldset>
		 		</details>
		 		</td>
		 		<td><a href="${cpath }/music/delete?id=${dto.id}"><button>삭제</button></a></td>
		 	</tr>
		 </c:forEach>
	</tbody>
</table>
<ul>
  <li><a href="${cpath }/artist/list"><button>가수 목록</button></a></li>
  <li><a href="${cpath }/album/list"><button>앨범 목록</button></a></li>

</ul></body>
</html>