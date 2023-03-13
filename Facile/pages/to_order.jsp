<%@page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@page pageEncoding="UTF-8"%>
<%
	try
	{
		request.setCharacterEncoding("UTF-8");
		String memberID = (String)session.getAttribute("memberID");
		String ordername= request.getParameter("name1");
		String tel= request.getParameter("tele_num");
		String addr= request.getParameter("addr");
		String pay_way=request.getParameter("pay");	
		String buy_num=request.getParameter("buy_num");
		java.sql.Date buy_date=new java.sql.Date(System.currentTimeMillis());
		
		sql="INSERT orders (memberID,ordername , tel ,  addr , pay_way  ,timer) ";
		sql+="VALUES ('" +memberID+ "', ";
		sql+="'" +ordername+ "',";
		sql+="'"+ tel +"', ";
		sql+="'"+ addr +"', ";
		sql+="'"+ pay_way +"', ";		
		sql+="'"+ buy_date +"' ) ";
		con.createStatement().execute(sql);
		
		String sql2 = "SELECT order_Id FROM orders";
		ResultSet rs2=con.createStatement().executeQuery(sql2);
		rs2.last();
		int num=rs2.getRow();
		
		String sql3 = "SELECT * FROM car WHERE(email='"+memberID+"')";
		ResultSet rs3=con.createStatement().executeQuery(sql3);
		while(rs3.next())
		{
			int new_stock=0;
			
			String sql4 = "INSERT order_detail(order_Id,memberID,Product_Id,num,size) VALUES('"+num+"','"+memberID+"','"+rs3.getString("pid")+"','"+rs3.getString("number")+"','"+rs3.getString("size")+"')";
			con.createStatement().execute(sql4);
			String sql8 = "SELECT * FROM order_detail";
			ResultSet rs8 = con.createStatement().executeQuery(sql8);
			rs8.next();
			
			String sql5 = "SELECT * FROM product WHERE product_ID='"+rs8.getString(3)+"'";
			ResultSet rs5 = con.createStatement().executeQuery(sql5);
			while(rs5.next())
			{			
				
				new_stock=rs5.getInt(5)-rs3.getInt(4);
		
			}
			String sql6 ="update product SET stock='"+new_stock+"' where product_ID='"+rs8.getString(3)+"'";
			con.createStatement().execute(sql6);
			
			String sql7 = "DELETE FROM car WHERE (email='"+memberID+"')";
			con.createStatement().execute(sql7);
			
		}
		con.close();
		
		out.print("<script>");
		out.print("alert('結帳成功')");
		out.print("</script>");
		response.setHeader("refresh","0;URL=../pages/index.jsp");
	}
	catch(SQLException s)
	{
		out.print(s.toString());
	}
%>