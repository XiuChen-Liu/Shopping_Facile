<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8"%>
<html>
<head>
<title>聯絡我們</title>
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
           String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
           String new_phone=new String(request.getParameter("phone").getBytes("ISO-8859-1"),"utf-8");
           String new_email=new String(request.getParameter("email").getBytes("ISO-8859-1"),"utf-8");
           String new_subject=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"utf-8");
           String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"utf-8");
//Step 4: 執行 SQL 指令	
           sql="insert into contactus(name, phone ,email, subject,content)";
           sql+="value('" + new_name + "', ";
           sql+="'"+new_phone+"', ";
           sql+="'"+new_email+"', ";
           sql+="'"+new_subject+"', ";   
           sql+="'"+new_content+"')";  
//out.println(sql);
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          out.print("<script>alert('已收到您的寶貴意見!謝謝:)');  self.location=document.referrer; </script>"); /*跳出提示並導向*/ 
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