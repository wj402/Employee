<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
%>

<%	

	String url = "jdbc:mysql://localhost:3306/apple?useUnicode=true&characterEncoding=utf8";
	String username = "root";
	String userpass = "apmsetup";
	// 접속드라이버 연결x
	Class.forName("com.mysql.jdbc.Driver");
	// 접속정보 세팅
	Connection conn = DriverManager.getConnection(url,username,userpass);
	// 접속한 MySQL의 SQL실행 결과를 위한 메모리 공간 확보
	Statement stmt = conn.createStatement(); // 인스턴스화(객체화==메모리에올림)
	
	String sql = "insert into dept(deptno, dname, loc) values('"+deptno+"', '"+dname+"', '"+loc+"')";
	int result = stmt.executeUpdate(sql); // result = 1; (정상), result = 0; (오류)
	if ( result == 1 ) {
%>
	<script>
		alert("저장완료");
		location = "deptList.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("저장실패");
		history.back();
	</script>
<%
	}
%>