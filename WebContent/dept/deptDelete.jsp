<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>

<%
	String deptno = request.getParameter("deptno");
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
%>

<%
	String sql = "delete from dept where deptno='"+deptno+"' ";
	int result = stmt.executeUpdate(sql);
	if( result == 1 ) {
%>
	<script>
		alert("삭제완료")
		location = "deptList.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("삭제실패")
		history.back();
	</script>
<%
	}
%>