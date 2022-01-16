<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util"%>

<%
request.setCharacterEncoding("UTF-8");




int custno = Integer.parseInt(request.getParameter("custno"));
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

String mode = request.getParameter("mode"); // insert or select or update

// resultSet 은(SELECT 할때만 사용한다.)
try{
	Connection conn = Util.getConnection();
	//1 연결
	Statement pstmt = conn.createStatement(); //중요.
	String sql ="";
	
	switch(mode) {
	case "INSERT" :
		sql = " INSERT INTO member_tbl_02 ";
		sql+= " VALUES";
		sql+= " ("+custno+",'"+custname+"','"+phone+"',";
		sql+= " '"+address+"','"+joindate+"','"+grade+"','"+city+"')";
	
		pstmt.executeUpdate(sql); //Update 를 작성해서 쿼리문을 mysql DB에 보냅니다.
%>
<script>
alert("회원등록 완료!");
location="join.jsp";
</script>
<%
	break;
	
	case "UPDATE" :
		sql = " UPDATE member_tbl_02";
		sql+= " SET custname='"+custname+"',";
		sql+= " phone='"+phone+"',";
		sql+= " address='"+address+"',";
		sql+= " joindate='"+joindate+"',";
		sql+= " grade='"+grade+"',";
		sql+= " city='"+city+"'";
		sql+= " WHERE custno="+custno+"";
		
		pstmt.executeUpdate(sql);
%>
<script>
alert("회원수정 완료!");
location="join.jsp";
</script>
<%		
	break;
	}
}
catch(Exception e){ //예외처리
	e.printStackTrace();
}
%>