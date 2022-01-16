<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="DBPKG.*" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

ArrayList<String[]> memberList = new ArrayList<String[]>(); //ArrayList 선언

try{
	Connection conn = Util.getConnection(); // DB연결
	String sql = " SELECT";
			sql+=" m1.custno,"; //2개의 테이블을 JOIN 하기때문에  
			sql+=" m1.custname,"; //앞에 어떤 테이블에서 가져오는 Attribute 인지 명시해준다.
			sql+=" if(m1.grade='A','VIP',";
			sql+=" if(m1.grade='B','일반','직원'))grade,";
			sql+=" sum(price) price"; //총합을 구하는 함수작성
			sql+=" FROM";
			sql+=" member_tbl_02 m1,";
			sql+=" money_tbl_02 m2 ";
			sql+=" WHERE m1.custno = m2.custno";
			sql+=" GROUP BY m1.custno"; //*함수는 SELECT , HAVING BY 에만 사용할수있다.
			sql+=" ORDER BY sum(price) DESC"; //오름차순 정렬
			
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery(); //stmt 통해서 sql 실행 결과
	while(rs.next()){
		String m[] = new String[4];
		m[0] = rs.getString("custno")+"";
		m[1] = rs.getString("custname");
		m[2] = rs.getString("grade");
		m[3] = rs.getString("price");
		memberList.add(m);//ArrayList 에 값을 넣어준다.
	}
}catch(Exception e){
	
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sallery</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section>
<div class="box">
<h3>회원매출조회</h3>

<form name="frm" action="#">
	<table border="1" width="500px">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
	<%for(String e[]:memberList){%>
	<tr><%for(String f:e){%>
		<td><%=f%></td><%}%>
	</tr><%}%>
	
	</table>
</form>
</div>
</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>