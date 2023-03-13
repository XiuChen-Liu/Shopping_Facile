<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*,  java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<%
String email=session.getAttribute("memberID").toString();
String pid=request.getParameter("pid");

try{
		   sql="Delete from car where email='"+ email+"' AND pid='"+ pid+"' ";
		   con.createStatement().execute(sql);	 //執行SQL				
		   con.close();	
		   out.print("<script>document.location = 'cart.jsp'</script>"); 
}
catch ( SQLException e){
	out.print(e.toString());
		   
}
		 
		   

%>