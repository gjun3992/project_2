<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBPKG.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
section{
 width: 80%;
 padding-left: 25%;
 }
</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h2>회원목록 조회</h2><br/>

<section>
<form action="">
<table class="table table-bordered">
	<tr>
	  <th>회원 번호</th>
	  <th>회원성명</th>
	  <th>전화번호</th>
	  <th>주소</th>
	  <th>가입일자</th>
	  <th>고객등급</th>
	  <th>거주지역</th>
	</tr>
<% 
Connection conn=null;
Statement stmt=null;

try{
	conn =util.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT  *  FROM member_tbl_02 ORDER BY custno";
	ResultSet rs= stmt.executeQuery(sql);
	
	
	
	
	while(rs.next()){
		String grade = rs.getString("grade");
		switch(grade){
			case "A":
				grade="VIP";
				break;
			case "B":
				grade="일반";
				break;
			case "C":
				grade="직원";
				break;

		}
%>

	<tr>
		<td> <a href=modify.jsp?mod_custno=<%=rs.getString("custno") %>>
		            	<%= rs.getString("custno") %>
		</a> </td>
		<td><%= rs.getString("custname") %></td>
		<td><%= rs.getString("phone") %></td>
		<td><%= rs.getString("address") %></td>
		<td><%= rs.getDate("joindate") %></td>
		<td><%= grade %></td>
		<td><%= rs.getString("city") %></td>
	
	</tr>


<%
	}
}
catch (Exception e){
	e.printStackTrace();
}

%>	
		
		
		
</table>
</form>
</section>
</body>
</html>