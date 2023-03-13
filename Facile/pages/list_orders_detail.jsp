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
    <title>詳細資訊</title>
    <style>
    @import"../assets/css/header.css";
    @import"../assets/css/ad.css";
    @import"../assets/css/newarr.css";
    @import"../assets/css/coupon.css";
    @import"../assets/css/footer.css";
    @import"../assets/css/signin.css";
    @import"../assets/css/member.css";
    @import"../assets/css/about.css";
    @import"../assets/css/list1.css";
    </style>
  </head>
  <body>
    <header>
      <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
          <a class="nav-link" href="logout.jsp"><img src="../assets/img/logo/logo.png" alt="logo"></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="header">
            <ul class="navbar-nav font1">
              <li class="nav-item">
                <a class="nav-link" href="logout.jsp">登出</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </header>
    <!--檢視清單-->
    <div class="container" style="font-family: 微軟正黑體;margin-top: 200px;">
      <h1 class="membertitle" >詳細資訊
        <a href="list.jsp" style="margin-left:20px;"><font style="font-size: 15px;  color:gray;">回上一頁</font></a>
      </h1>
      <hr style="border-width: 3px;border-color: #E0E0E0;">
      <div class="col-xl-12">
        <div class="row">
          <table class="text-center col-xl-12" border="1" >
            <tr>
				<th class="tdWidth"><h4>產品編號</h4></th>
				<th class="tdWidth"><h4>名稱</h4></th>
				<th class="tdWidth"><h4>單價</h4></th>
				<th class="tdWidth"><h4>數量</h4></th>
				<th class="tdWidth"><h4>尺寸</h4></th>
			</tr>
            <%
				String memberID = request.getParameter("memberID");
				String order_ID = request.getParameter("order_ID");
									
				String sql2 = "select * from order_detail, product, orders where (order_detail.memberID = '"+memberID+"') AND (order_detail.Product_Id = product.product_ID) and (orders.order_ID=order_detail.order_ID) and (orders.order_ID='"+order_ID+"') ";
				ResultSet rs2 = con.createStatement().executeQuery(sql2);
				
				while(rs2.next()){
			%>
			<tr>	
				<td><%=rs2.getString("product.product_ID")%></td>
				<td><%=rs2.getString("product_Name")%></td>
				<td>NT<%=rs2.getString("price")%></td>
				<td><%=rs2.getString("num")%></td>
				<td><%=rs2.getString("order_detail.size")%></td>
			</tr>
			<%}%>
        </table>
        <br>
        <br>
        <br>
      </div>
    </div>
  </div>
  <footer class="footerbg" style="margin-top:200px;">
    <div class="footertext">
      Copyright © 2020 by Facile Cloth Selling CORP. <br>
      Tel:&nbsp;+886-912345678 | Email:&nbsp;Facile@gmail.com
    </div>
  </footer>
</body>
</html>