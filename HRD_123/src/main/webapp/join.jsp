<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<link rel="stylesheet" href="style.css">
<body>
<script type="text/javascript" src="check.js"> </script>
<jsp:include page="header.jsp"></jsp:include>
<%
Connection conn = null;
Statement stmt = null;
String custno="";

try {
	conn = Util.getConnection(); //DB연결
	stmt = conn.createStatement(); //sql 실행하기 위한 변수 생성
	String sql = "SELECT MAX(custno)+1 custno FROM member_tbl_02";
	//멤버 테이블에서 custno +1 한 값을 custno(alias) 에 담아서 가져온다.
	
	ResultSet rs = stmt.executeQuery(sql); //stmt 통해서 sql 실행 결과
	
	rs.next(); //rs 에 저장된 값을 불러온다. 1개의 결과물을 출력.
	
	custno = rs.getString("custno");
	
	session.setAttribute("max", custno); //modify 에서 활용한다.
}
catch (Exception e) {
	e.printStackTrace();
}
%>
<section>

<div class="box">
<h3>홈쇼핑 회원 등록</h3>

<form name="frm" method = "post" action="action.jsp">

<input type = "hidden" name="mode" value="INSERT">

<table border="1" width="600px">
<tr>
	<td>회원번호(자동발생)</td>
	<td align="left"><input type="text" name="custno" readonly value="<%=custno %>"></td>
</tr>
<tr>
	<td>회원성명</td>
	<td align="left"><input type="text" name="custname"></td>
</tr>
<tr>
	<td>회원전화</td>
	<td align="left"><input type="text" name="phone" placeholder="010-0000-0000"></td>
</tr>
<tr>
	<td>통신사</td>
	<td align="left">
	<input type="radio" name="address" value="SK" checked>SK
	<input type="radio" name="address" value="KT">KT
	<input type="radio" name="address" value="LG">LG
	
	</td>
</tr>
<tr>
	<td>가입일자</td>
	<td align="left"><input type="date" name="joindate" placeholder="2022-00-00"></td>
</tr>
<tr>
	<td>고객등급[A:VIP,B:일반,C:직원]</td>
	<td align="left">
		<select name="grade">
	<option value="A">A</option>
	<option value="B">B</option>
	<option value="C">C</option>
		</select>
	</td>
</tr>
<tr>
	<td>도시코드</td>
	<td align="left">
		<select name="city">
	<option value="01">01</option>
	<option value="10">10</option>
	<option value="20">20</option>
	<option value="30">30</option>
	<option value="40">40</option>
	<option value="60">60</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan="2">
	<button type="submit" onclick="return check()">등록</button>
	<button type="button" onclick="location='list.jsp'">조회</button>
	</td>
</tr>
</table>
</form>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>