<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../home.jsp" %>

<table>
  <tr>
    <th>번호</th>
    <th>프로필</th>
    <th>가수</th>
    <th>소속사</th>
    <th>국적</th>
    <th>멤버</th>
    <th>데뷔일</th>
    <th>타입</th>
  </tr>
  <c:forEach var="dto" items="${list }">
  <tr>
    <td>${dto.id }</td>
    <td>
    	<img src="${cpath }/artist_img/${dto.profileimg }" width="100">	
    </td>
    <td>
    	<a href="${cpath }/artist/view?id=${dto.id}">${dto.name }</a> 
    </td>
    <td>${dto.company }</td>
    <td>${dto.country }</td>
    <td>${dto.member }</td>
    <td>${dto.debut }</td>
    <td>${dto.type }</td>
  </tr>
  </c:forEach>
</table>

<ul>
  <li><a href="${cpath }/artist/add"><button>추가하기</button></a></li>
  <li><a href="${cpath }/album/list"><button>앨범목록</button></a></li>
  <li><a href="${cpath }/music/list"><button>음악목록</button></a></li>
</ul>

</body>
</html>