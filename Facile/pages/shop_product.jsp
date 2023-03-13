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
				String pid = request.getParameter("page");
				session.setAttribute("new_pid",pid);
				String sql3="SELECT * FROM product WHERE product_ID = '"+pid+"'";
				ResultSet rs3 = con.createStatement().executeQuery(sql3);
				while(rs3.next())
				{
				%>
				<h1 align="center"><%out.print(rs3.getString(2));%></h1>
				<hr style="border-width:2px;width:450px;">
				<div class="col-xl-5" style="margin-right: auto;margin-left: auto; border-style:solid;border-color:gray;">
					<div style="margin:10px;text-align: center;" >
						<div class="column"><img src="../assets/img/products/male/<%out.print(rs3.getString(7));%>.jpg"
						align="left" width="200" height="230" float="left" ></div>
						<form method="post" action="add-car.jsp">
							<div class="form-group">
								<label class="font2">&nbsp;&nbsp;規格：</label>
								<input type="radio" name="size" value="S">S</label>
								<input type="radio" name="size" value="M">M</label>
								<input type="radio" name="size" value="L">L</label>
								<input type="radio" name="size" value="XL">XL</label>
							</div>
							<div class="form-group">
								<label class="font2">&nbsp;&nbsp;庫存:<%out.print(rs3.getString(5));%>
								</label>
							</div>
							<div class="form-group">
								<label class="font2">&nbsp;&nbsp;數量:
									<select name="count" id="cars">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</label>
							</div>
							<div class="form-group">
								<label class="font2">&nbsp;&nbsp;價格:NT<%out.print(rs3.getString(4));%></label>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary buttonbg font1" id="button" style="margin-left: auto;margin-right: auto;display: block;">立即購買</button>
							</div>
						</form>
					</div>
					<%}%>
				</section><br><br>
				<!--評分&評論-->
				<div class="container">
					<div class="col-xl-12 productmargin">
						<h1 style="text-align: center;font-family: 微軟正黑體;font-weight: bolder;">商品評論</h1>
						<hr style="border-width: 2px;background-color: #E0E0E0;">
						<div class="col-xl-12">
							<h3 style="font-family: 微軟正黑體;">買家評論</h3>
							<%
							String sql4="SELECT * FROM board WHERE pid='"+(String)session.getAttribute("new_pid")+"'";
							ResultSet rs4=con.createStatement().executeQuery(sql4);
							rs4.last();//算出共幾筆留言
							int total_content=rs4.getRow();
							out.println("共"+total_content+"筆留言<p>");
								String sql5="SELECT * FROM board WHERE pid='"+(String)session.getAttribute("new_pid")+"'ORDER BY board.GBNO DESC";
								ResultSet rs5=con.createStatement().executeQuery(sql5);
								while(rs5.next())
								{
								%>
								<div class="row" style="margin-top: 30px;">
									<div class="col-xl-2">
										<img class="userpic img-fluid" src="../assets/img/comment/humanicon.jpg" align="left">
									</div>
									<div class="col-xl-6">
										<p><br>
											<span style="color: gray;"><%out.print(rs5.getString(2));%> &nbsp;</span>
											<%
											String name="0";
											name=rs5.getString(5);
											if(name.equals("1")){%>
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<%}%>
											<%if(name.equals("2")){%>
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<%}%>
											<%if(name.equals("3")){%>
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<%}%>
											<%if(name.equals("4")){%>
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<%}%>
											<%if(name.equals("5")){%>
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<img class="ratingimg" src="../assets/img/comment/star.png">
											<%}%>
											<br>
											<%out.print(rs5.getString(3));%><br>
											<%out.print(rs5.getString(4));%>
										</p>
									</div>
									<div class="col-xl-4"></div>
								</div>
								<%}%>
							</div>
							
							<form style="margin-top: 20px;" id="checkboxGroup" method="post" action="board.jsp">
								<div class="col-xl-12"style="margin-top: 200px;">
									<h3 style="font-family: 微軟正黑體;">您的評價</h3>
									<!--一顆星-->
									<input type="radio" name="stars" value="1">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<!--二顆星-->
									<input type="radio" name="stars" value="2">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<!--三顆星-->
									<input type="radio" name="stars" value="3">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<!--四顆星-->
									<input type="radio" name="stars" value="4">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<!--五顆星-->
									<input type="radio" name="stars" value="5">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<img class="ratingimg" src="../assets/img/comment/star.png">
									<div class="form-group" style="margin-top: 20px;">
										<textarea class="form-control" rows="5" placeholder="來評價吧!" name="content"></textarea>
									</div>
									<button id="button11" type="submit" class="btn btn-primary ratingbutton center">送出</button>
								</div>
							</form>
						</div>
					</div>
					
					<!--Footer-->
					<footer class="footerbg" style="margin-top: 100px;">
						<div class="footertext">
							Copyright © 2020 by Facile Cloth Selling CORP. <br>
							Tel:&nbsp;+886-912345678 | Email:&nbsp;Facile@gmail.com
						</div>
					</footer>
				</body>
			</html>