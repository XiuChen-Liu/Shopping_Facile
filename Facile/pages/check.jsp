<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("memberPWD").equals("'or1=1#"))
{
	con.close();
    out.println("此密碼有問題，請重新輸入!!<a href='signin.jsp'>按此</a>重新登入"); 
}
else if(request.getParameter("memberID") !=null && request.getParameter("memberPWD") != null)
{
    sql = "SELECT * FROM `members` WHERE `memberID`='" +request.getParameter("memberID") + 
          "'  AND `memberPWD`='" + request.getParameter("memberPWD") + "'"  ; 
    ResultSet rs =con.createStatement().executeQuery(sql);
	
	if(request.getParameter("memberID").equals("Facile@gmail.com") && request.getParameter("memberPWD").equals("1234")){
		session.setAttribute("memberID",request.getParameter("memberID"));
		response.sendRedirect("list.jsp") ;
	}
    else if(rs.next()){            
        session.setAttribute("memberID",request.getParameter("memberID"));
        con.close();
        response.sendRedirect("index.jsp") ; 
    }
    else{
       con.close();
       out.println("密碼與帳號不符!!<a href='signin.jsp'>按此</a>重新登入"); 
    }
}
%>