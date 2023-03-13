<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<title>消費紀錄</title>
		<style>
			@import"../assets/css/header.css";
			@import"../assets/css/ad.css";
			@import"../assets/css/newarr.css";
			@import"../assets/css/coupon.css";
			@import"../assets/css/footer.css";
			@import"../assets/css/signin.css";
			@import"../assets/css/member.css";
		</style>
	</head>
	<body>
		<% if(session.getAttribute("memberID")!=null){%>
		<header>
			<div>
				<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
					<a class="navbar-brand" href="index.jsp"><img src="../assets/img/logo/logo.png" alt="logo"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end" id="header">
						<ul class="navbar-nav font1">
							<li class="nav-item">
								<a class="nav-link" href="about.jsp">關於我們</a>
							</li>
							
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#products" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">產品
								</a>
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
								<a class="nav-link dropdown-toggle" href="#membership" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">會員中心
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
							<li class="nav-item">
								<a class="nav-link" href="logout.jsp">登出</a>
							</li>
						</ul>
					</div>
				</nav>
			</div>
		</header>
		<section>
			<div class="col-xl-12">
				<div class="row margintop">
					<div class="col-xl-3">
						<div class="list-group">
							<a class="list-group-item list-group-item-action barfont font1" href="member.jsp">會員資料</a>
							<a  class="list-group-item list-group-item-action active barfont font1" href="record.jsp" >消費紀錄</a>
						</div>
					</div>
					<div class="col-xl-9">
						<h1 class="membertitle">消費紀錄</h1>
						<hr style="border-width: 3px;border-color: #E0E0E0;">
						<div class="container" style="font-family: 微軟正黑體;">
						<div class="row">
							<table class="text-center col-xl-12" border="1" >
								<tr>
									<th class="tdWidth"><h4>付款人名字</h4></th>
									<th class="tdWidth"><h4>付款方式</h4></th>
									<th class="tdWidth"><h4>總價(含運費60)</h4></th>
									<th class="tdWidth"><h4>時間</h4></th>
									<th class="tdWidth"><h4>詳細訂單</h4></th>
								</tr>	
						<%
							String memberID=(String)session.getAttribute("memberID");
							
							sql = "SELECT * FROM orders WHERE memberID='"+memberID+"'";
							ResultSet rs = con.createStatement().executeQuery(sql);
							while(rs.next()){
								String order_Id=rs.getString(1);
								int total = 0;
								String sql2 = "select * from order_detail, product, orders where (order_detail.memberID = '"+memberID+"') AND (order_detail.Product_Id = product.Product_ID) and (orders.order_Id=order_detail.order_Id) and (orders.order_Id='"+rs.getString(1)+"')";
								ResultSet rs2 = con.createStatement().executeQuery(sql2);
								while(rs2.next())
								{
									
									total += (rs2.getInt("num") * rs2.getInt("price"));
								}
						%>
						<form action="order_detail.jsp" method="post" accept-charset="utf-8">
						<tr>
							<input type="hidden" name="order_ID" value="<%=rs.getString(1)%>">
							<td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(6)%></td>
							<td><input type="hidden" name="total_price" value="<%=total+60%>">NT<%=total+60%></td>
							<td><%=rs.getString(7)%></td>
                            <td><input type="submit" value="查詢"></td>
                        </tr>
						</form>
							<%}%>
							</table>
							<br>
							<br>
							<br>
							</div>
						</div>
					</div>
					<br>
				</div>
			</div>
		</section>
	<footer class="footerbg" style="margin-top:350px;">
		<div class="footertext">
			Copyright © 2020 by Facile Cloth Selling CORP. <br>
			Tel:&nbsp;+886-912345678 | Email:&nbsp;Facile@gmail.com
		</div>
	</footer>
		<%}
		else{%>
		<script>alert('請先登入會員唷~!'); self.location=document.referrer;;</script>
		<%}%>
	</body>
</html>		
	
		