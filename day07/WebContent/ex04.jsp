<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
<style>
	table{
		border: 1px solid black;
		border-collapse: collapse;
	}
	th,td{
		border: 1px solid black;
		padding : 10px;		
	}
	td{
		cursor: pointer;
	}
	th{
		background-color: #FFC0CB;
	}
	td:first-child{
		text-align: center;
		font-weight:bold; 
	}
	.pink{
		background-color: #FFE3EE;
	
	}
</style>
</head>
<body>

<h1>ex04.jsp - 멜론차트</h1>
<hr>
<details>
	<summary>SQL</summary>
	<fieldset>
	<pre> <%-- pre 입력한 형태 그대로 출력해줌 (들여쓰기같은 것들..!) --%>
		CREATE table melon (
		    ranking         number,
		    title           varchar2(100),
		    artist          varchar2(100),
		    album           varchar2(100),
		    likeCount       number
		);
	
		INSERT into melon values (1, 'Super Shy', 'NewJeans', 'NewJeans EP ''GET UP''', 124635);
		INSERT into melon values (2, 'ETA', 'NewJeans', 'NewJeans EP ''GET UP''', 72628);
		INSERT into melon values (3, 'Seven (feat. Latto) - Clean Ver.', '정국', 'Seven (feat. Latto) - Clean Ver.', 137573);
		INSERT into melon values (4, '퀸카 (Queencard)', '(여자)아이들', 'I feel', 127567);
		INSERT into melon values (5, '헤어지자 말해요', '박재정', '1집 Alone', 103467);
		INSERT into melon values (6, 'I AM', 'IVE(아이브)', 'I''ve IVE', 190809);
		INSERT into melon values (7, '이브, 프시케 그리고 푸른 수염의 아내', 'LE SSERAFIM (르세라핌)', 'UNFORGIVEN', 99316);
		INSERT into melon values (8, 'Spicy', 'aespa', 'MY WORLD - The 3rd Mini Album', 116993);
		INSERT into melon values (9, 'Steal The Show (From “엘리멘탈”)', 'LAuv', 'Steal The Show (From “엘리멘탈”)', 117403);
		INSERT into melon values (10, 'New Jeans', 'NewJeans', 'NewJeans EP ''GET UP''', 62054);

		commit;
		
		SHOW TABLES;
		
		DROP TABLE melon;
	</pre>
	</fieldset>
</details>

<jsp:useBean id="dao" class="ex04.MelonDAO" />
<c:set var="list" value="${dao.getdata() }"/>
<table>
	<thead>
		 <tr>
		 	<th>순위</th>
		 	<th>제목</th>
		 	<th>가수</th>
		 	<th>앨범</th>
		 	<th>좋아요</th>
		 </tr>
	</thead>
	<tbody>
	<c:forEach var="line" items="${list }" varStatus="st">
		<tr class="${st.index % 2 == 0 ? 'white' : 'pink' }">
			<td>${line.ranking }</td>
			<td>🎵 ${line.title }</td>
			<td>🎤 ${line.artist }</td>
			<td>💿 ${line.album }</td>
			<td>🤍 <fmt:formatNumber value="${line.likeCount }"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>



</body>
</html>

