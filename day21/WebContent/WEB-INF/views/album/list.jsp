<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>
<h3>앨범 목록</h3>
<table>
  <tr>
    <th>번호</th>
    <th>앨범</th>
    <th>장르</th>
    <th>발매일</th>
    <th>재생시간</th>
    <th>커버이미지</th>
    <th>수정 / 삭제</th>
  </tr>
  <c:forEach var="dto" items="${list }">
  <tr>
    <td>${dto.id }</td>
    <td>
    	<a href="${cpath }/album/view?id=${dto.id}">
    	${dto.name }</a> 
    </td>
    <td>${dto.type }</td>
    <td>${dto.rdate }</td>
    <td>${dto.playtime }</td>
    <td>
    	<img src="${cpath }/album_img/${dto.coverimg }" width="100">
    </td>
    <td>
   		<a href="${cpath }/album/update?id=${dto.id}"><button>수정</button></a>
   		<br><br> 	
   		<a href="${cpath }/album/delete?id=${dto.id}"><button>삭제</button></a> 	
    </td>
  </tr>
  </c:forEach>
</table>


<ul>
  <li><a href="${cpath }/artist/list"><button>가수 목록</button></a></li>
  <li><a href="${cpath }/music/list"><button>음악 목록</button></a></li>
</ul>



</body>
</html>