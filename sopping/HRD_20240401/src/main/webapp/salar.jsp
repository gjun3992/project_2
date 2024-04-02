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

<h2>회원별 매출조회</h2><br/>

<section>
<form action="">
<table class="table table-bordered">
	<tr>
	  <th>회원 번호</th>
	  <th>회원성명</th>
	  <th>고객등급</th>
	  <th>매출</th>
	</tr>
<% 
Connection conn=null;
Statement stmt=null;

try{
	conn =util.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT mem.custno, mem.custname, mem.grade, SUM(mon.price) AS total_price "+
			"FROM member_tbl_02 mem,money_tbl_02 mon "+
			"WHERE mem.custno=mon.custno "+
			"GROUP BY mem.custno, mem.custname, mem.grade";
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
		<td><%= rs.getString("custno") %></td>
		<td><%= rs.getString("custname") %></td>
		<td><%= grade %></td>
		<td><%= rs.getString("total_price") %></td>
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