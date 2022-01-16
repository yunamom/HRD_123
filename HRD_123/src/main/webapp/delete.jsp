<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util"%>

<%
request.setCharacterEncoding("UTF-8");

Connection conn = Util.getConnection();

String custno = request.getParameter("custno");
//1 연결
Statement pstmt = conn.createStatement(); //중요.
String sql ="";

	sql = " DELETE FROM member_tbl_02";
	sql+= " WHERE custno="+custno+"";
	
	int result = pstmt.executeUpdate(sql);
	if(result == 1){
	%>
	<script>
	alert("삭제완료!");
	location="list.jsp";
	</script>
	<%
	}
%>