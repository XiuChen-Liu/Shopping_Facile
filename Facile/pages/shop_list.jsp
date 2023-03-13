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
		<title>商品頁</title>
		<style>
			@import"../assets/css/header.css";
			@import"../assets/css/ad.css";
			@import"../assets/css/newarr.css";
			@import"../assets/css/coupon.css";
			@import"../assets/css/footer.css";
			@import"../assets/css/contactus.css";
			@import"../assets/css/shop_page.css";
			@import"../assets/css/list.css";
			@import"../assets/css/signin.css";
		</style>
	</head>
	<body>
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
								<a class="nav-link dropdown-toggle" href="#products" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">產品</a>
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
		<section>
			<br>
			<br>
			<br>
			<br>
			<br>
			<%
				String classify=request.getParameter("classify");
				String tshirt=new String("tshirt");
				String lshirt=new String("lshirt");
				String shorts=new String("shorts");
				String trousers=new String("trousers");
				String jackets=new String("jackets");
				String others=new String("others");

			if(classify.equals(tshirt))
			{
				String sql2 = "SELECT * FROM product WHERE classify='"+classify+"'";
				ResultSet rs2 = con.createStatement().executeQuery(sql2);
			%>
					<h1 align="center">T-shirt</h1>
         			<hr style="border-width:2px;width:900px;">
           			<div style='width:3px; background: #FFE076;float:left;height:1450px;'></div>
           	<%
				while(rs2.next())
				{%>
					<div id="product_right">
						<div class="product_card">
							<img src="../assets/img/products/male/<%out.print(rs2.getString("img"));%>.jpg"  align="center" >
							<div class="product_card_text"><%out.print(rs2.getString("product_Name"));%><br></div><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary buttonbg font1" id="button" style="margin-left: auto;margin-right: auto;display: block;" 
								onclick="location.href='shop_product.jsp?page=<%out.print(rs2.getString("product_ID"));%>'">詳細資訊
							</button><br>
						</div>
					</div>
				<%}%>
			<%}
			else if(classify.equals(lshirt))
			{
				String sql2 = "SELECT * FROM product WHERE classify='"+classify+"'";
				ResultSet rs2 = con.createStatement().executeQuery(sql2);
			%>
					<h1 align="center">T-shirt</h1>
         			<hr style="border-width:2px;width:900px;">
           			<div style='width:3px; background: #FFE076;float:left;height:1450px;'></div>
           	<%
				while(rs2.next())
				{%>
					<div id="product_right">
						<div class="product_card">
							<img src="../assets/img/products/male/<%out.print(rs2.getString("img"));%>.jpg"  align="center" >
							<div class="product_card_text"><%out.print(rs2.getString("product_Name"));%><br></div><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary buttonbg font1" id="button" style="margin-left: auto;margin-right: auto;display: block;" 
								onclick="location.href='shop_product.jsp?page=<%out.print(rs2.getString("product_ID"));%>'">詳細資訊
							</button><br>
						</div>
					</div>
				<%}%>
			<%}
			else if(classify.equals(shorts))
			{
				String sql2 = "SELECT * FROM product WHERE classify='"+classify+"'";
				ResultSet rs2 = con.createStatement().executeQuery(sql2);
			%>
					<h1 align="center">T-shirt</h1>
         			<hr style="border-width:2px;width:900px;">
           			<div style='width:3px; background: #FFE076;float:left;height:1450px;'></div>
           	<%
				while(rs2.next())
				{%>
					<div id="product_right">
						<div class="product_card">
							<img src="../assets/img/products/male/<%out.print(rs2.getString("img"));%>.jpg"  align="center" >
							<div class="product_card_text"><%out.print(rs2.getString("product_Name"));%><br></div><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary buttonbg font1" id="button" style="margin-left: auto;margin-right: auto;display: block;" 
								onclick="location.href='shop_product.jsp?page=<%out.print(rs2.getString("product_ID"));%>'">詳細資訊
							</button><br>
						</div>
					</div>
				<%}%>
			<%}
			else if(classify.equals(trousers))
			{
				String sql2 = "SELECT * FROM product WHERE classify='"+classify+"'";
				ResultSet rs2 = con.createStatement().executeQuery(sql2);
			%>
					<h1 align="center">T-shirt</h1>
         			<hr style="border-width:2px;width:900px;">
           			<div style='width:3px; background: #FFE076;float:left;height:1450px;'></div>
           	<%
				while(rs2.next())
				{%>
					<div id="product_right">
						<div class="product_card">
							<img src="../assets/img/products/male/<%out.print(rs2.getString("img"));%>.jpg"  align="center" >
							<div class="product_card_text"><%out.print(rs2.getString("product_Name"));%><br></div><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary buttonbg font1" id="button" style="margin-left: auto;margin-right: auto;display: block;" 
								onclick="location.href='shop_product.jsp?page=<%out.print(rs2.getString("product_ID"));%>'">詳細資訊
							</button><br>
						</div>
					</div>
				<%}%>
			<%}
			else if(classify.equals(jackets))
			{
				String sql2 = "SELECT * FROM product WHERE classify='"+classify+"'";
				ResultSet rs2 = con.createStatement().executeQuery(sql2);
			%>
					<h1 align="center">T-shirt</h1>
         			<hr style="border-width:2px;width:900px;">
           			<div style='width:3px; background: #FFE076;float:left;height:1450px;'></div>
           	<%
				while(rs2.next())
				{%>
					<div id="product_right">
						<div class="product_card">
							<img src="../assets/img/products/male/<%out.print(rs2.getString("img"));%>.jpg"  align="center" >
							<div class="product_card_text"><%out.print(rs2.getString("product_Name"));%><br></div><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary buttonbg font1" id="button" style="margin-left: auto;margin-right: auto;display: block;" 
								onclick="location.href='shop_product.jsp?page=<%out.print(rs2.getString("product_ID"));%>'">詳細資訊
							</button><br>
						</div>
					</div>
				<%}%>
			<%}
			else if(classify.equals(others))
			{
				String sql2 = "SELECT * FROM product WHERE classify='"+classify+"'";
				ResultSet rs2 = con.createStatement().executeQuery(sql2);
			%>
					<h1 align="center">T-shirt</h1>
         			<hr style="border-width:2px;width:900px;">
           			<div style='width:3px; background: #FFE076;float:left;height:1450px;'></div>
           	<%
				while(rs2.next())
				{%>
					<div id="product_right">
						<div class="product_card">
							<img src="../assets/img/products/male/<%out.print(rs2.getString("img"));%>.jpg"  align="center" >
							<div class="product_card_text"><%out.print(rs2.getString("product_Name"));%><br></div><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-primary buttonbg font1" id="button" style="margin-left: auto;margin-right: auto;display: block;" 
								onclick="location.href='shop_product.jsp?page=<%out.print(rs2.getString("product_ID"));%>'">詳細資訊
							</button><br>
						</div>
					</div>
				<%}%>
			<%}
			%> 
			<div style="clear:both;"></div>
			<hr>
		</section>
		<footer class="footerbg">
			<div class="footertext">
				Copyright © 2020 by Facile Cloth Selling CORP. <br>
				Tel:&nbsp;+886-912345678 | Email:&nbsp;Facile@gmail.com
			</div>
		</footer>
	</body>
</html>