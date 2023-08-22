<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<h3>대문페이지</h3>
	
	<details>
		<summary>데이터모델링</summary>
		<h4>주제 : student 성적을 DB에 등록하여 목록 및 추가 가능한 사이트 만들기</h4>
		<fieldset>
			<legend>단일 데이터 구성</legend>
				 <ul>
				 	<li>name : 학생이름</li>
				 	<li>kor : 국어점수</li>
				 	<li>eng : 영어점수</li>
				 	<li>math : 수학점수</li>
				 	<li>total : 합계점수</li>
				 	<li>avg : 평균점수</li>
				 </ul>
		</fieldset>
	</details>
	
	<details>
		<summary>SQL 코드</summary>
		<fieldset>
			<legend>SQL문</legend>
			<pre>
		drop TABLE student purge;
		
			create table student(
			    name    VARCHAR2(100),
			    kor     number,
			    eng     number,
			    math     number
			);
			
			insert into student values ('짱구', 50, 55, 62);
			insert into student values ('지수', 72, 87, 61);
			
			
			select 
			    student.*,
			    kor + eng + math as total,
			    trunc((kor + eng + math) /3, 1) as avg
			    from student;
			
			select * from student;
			
			commit;
	        
		        desc student;
		        
		        update student set kor=50,eng=80, math=100 where name='지수';
        
     		select 
		    student.*,
		    kor + eng + math as total,
		    trunc((kor + eng + math) /3, 1) as avg
		    from student where name='지수';
			</pre>
		</fieldset>
	</details>
	
</main>

</body>


</html> 
