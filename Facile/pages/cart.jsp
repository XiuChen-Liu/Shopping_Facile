<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity=
"sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity=
"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity=
"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity=
"sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<title>購物車</title>
		<style>
			@import"../assets/css/header.css";
			@import"../assets/css/ad.css";
			@import"../assets/css/newarr.css";
			@import"../assets/css/coupon.css";
			@import"../assets/css/footer.css";
			@import"../assets/css/signin.css";
			@import"../assets/css/member.css";
			@import"../assets/css/cart.css";

		</style>
	</head>
	<body>
		<header>
			<div>
				<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
					<a class="navbar-brand" href="index.jsp"><img src="../assets/img/logo/logo.png" alt="logo"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls=
					"navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end" id="header">
						<ul class="navbar-nav font1">
							<li class="nav-item">
								<a class="nav-link" href="about.jsp">關於我們</a>
							</li>
							
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#products" role="button" data-toggle="dropdown" aria-haspopup=
								"true" aria-expanded="false">產品</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="shop_list.jsp?classify=tshirt">短袖</a>
									<a class="dropdown-item" href="shop_list.jsp?classify=lshirt">長袖</a>
									<a class="dropdown-item" href="shop_list.jsp?classify=shorts">短褲</a>
									<a class="dropdown-item" href="shop_list.jsp?classify=trousers">長褲</a>
									<a class="dropdown-item" href="shop_list.jsp?classify=jackets">外套</a>
									<a class="dropdown-item" href="shop_list.jsp?classify=others">配件</a>
								</div>
							</li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#membership" role="button" data-toggle="dropdown" aria-haspopup=
								"true" aria-expanded="false">會員中心
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="member.jsp">資料查詢</a>
									<a class="dropdown-item" href="record.jsp">消費紀錄</a>
								</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="cart.jsp">購物車</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="contactus.jsp">聯絡我們</a>
							</li>
							<% if(session.getAttribute("memberID")!=null){%>
							<li class="nav-item">
								<a class="nav-link" href="logout.jsp">登出</a>
							</li>
							<%}else{%>
							<li class="nav-item">
								<a class="nav-link" href="signin.jsp">登入</a>
							</li>
							<%}%>
						</ul>
					</div>
				</nav>
			</div>
		</header>
			
		<div  class="container" style="font-family: 微軟正黑體;">
			<div class="col-xl-12  margintop">
				<h1 class="title01">購物車</h1>
				<hr class="hr01">
				<table class="text-center col-xl-12" border="1">
						<tr>            
							<td class="tdWidth"><span class="cartfont">商品名稱</h3></td>
							<td class="tdWidth"><span class="cartfont">單價</span></td>
							<td class="tdWidth"><span class="cartfont">尺寸</span></td>
							<td class="tdWidth"><span class="cartfont">數量</span></td>
							<td class="tdWidth"><span class="cartfont">總價</span></td>
							<td class="tdWidth"><span class="cartfont">修改</span></td>
						</tr>
						<%
						if(session.getAttribute("memberID")!=null)
						{
							String email=session.getAttribute("memberID").toString();
							sql="select * from car where email='"+email+"'";
							ResultSet rs=con.createStatement().executeQuery(sql);
							int total=0;
								
							while(rs.next())
							{	
								String size=rs.getString("size");
								String pid=rs.getString("pid");
								int number=rs.getInt("number");
								String sqlProduct="select * from product where product_ID='"+pid+"'";
								ResultSet rsProduct=con.createStatement().executeQuery(sqlProduct);
								rsProduct.next();
								
								String p_name= rsProduct.getString("product_Name");
								int p_price= rsProduct.getInt("price");
								total += number*p_price;
								int p_num= rsProduct.getInt("stock");
						%>
						<tr>
							<td><span class="cartfont"><%=p_name%></span></td>
							<td><span class="cartfont">NT<%=p_price%></span></td>
							<td><span class="cartfont"><%out.print(size);%></span></td>
							<td><%out.print(number);%></td>
							<td><span class="cartfont">NT<%=(number*p_price)%></span></td>
							<form method="get" action="delete-car.jsp">
								<input type="hidden" name="pid" value="<%=pid%>">
								<td><button class="button">刪除</button></td>
							</form>
						</tr>
						<%}%>
						<tr>
							 
							<td colspan="6"><span class="cartfont">總計&nbsp;:&nbsp;NT<%=total%></span></td>
						</tr>
				</table>
				<div style="margin-top: 50px;">
				  <button class="button3 center"  onclick="javascript:location.href='buy.jsp'"> <span class="font1">購買</span></button>
				</div>
			</div>      
		</div>	
		
		<%}else{%>
			<script>alert('請先登入會員喔！');document.location ='signin.jsp'</script>	
		<%}%>
		
		
		
		<footer class="footerbg" style="margin-top:300px;">
			<div class="footertext">
				Copyright © 2020 by Facile Cloth Selling CORP. <br>
				Tel:&nbsp;+886-912345678 | Email:&nbsp;Facile@gmail.com
			</div>
		</footer>
	</body>
</html>