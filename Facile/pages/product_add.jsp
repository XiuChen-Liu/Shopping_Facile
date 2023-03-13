<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<html>
  <head>
    <title>增加產品</title>
  </head>
  <body>
    <%
    try {
    //Step 1: 載入資料庫驅動程式
    Class.forName("com.mysql.jdbc.Driver");
    try {
    //Step 2: 建立連線
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    String sql="dbfinal";
    Connection con=DriverManager.getConnection(url,"root","1234");
    if(con.isClosed())
    out.println("連線建立失敗");
    else {
    //Step 3: 選擇資料庫
    sql="use dbfinal";
    con.createStatement().execute(sql);
    //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1")編碼
    String new_product_ID=new String(request.getParameter("product_ID").getBytes("ISO-8859-1"),"utf-8");
    String new_product_Name=new String(request.getParameter("product_Name").getBytes("ISO-8859-1"),"utf-8");
    String new_classify=new String(request.getParameter("classify").getBytes("ISO-8859-1"),"utf-8");
    String new_price=new String(request.getParameter("price").getBytes("ISO-8859-1"),"utf-8");
    String new_stock=new String(request.getParameter("stock").getBytes("ISO-8859-1"),"utf-8");
    String new_unit=new String(request.getParameter("unit").getBytes("ISO-8859-1"),"utf-8");
    String new_img=new String(request.getParameter("img").getBytes("ISO-8859-1"),"utf-8");
    
    //Step 4: 執行 SQL 指令
    sql="insert into product(product_ID, product_Name,classify,price ,stock, unit,img)";
    sql+="value('" + new_product_ID + "', ";
    sql+="'" + new_product_Name + "', ";
    sql+="'"+new_classify+"', ";
    sql+="'"+new_price+"', ";
    sql+="'"+new_stock+"', ";
    sql+="'"+new_unit+"', ";
    sql+="'"+new_img+"') ";
    
    //out.println(sql);
    con.createStatement().execute(sql);
    //Step 6: 關閉連線
    con.close();
    //Step 5: 顯示結果
    //直接顯示最新的資料
    //out.print("<script>alert('已收到您的寶貴意見!謝謝:)');  self.location=document.referrer; </script>"); /*跳出提示並導向*/
    response.sendRedirect("list.jsp");
    }
    }
    catch (SQLException sExec) {
    out.println("SQL錯誤"+sExec.toString());
    }
    }
    catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
    }
    %>
  </body>
</html>