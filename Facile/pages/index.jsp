<!DOCTYPE html>
<%@page import="java.sql.*, java.util.*"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<title>Facile</title>
		<style>
			@import"../assets/css/header.css";
			@import"../assets/css/ad.css";
			@import"../assets/css/newarr.css";
			@import"../assets/css/coupon.css";
			@import"../assets/css/footer.css";
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
		<section id="ad">
			<div id="carouselExampleIndicators" class="carousel slide admargin" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100 size1" src="../assets/img/ad/ad1.jpg" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100 size1" src="../assets/img/ad/ad2.jpg" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100 size1" src="../assets/img/ad/ad3.jpg" alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</section>
		<%
			/*隨機1*/
			String sql8="SELECT * FROM `randad1`";
        	ResultSet rs8=con.createStatement().executeQuery(sql8);
        	rs8.last();
        	int n1 = rs8.getRow(); 
        	Random ran1=new Random();
        	int current_adid1=ran1.nextInt(n1)+1;
        	sql8="SELECT * FROM `randad1` WHERE `adid`= " + current_adid1;
            rs8=con.createStatement().executeQuery(sql8);
            rs8.next();

            /*隨機2*/
            String sql9="SELECT * FROM `randad2`";
        	ResultSet rs9=con.createStatement().executeQuery(sql9);
        	rs9.last();
        	int n2 = rs9.getRow(); 
        	Random ran2=new Random();
        	int current_adid2=ran2.nextInt(n2)+1;
        	sql9="SELECT * FROM `randad2` WHERE `adid`= " + current_adid2;
            rs9=con.createStatement().executeQuery(sql9);
            rs9.next();

            /*隨機3*/
            String sql10="SELECT * FROM `randad3`";
        	ResultSet rs10=con.createStatement().executeQuery(sql10);
        	rs10.last();
        	int n3 = rs10.getRow(); 
        	Random ran3=new Random();
        	int current_adid3=ran3.nextInt(n3)+1;
        	sql10="SELECT * FROM `randad3` WHERE `adid`= " + current_adid3;
            rs10=con.createStatement().executeQuery(sql10);
            rs10.next();
		%>
		<section id="new-arrival">
			<div class="newtitle">New Arrival</div>
			<div class="card-group">
				<div class="card">
					<img class="card-img-top pictrans" src="../assets/img/newarr/<%=rs8.getString(2)%>.jpg" alt="New Arrival 01">
					<div class="card-body">
						<h5 class="card-title newfont1"><%=rs8.getString(3)%></h5>
						<p class="card-text newfont2"><%=rs8.getString(4)%></p>
					</div>
					
				</div>
				<div class="card">
					<img class="card-img-top pictrans" src="../assets/img/newarr/<%=rs9.getString(2)%>.jpg" alt="New Arrival 02">
					<div class="card-body">
						<h5 class="card-title newfont1"><%=rs9.getString(3)%></h5>
						<p class="card-text newfont2"><%=rs9.getString(4)%></p>
					</div>
					
				</div>
				<div class="card">
					<img class="card-img-top pictrans" src="../assets/img/newarr/<%=rs10.getString(2)%>.jpg" alt="New Arrival 03">
					<div class="card-body">
						<h5 class="card-title newfont1"><%=rs10.getString(3)%></h5>
						<p class="card-text newfont2"><%=rs10.getString(4)%></p>
					</div>
				</div>
			</div><br><br>
		</section>
		<section>
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<img class="img-fluid anmi1 coupon-img" src="../assets/img/coupon/coupon.jpg">
					</div>
				</section><br><br>
				<footer class="footerbg">
					<div class="footertext">
						<%
							sql="select count from count";	
							ResultSet rs=con.createStatement().executeQuery(sql);	
							int x=0;
							while(rs.next())
							{
								x=rs.getInt("count");	
							}
							if(session.isNew())
							{
								x++;
							}
							sql="UPDATE count Set count="+x;
							con.createStatement().execute(sql);
						%>
						<span class="footerfont">您是第<%=x%>位訪客</span><br>
						Copyright © 2020 by Facile Cloth Selling CORP. <br>
						Tel:&nbsp;+886-912345678 | Email:&nbsp;Facile@gmail.com
					</div>
				</footer>
			</body>
		</html>