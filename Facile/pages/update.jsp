<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%
	if(session.getAttribute("memberID") != null ){
		if(request.getParameter("memberID")!=null){
			sql = "UPDATE `members` SET `memberID`='"+request.getParameter("memberID")+"' WHERE `memberID`='"+session.getAttribute("memberID")+"'";
			con.createStatement().execute(sql);
			sql = "UPDATE `members` SET `memberPWD`='"+request.getParameter("memberPWD")+"' WHERE `memberID`='"+session.getAttribute("memberID")+"'";
			con.createStatement().execute(sql);	
			String name=new String(request.getParameter("memberName").getBytes("ISO-8859-1"),"UTF-8");
			sql = "UPDATE `members` SET `memberName`='"+ name +"' WHERE `memberID`='"+session.getAttribute("memberID")+"'";
			con.createStatement().execute(sql);	
			sql = "UPDATE `members` SET `Tel`='"+request.getParameter("Tel")+"' WHERE `memberID`='"+
			session.getAttribute("memberID")+"'";
			con.createStatement().execute(sql);	
			String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
			sql = "UPDATE `members` SET `address`='"+ address +"' WHERE `memberID`='"+session.getAttribute("memberID")+"'";
			con.createStatement().execute(sql);	
			out.print("<script>alert('更新成功!'); self.location=document.referrer;</script>");
		}
		else{
			out.print("<script>alert('更新失敗!');  self.location=document.referrer; </script>");
		}

	}
	else{
		response.sendRedirect("signup.jsp");
	}
%>
