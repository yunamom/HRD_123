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


// resultSet 은(SELECT 할때만 사용한다.)
try{
	Connection conn = Util.getConnection();
	//1 연결
	Statement pstmt = conn.createStatement(); //중요.
	
	String sql = "INSERT INTO member_tbl_02 ";
	sql+="VALUES("+custno+",'"+custname+"','"+phone+"',";
	sql+="'"+address+"','"+joindate+"','"+grade+"','"+city+"')";
	
	
	pstmt.executeUpdate(sql); //Update 를 작성해서 쿼리문을 mysql DB에 보냅니다.
%>
<jsp:forward page="index.jsp"></jsp:forward>
<% return;
}

catch(Exception e){ //예외처리
	e.printStackTrace();
}
%>