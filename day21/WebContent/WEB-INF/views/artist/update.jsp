<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.itbank.repositery.ArtistDAO"%>
<%@ include file="../home.jsp" %>


<form method="POST" enctype="multipart/form-data">
	    <input type="hidden" name="id" value="${param.id }">	
<table border="1" cellspacing="0" cellpadding="10">
  <tr>
    <th>가수</th>
    <th>
    	${dto.name }
	    <input type="hidden" name="name" value="${dto.name }">	
   	</th>
    <th>멤버</th>
    <th>
	    <input type="text" name="member" value="${dto.member }">	
    </th>
  </tr>
  <tr>
    <th>소속사</th>
    <th>
    	<input type="text" name="company" value="${dto.company }"> 
    </th>
    <th>국적</th>
    <th>
    	<input type="hidden" name="country" value="${dto.country }">
    	${dto.country }
    </th>
  </tr>
  <tr>
    <th>타입</th>
    <th>
    	<input type="hidden" name="type" value="${dto.type }">
    	${dto.type }
    </th>
    <th>데뷔일</th>
    <th>
    	${dto.debut }
    	<input type="hidden" name="debut" value="${dto.debut }">
    </th>
  </tr>
  <tr>
    <th>프로필</th>
    <th colspan="3">
    	<img src="${cpath }/artist_img/${dto.profileimg}" width="200">
	    <input type="file" name="profileimg" value="${dto.profileimg}">
    </th>
  </tr>
</table>
<p><input type="submit" value="수정완료"></p>
</form>
<p>
	<a href="${cpath }/artist/view?id=${dto.id}"><button>이전으로</button></a>
	<a href="${cpath }/artist/list"><button>목록으로</button></a>
</p>
</body>
</html>