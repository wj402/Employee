<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8"); %>
 
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
			
	String sql = "SELECT deptno,dname,loc FROM dept";
	ResultSet rs = stmt.executeQuery(sql);		

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button type="button" onclick="location='deptWrite.jsp'">부서등록</button>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		<%
			int cnt = 0;
			while( rs.next() ) {
				cnt++;
				String no = rs.getString("deptno");
		%>
			<tr>
				<td></td>
				<td>
					<a href="deptModify.jsp?no=<%=no %>"> <%=no %> </a>
				</td>
				<td>
					<%=rs.getString("dname") %>
				</td>
				<td><%=rs.getString("loc") %></td>
			</tr>
		<%
			}
		%>
	</table>


</body>
</html>
