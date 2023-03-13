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
    <title>後台管理</title>
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
    <section>
      <div class="container">
        <div class="row margintop">
          <!--檢視訂單-->
          <div class="col-xl-12">
            <div style="margin-top: 50px;">
              <h1>檢視訂單</h1>
              <hr style="border-width: 3px;border-color: #E0E0E0;">
						<div class="container" style="font-family: 微軟正黑體;">
						<div class="row">
							<table class="text-center col-xl-12" border="1" >
								<tr>
									<th class="tdWidth"><h4>會員帳號</h4></th>
									<th class="tdWidth"><h4>付款人名字</h4></th>
									<th class="tdWidth"><h4>聯絡方式</h4></th>
									<th class="tdWidth"><h4>運送地址</h4></th>
									<th class="tdWidth"><h4>付款方式</h4></th>
									<th class="tdWidth"><h4>總價(含運費60)</h4></th>
									<th class="tdWidth"><h4>時間</h4></th>
									<th class="tdWidth"><h4>詳細訂單</h4></th>
								</tr>	
								<%
									String sql20 = "SELECT * FROM orders";
									ResultSet rs20 = con.createStatement().executeQuery(sql20);
									while(rs20.next()){
										String order_Id=rs20.getString(1);
										int total = 0;
										String sql21 = "select * from order_detail, product, orders where (order_detail.memberID = orders.memberID) AND (order_detail.Product_Id = product.Product_ID) and (orders.order_Id=order_detail.order_Id) and (orders.order_Id='"+rs20.getString(1)+"')";
										ResultSet rs21 = con.createStatement().executeQuery(sql21);
										while(rs21.next())
										{
											total += (rs21.getInt("num") * rs21.getInt("price"));
										}
								%>
								<form action="list_orders_detail.jsp" method="post" accept-charset="utf-8">
								<tr>
									<input type="hidden" name="order_ID" value="<%=rs20.getString(1)%>">
									<input type="hidden" name="memberID" value="<%=rs20.getString(2)%>">
									<td><%=rs20.getString(2)%></td>
									<td><%=rs20.getString(3)%></td>
									<td><%=rs20.getString(4)%></td>
									<td><%=rs20.getString(5)%></td>
									<td><%=rs20.getString(6)%></td>
									<td>NT<%=total+60%></td>
									<td><%=rs20.getString(7)%></td>
									
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
          <div class="col-xl-12" style="margin-top: 50px;">
            <h1>會員管理</h1>
            <hr style="border-width: 3px;border-color: #E0E0E0;">
            <table class="text-center col-xl-12" border="1">
              <tr>
                <td class="tdWidth"><h3>Email</h3></td>
                <td class="tdWidth"><h3>密碼</h3></td>
                <td class="tdWidth"><h3>姓名</h3></td>
                <td class="tdWidth"><h3>電話</h3></td>
                <td class="tdWidth"><h3>地址</h3></td>
              </tr>
              <form name="members" method="post">
                <%
                sql="select * from members";
                ResultSet rs3=con.createStatement().executeQuery(sql);
                while(rs3.next())
                {
                %>
                <tr>
                  <td class="tdWidth"><%=rs3.getString(1)%></td>
                  <td class="tdWidth"><%=rs3.getString(2)%></td>
                  <td class="tdWidth"><%=rs3.getString(3)%></td>
                  <td class="tdWidth"><%=rs3.getString(4)%></td>
                  <td class="tdWidth"><%=rs3.getString(5)%></td>
                </tr>
                <%}%>
              </form>
            </table>
          </div>
          <!--庫存管理-->
          <div class="col-xl-12" style="margin-top: 50px;">
            <h1>庫存管理
              <a href="list_product_add.jsp"><font style="font-size: 15px; color:gray;">新增商品</font></a>
              <a href="list_product_delete.jsp"><font style="font-size: 15px; color:gray;">刪除商品</font></a>
            </h1>
            <hr style="border-width: 3px;border-color: #E0E0E0;">
            <form method="post" action="list_product_alter.jsp"  >
              <input type="text" required placeholder="輸入要修改的商品代碼" name="ppidd" style="width:80%;border-color: black;margin: 15px 0px;">
              <input class="padding0 searchInput" type="submit" value="送出">
            </form>
            <table class="text-center col-xl-12"  border="1" style="margin-top: 50px;">
              <tr>
                <td class="tdWidth"><h3>產品編號</h3></td>
                <td class="tdWidth"><h3>商品名稱</h3></td>
                <td class="tdWidth"><h3>價格</h3></td>
                <td class="tdWidth"><h3>庫存</h3></td>
                <td class="tdWidth"><h3>單位</h3></td>
              </tr>
              <%
              sql="select * from product";
              ResultSet rs2=con.createStatement().executeQuery(sql);
              sql="SELECT * FROM  product ORDER BY product_ID DESC LIMIT ";//LIMIT是限制傳回筆數
              //上述語法解讀如下:
              // current_page... select * from stocks order by pid desc limit
              String product_ID="0";
              while(rs2.next()){
              %>
              <tr>
                <td class="tdWidth"><%=rs2.getString(1)%></td>
                <td class="tdWidth"><%=rs2.getString(2)%></td>
                <td class="tdWidth">NT<%=rs2.getString(4)%></td>
                <td class="tdWidth"><%=rs2.getString(5)%></td>
                <td class="tdWidth"><%=rs2.getString(6)%></td>
              </tr>
              <%}%>
            </table>
            <!--增加商品-->
          </div>
        </div>
      </div>
    </section>
    <footer class="footerbg" style="margin-top: 100px;">
      <div class="footertext">
        Copyright © 2020 by Facile Cloth Selling CORP. <br>
        Tel:&nbsp;+886-912345678 | Email:&nbsp;Facile@gmail.com
      </div>
    </footer>
  </body>
</html>