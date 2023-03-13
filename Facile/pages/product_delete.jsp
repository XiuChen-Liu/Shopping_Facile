<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<html>
  <head>
    <title>刪除產品</title>
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
    
    String product_ID = request.getParameter("product_ID");
    
    sql = "DELETE FROM product WHERE product_ID='"+product_ID+"'";
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