<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="java.sql.*"%>
<%
	String no = request.getParameter("no");
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
			
	String sql = "select deptno, dname, loc from dept where deptno= ' "+no+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	String dname = rs.getString("dname");
	String loc = rs.getString("loc");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" method="post" action="deptModifySave.jsp">
		<table border="1" width="400">
			<tr>
				<th>부서번호</th>
				<td><input type="text" name="deptno" value="<%=no %>" readonly></td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td><input type="text" name="dname" value="<%=dname %>"></td>
			</tr>
			<tr>
				<th>부서위치</th>
				<td><input type="text" name="loc" value="<%=loc %>"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit">저장</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>