<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>
<ul>
  	<li><a href="${cpath }/artist/update?id=${dto.id}&name=${dto.name}"><button>가수 수정</button></a></li>
<%-- 	<li><a href="${cpath }/artist/delete?id=${dto.id}"><button>가수 삭제</button></a></li> --%>
</ul>

<table>
  <tr>
    <td>프로필</td>
    <td colspan="3">
    	<img src="${cpath }/artist_img/${dto.profileimg}" width="250">
    </td>
  </tr>
  <tr>
    <td>가수</td>
    <td>
    	${dto.name }
    	
   	</td>
    <td>멤버</td>
    <td>${dto.member }</td>
  </tr>
  <tr>
    <td>소속사</td>
    <td>${dto.company }</td>
    <td>국적</td>
    <td>${dto.country }</td>
  </tr>
  <tr>
    <td>타입</td>
    <td>${dto.type }</td>
    <td>데뷔일</td>
    <td>${dto.debut }</td>
  </tr>

</table>


<div>
	<details id="album">
		<summary>앨범 보기</summary>
		<table>
			<tr>
				<td>번호</td>
				<td>앨범</td>
				<td>장르</td>
				<td>발매일</td>
				<td>재생시간</td>
				<td>커버이미지</td>
			</tr>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.id }</td>
					<td>
					<a href="${cpath }/album/view?id=${dto.id}">${dto.name }</a>
					</td>
					<td>${dto.type }</td>
					<td>${dto.rdate }</td>
					<td>${dto.playtime }</td >
					<td><img src="${cpath }/album_img/${dto.coverimg }" width="100"></td>
				</tr>
			</c:forEach>
		</table>
	</details>

</div>

<ul>
	<li><a href="${cpath }/artist/list"><button>가수 목록</button></a></li>
	<li><a href="${cpath }/album/list"><button>앨범 목록</button></a></li>
	<li><a href="${cpath }/album/add?id=${dto.id}"><button>앨범 추가</button></a></li>
</ul>


</body>
</html>