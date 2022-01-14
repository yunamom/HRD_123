package DBPKG;

import java.sql.*;

public class Util {

	 public static Connection getConnection() throws Exception{
		 String url = "jdbc:mysql://localhost:3306/HRD?useUnicode=true&characterEncoding=utf8";
		 String name = "root";
		 String pw = "root";
		 //접속드라이버 연결
         Class.forName("com.mysql.cj.jdbc.Driver");
         //접속정보 세팅
         Connection con = DriverManager.getConnection(url,name,pw);
        
         
         return con;
	 }
}
