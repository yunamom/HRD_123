<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%

ArrayList<String[]> member = new ArrayList<String[]>();

try {
	Connection conn = Util.getConnection(); //DB연결
	
	String sql = " SELECT";
		sql+= " custno,";
		sql+= " custname,";
		sql+= " phone,";
		sql+= " address,";
		sql+= " DATE_FORMAT(joindate,'%Y년 %m월 %d일') joindate,";
		sql+= " if(grade='A','VIP',";
		sql+= " if(grade='B','일반','직원')) grade,";
		sql+= " if(city='01','서울',";
		sql+= " if(city='10','인천',";
		sql+= " if(city='20','성남',";
		sql+= " if(city='30','대전',";
		sql+= " if(city='40','광주','부산'))))) city";
		sql+= " FROM member_tbl_02";
		
		/* sql if 문을 이용해서 작성해보았다..if 문이 7개가 들어갔는데
		여러방법을통해서 구현해보는중!
		명령문보내기*/
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery(); //stmt 통해서 sql 실행 결과
	
	//rs 에 저장된 값을 불러온다. 1개의 결과물을 출력.
	while(rs.next()){
		String list[] = new String [7];
		list[0]= rs.getInt("custno")+""; //변수에 담아준다.
		list[1] = rs.getString("custname");
		list[2] = rs.getString("phone");
		list[3] = rs.getString("address");
		list[4] = rs.getString("joindate");
		list[5] = rs.getString("grade");
		list[6] = rs.getString("city");
		member.add(list);		
	}
}
catch (Exception e) {
	e.printStackTrace();
}
%>
<section>
<div class="box">
<h3>회원목록조회/수정</h3>

<form name="frm" action="#">
<table border="1" width="700px">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>통신사</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
	
	<%for(int i=0; i<member.size(); i++) {%>
	<tr>
		<td><a href="modify.jsp?custno=<%=member.get(i)[0]%>"><%=member.get(i)[0]%></a></td>		
		<%for(int j=1; j<7; j++) {%>
		<td><%=member.get(i)[j]%></td>
		<%}%>
	</tr>
	<%}%>
</table>
</form>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>