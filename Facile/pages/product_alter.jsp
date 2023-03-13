<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html>
  <head>
    <title>修改產品</title>
  </head>
  <body>
    <%
    try
    {
        request.setCharacterEncoding("utf-8");
        String product_ID = request.getParameter("product_ID");
        String product_Name = request.getParameter("product_Name");
        String classify = request.getParameter("classify");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String unit = request.getParameter("unit");
        String img = request.getParameter("img");

        sql = "UPDATE product SET product_Name='"+product_Name+"',classify='"+classify+"',price='"+price+"',stock='"+stock+"',unit='"+unit+"',img='"+img+"'WHERE product_ID='"+product_ID+"'";
        con.createStatement().executeUpdate(sql);
        con.close();
        response.sendRedirect("list.jsp");
    }
    catch (SQLException sExec) 
    {
        out.println("SQL錯誤"+sExec.toString());
    }
    %>
  </body>
</html>