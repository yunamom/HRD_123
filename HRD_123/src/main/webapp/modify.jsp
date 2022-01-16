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

String max = (String)session.getAttribute("max");
//마지막회원번호 +1 번호보다 작으면 수정화면이다.

String custno = request.getParameter("custno");
String custname = "";
String phone = "";
String address = "";
String joindate = "";
String grade = "";
String city = "";

try {
	conn = Util.getConnection(); //DB연결
	stmt = conn.createStatement(); //sql 실행하기 위한 변수 생성
	String sql = "SELECT";
		sql += " custname,phone,address,joindate,grade,city";
		sql += " FROM member_tbl_02";
		sql += " WHERE custno='"+custno+"'";
	
	ResultSet rs = stmt.executeQuery(sql); //stmt 통해서 sql 실행 결과
	
	rs.next(); //rs 에 저장된 값을 불러온다. 1개의 결과물을 출력.
	custname = rs.getString("custname");
	phone = rs.getString("phone");
	address = rs.getString("address");
	joindate = rs.getString("joindate");
	grade = rs.getString("grade");
	city = rs.getString("city");
}
catch (Exception e) {
	e.printStackTrace();
}
%>
<section>

<div class="box">
<h3><%=custname%>님 회원수정</h3>

<form name="frm" method = "post" action="action.jsp">

<input type = "hidden" name="mode" value="UPDATE">
<input type = "hidden" name="custno" value="<%=custno%>">
<input type = "hidden" name="max" value="<%=max%>"> 

<table border="1" width="600px">
<tr>
	<td>회원번호(자동발생)</td>
	<td align="left"><%=custno %></td>
</tr>
<tr>
	<td>회원성명</td>
	<td align="left"><input type="text" name="custname" value="<%=custname%>"></td>
</tr>
<tr>
	<td>회원전화</td>
	<td align="left"><input type="text" name="phone" value="<%=phone%>"></td>
</tr>
<tr>
	<td>통신사</td>
	<td align="left">
	
	<input type="radio" name="address" value="SK"
	<%if(address.equals("SK")) out.print("checked");%>>SK
	<input type="radio" name="address" value="KT"
	<%if(address.equals("KT")) out.print("checked");%>>KT
	<input type="radio" name="address" value="LG"
	<%if(address.equals("LG")) out.print("checked");%>>LG
	
	</td>
</tr>
<tr>
	<td>가입일자</td>
	<td align="left"><input type="date" name="joindate" value="<%=joindate%>"></td>
</tr>
<tr>
	<td>고객등급[A:VIP,B:일반,C:직원]</td>
	<td align="left"><input type="text" name="grade" value="<%=grade%>"></td>
</tr>
<tr>
	<td>도시코드</td>
	<td align="left"><input type="text" name="city" value="<%=city%>"></td>
</tr>
<tr>
	<td colspan="2">
	<button type="submit" onclick="check();return false;">수정</button>
	<button type="button" onclick="location='delete.jsp?custno=<%=custno%>'">삭제</button>
	</td>
</tr>
</table>
</form>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>