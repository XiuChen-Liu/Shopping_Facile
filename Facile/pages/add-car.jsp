<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*,  java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%
try
{
	if(session.getAttribute("memberID") != null)
	{
		String new_pid=(String)session.getAttribute("new_pid");
		String email=(String)session.getAttribute("memberID");
		int count=Integer.parseInt(request.getParameter("count"));
		String size=request.getParameter("size");
		if(count==0)
		{
			out.println("<script>alert('請選擇數量!')</script>");
			out.println("<script>window.history.back();</script>");
		}
		else if(size==null)
		{
			out.println("<script>alert('請選擇尺寸!')</script>");
			out.println("<script>window.history.back();</script>");
		}


		sql="INSERT car (pid, email, number,size) ";
		sql+="VALUES ('" + new_pid + "', ";
		sql+="'"+ email +"', ";
		sql+="'"+ count +"', ";
		sql+="'"+ size +"' ) ";

		con.createStatement().execute(sql);
		con.close();	 //執行SQL
		out.print("<script>alert('成功加入購物車！');document.location ='cart.jsp'</script>");
	}
	else
	{%>
	<script>alert('請先登入會員喔！');document.location ='signin.jsp'</script>
	<%}	
}
catch ( SQLException e)
{
	out.print(e.toString());
}
%>
</body>
</html>