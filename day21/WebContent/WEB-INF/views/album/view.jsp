<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>

<table border="1" cellspacing="0" cellpadding="10">
  <tr>
    <th>앨범</th>
    <th>${albumdto.name }</th>
    <th>장르</th>
    <th>${albumdto.type }</th>
  </tr>
  <tr>
    <th>발매일</th>
    <th>${albumdto.rdate }</th>
    <th>재생시간</th>
    <th>${albumdto.playtime }</th>
  </tr>
  <tr>
    <th>프로필</th>
    <th colspan="3">
    	<img src="${cpath }/album_img/${albumdto.coverimg}" width="250">
    </th>
  </tr>
</table>
<div>
<br><br><br>
<table id="musiclist">
		 <thead>
		<tr>
			<th>노래제목</th>		
			<th>장르</th>		
			<th>재생시간</th>		
			<th class="lyricstite">가사</th>
		</tr>
		</thead>
		<tbody>
		 <c:forEach var="dto" items="${list }">
	 	<tr>
	 		<td>${dto.name }</td>
	 		<td>${dto.genre }</td>
	 		<td>${dto.playtime }</td>
		 		<td>
	 		<details>
	 		<summary>가사보기</summary>
	 				<textarea class="lyrics" >
	 			 			${dto.lyrics }
	 				</textarea>
	 		</details>
		</tr>
		 </c:forEach>
		</tbody>
</table>
</div>
<ul>
  <li><a href="${cpath }/artist/list"><button>가수 목록</button></a></li>
  <li><a href="${cpath }/album/list"><button>앨범 목록</button></a></li>
  <li><a href="${cpath }/music/add?id=${albumdto.id}"><button>음악 추가</button></a></li>
</ul>

</body>
</html>