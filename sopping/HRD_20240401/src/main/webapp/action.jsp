<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD Operations</title>
</head>
<body>

<% 
PreparedStatement pstmt = null;
Connection conn = null;


try {
    conn = util.getConnection();
    String mod_custno = request.getParameter("mod_custno");
    System.out.println(mod_custno);
    String mode = request.getParameter("mode");

    switch (mode) {
        case "insert":
            String insertSql = "INSERT INTO member_tbl_02 (custno,custname,phone,address,joindate,grade,city)"+
            				"VALUES(?, ?, ?, ?, TO_DATE(?, 'yyyy-mm-dd'), ?, ?)";
            pstmt = conn.prepareStatement(insertSql);
            pstmt.setString(1, request.getParameter("custno"));
            pstmt.setString(2, request.getParameter("custname"));
            pstmt.setString(3, request.getParameter("phone"));
            pstmt.setString(4, request.getParameter("address"));
            pstmt.setString(5, request.getParameter("joindate"));
            pstmt.setString(6, request.getParameter("grade"));
            pstmt.setString(7, request.getParameter("city"));
            pstmt.executeUpdate();
            
            response.sendRedirect("list.jsp");
            break;
            
        case "modify":
            String updateSql = "UPDATE member_tbl_02 SET custno=?, custname=?, phone=?, " +
                               "address=?, joindate=TO_DATE(?, 'yyyy-mm-dd'), grade=?, city=? " +
                               "WHERE custno=" + mod_custno;
            pstmt = conn.prepareStatement(updateSql);
            pstmt.setString(1, request.getParameter("custno"));
            pstmt.setString(2, request.getParameter("custname"));
            pstmt.setString(3, request.getParameter("phone"));
            pstmt.setString(4, request.getParameter("address"));
            pstmt.setString(5, request.getParameter("joindate"));
            pstmt.setString(6, request.getParameter("grade"));
            pstmt.setString(7, request.getParameter("city"));
            pstmt.executeUpdate();
            
            response.sendRedirect("list.jsp");
            break;
            
        case "delete":
            String deleteSql = "DELETE FROM member_tbl_02 WHERE custno=?";
            pstmt = conn.prepareStatement(deleteSql);
            pstmt.setString(1, mod_custno);
            pstmt.executeUpdate();
            
            response.sendRedirect("list.jsp");
            break;
    
    
    }

    
} catch (Exception e) {

    e.printStackTrace();
}
%>

</body>
</html>