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
<h2>회원가입</h2><br/>
<section>
<form action="action.jsp" method="post">
<% 
Connection conn=null;
Statement stmt=null;
try{
	conn =util.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT  MAX(custno)+1 custno  FROM member_tbl_02 ORDER BY custno";
	ResultSet rs= stmt.executeQuery(sql);
	
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = simpleDate.format(date);

	
	rs.next();


%>

 <div class="mb-3" id="login">
      회원번호
      <input type="text" class="form-control" name="custno" value="<%=rs.getString("custno") %>" >
    </div>
 <div class="mb-3" id="login" >
      회원성명
      <input type="text" class="form-control" name="custname">
    </div>
 <div class="mb-3" id="login">
     회원전화
      <input type="text" class="form-control" name="phone" >
    </div>
 <div class="mb-3" id="login">
    회원주소
      <input type="text" class="form-control" name="address" >
    </div>
    <div class="mb-3" id="login">
     가입일자
      <input type="text" class="form-control" name="joindate" value="<%=strDate %>" >
    </div>
    <div class="mb-3" id="login">
     고객등급
      <input type="text" class="form-control" name="grade" >
    </div>
    <div class="mb-3" id="login">
      도시코드
      <input type="text" class="form-control" name="city" >
    </div>
    <div class="mb-3" id="login">
	    <button type="submit" class="btn btn-light" name="mode" value="insert" onclick="return blink_check()">등록</button>
	    <button type="reset" class="btn btn-light">초기화</button>
    </div>

<%

}
catch (Exception e){
	e.printStackTrace();
}

%>	
</form>
</section>

<script type="text/javascript">
function blink_check() {
	var f = document.forms[0];             
	if (f.custname.value === "") {            
		alert("회원이름을 입력해주십시오");            
		f.custname.focus();            
		return false;        
		}
	if (f.phone.value === "") {            
		alert("전화번호를 입력해주십시오");            
		f.phone.focus();            
		return false;        
		}
	if (f.address.value === "") {            
		alert("주소를 입력해주십시오");            
		f.address.focus();            
		return false;        
		}
	if (f.grade.value ==="") {            
		alert("등급을 입력해주십시오");            
		f.grade.focus();            
		return false;        
		}
	if (f.city.value === "") {            
		alert("도시코드를 입력해주십시오");            
		f.city.focus();            
		return false;        
		}
	return true;
}





</script>

</body>
</html>