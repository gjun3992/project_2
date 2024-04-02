<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	width: 70%;
}
#login{
margin-left: 40%;
}


</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<h2>회원정보 수정/삭제</h2><br/>

<section>

<% 
Connection conn=null;
Statement stmt=null;
String mod_custno= request.getParameter("mod_custno");
try{
	conn =util.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT *  FROM member_tbl_02 WHERE custno ="+ mod_custno;
	ResultSet rs= stmt.executeQuery(sql);
	

	if(rs.next()){



%>
<form action="action.jsp?mod_custno=<%=rs.getString("custno") %>" method="post">
 <div class="mb-3" id="login">
      회원번호
      <input type="text" class="form-control" name="custno" value="<%=rs.getString("custno") %>" >
    </div>
 <div class="mb-3" id="login" >
      회원성명
      <input type="text" class="form-control"  name="custname" value="<%=rs.getString("custname") %>">
    </div>
 <div class="mb-3" id="login">
     회원전화
      <input type="text" class="form-control" name="phone"  value="<%=rs.getString("phone") %>">
    </div>
 <div class="mb-3" id="login">
    회원주소
      <input type="text" class="form-control"  name="address"  value="<%=rs.getString("address") %>">
    </div>
    <div class="mb-3" id="login">
     가입일자
      <input type="text" class="form-control"  name="joindate" value="<%= rs.getDate("joindate") %>" >
    </div>
    <div class="mb-3" id="login">
     고객등급
      <input type="text" class="form-control"  name="grade"  value="<%=rs.getString("grade") %>">
    </div>
    <div class="mb-3" id="login">
      도시코드
      <input type="text" class="form-control" name="city"  value="<%=rs.getString("city") %>">
    </div>
    <div class="mb-3" id="login">
	    <button type="submit" class="btn btn-light" name="mode" value="modify">수정</button>
	    <button type="submit" class="btn btn-light" name="mode" value="delete">삭제</button>
	    <button type="reset" class="btn btn-light">초기화</button>	
    </div>

<%
	}
}
catch (Exception e){
	e.printStackTrace();
}

%>	

</form>
</section>
</body>
</html>