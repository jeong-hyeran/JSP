<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz1.jsp</title>
<style>
#root {
	display: flex;
	justify-content: space-between;
}

#calc {
	cursor: context-menu;
	user-select: none;
	background-color: #f3f3f3;
	width: 320px;
	height: 540px;
	border: 1px solid black;
	margin: 0 auto;
}

.flex {
	display: flex;
}

.top {
	padding: 5px 10px;
}

.top>.flex>div {
	margin: 0 15px;
}

.sb {
	display: flex;
	justify-content: space-between;
}

.mode {
	padding: 20px 5px;
}

.input {
	height:100px;
/* 	border: 1px dashed red; */
	font-size: 35px;
	font-weight: bold;
	text-align: right;
	padding: 0 10px;
}

.mbtns>div {
	padding: 10px 10px;
	font-size: 14px;
}

.btns > form {
	display: flex;
	flex-flow: wrap;
}

input {
	all: unset;
	width: 100%;
}

.btns>form>div {
	background-color: white;
	box-sizing: border-box;
	width: 24%;
	height: 3em;
	line-height: 3em;
	text-align: center;
	border: 0.5px solid #e4e4e4;
	border-radius: 5px;
	margin: 1px auto;
	box-shadow: 1px 1px 1px #cccccc;
}

.btns>div:last-child {
	background-color: #005ca2;
	color: white;
}
</style>
</head>
<body>

<%!
	String exp = ""; // 입력된창
	String s1,s2 = "";
	int n1, n2 = 0;
%>

<% 
	int result = 0 ;
	double result2 = 0 ;
	if(request.getMethod().equals("GET")){
		exp = "";
	}
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
			if("CE".equals(num)){
				exp = "";
				num = "";
				result = 0 ;
			}
		
			if(exp.length()!=0 && "←".equals(num)){ 
				num="";
				exp = exp.substring(0, exp.length()-1);
					
			}
			exp += num; 
	%>


			<%		
// 			if(exp.split(" ")[4].length() < 4){
			if(num != null ){
				
				if(s1 != null && " = ".equals(num)){
					s1 = exp.split(" ")[0];
					s2 = exp.split(" ")[2];
					n1 = Integer.parseInt(s1);
					n2 = Integer.parseInt(s2);
					
					if(exp.contains(" + ")) result = n1 + n2;
					if(exp.contains(" - ")) {
						if(n1 > n2){
						result = n1 - n2;
						}else{
							result = -1 * (n2 - n1);
						}
					}
					if(exp.contains(" × ")) result = n1 * n2;
					if(exp.contains(" ÷ ")) {
						result2 = (double)n1 / n2;
					}
					
					if(exp.contains(" ÷ ") == false){			
					}
				}
	 		


		}
// 	}
	}
%>


	<h1>이항 산술연산이 가능한 간단 계산기 구현하기</h1>
	<div id="root">
		<div id="calc">

			<div class="top sb">
				<div class="">📱계산기</div>
				<div class="flex">
					<div>_</div>
					<div>ㅁ</div>
					<div>⨉</div>
				</div>
			</div>

			<div class="mode sb">
				<div class="">≡ 표준 ◱</div>
				<div class="">◷</div>
			</div>

			<div class="input">

			<%=exp %><br>
			<%out.print(result2 != 0 ? result2 : 
									(result==0 ? "" : result));%> 


			</div>

			<div class="mbtns sb">
				<div>MC</div>
				<div>MR</div>
				<div>M+</div>
				<div>M-</div>
				<div>MS</div>
				<div>M∨</div>
			</div>

			<div class=btns>
				<form method="POST">
					<div>%</div>
					<div><input type="submit" name="num" value="CE"></div>
					<div>C</div>
<!-- 					<div>←</div> -->
					<div><input type="submit" name="num" value="←"></div>
					<div>⅟ⅹ</div>
					<div>x<sup>2</sup></div>
					<div><sup>2</sup>√x</div>
					<div><input type="submit" name="num" value=" ÷ "></div>
					<div><input type="submit" name="num" value="7"></div>
					<div><input type="submit" name="num" value="8"></div>
					<div><input type="submit" name="num" value="9"></div>
					<div><input type="submit" name="num" value=" × "></div>
					<div><input type="submit" name="num" value="4"></div>
					<div><input type="submit" name="num" value="5"></div>
					<div><input type="submit" name="num" value="6"></div>
					<div><input type="submit" name="num" value=" - "></div>
					<div><input type="submit" name="num" value="1"></div>
					<div><input type="submit" name="num" value="2"></div>
					<div><input type="submit" name="num" value="3"></div>
					<div><input type="submit" name="num" value=" + "></div>
					<div>+/–</div>
					<div><input type="submit" name="num" value="0"></div>
					<div>.</div>
					<div><input type="submit" name="num" value=" = "></div>
				</form>
			</div>


		</div>
	</div>
</body>
</html>