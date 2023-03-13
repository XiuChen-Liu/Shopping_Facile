<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- Step 0: import library -->
<%@ page import = "java.sql.*" %> 
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body> 

    <form name="DD" method="post" action="signup.jsp"><!--傳訊息，要求顯示提示框-->
      <input type="hidden" name="hi" value="1">
    </form>

<%  	
request.setCharacterEncoding("utf-8");
String name=request.getParameter("memberName");
String memberPWD=request.getParameter("memberPWD");
String tel=request.getParameter("Tel");
String email=request.getParameter("memberID");
String address=request.getParameter("address");

try{
//Step 1: 載入資料庫驅動程式 
  Class.forName("com.mysql.jdbc.Driver");	  
	//使用JDBC去連結MySQL，所以該行語法的意思，就是要告訴電腦我要使用JDBC
try{
//Step 2: 建立連線 
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con=DriverManager.getConnection(url,"root","1234"); 
    

      if(con.isClosed()) 
        out.println("連線建立失敗");
      else
      {
        con.createStatement().execute("use dbfinal");/*選擇資料庫*/  /*執行指令*/
		if (request.getParameter("memberPWD").equals("'or1=1#"))
		{
			out.print("<script>alert('此密碼有問題，請重新輸入!');  self.location=document.referrer; </script>");
		}
        else if(request.getParameter("memberID")!=null && (email.indexOf("@")!=-1 ))
        {    
          String sql = "SELECT * FROM members WHERE memberID='" +email+ "'"  ; 
          ResultSet paperrs =con.createStatement().executeQuery(sql);
          if(paperrs.next())
          {
          /*out.print("此email已被註冊過"); */
            out.print("<script>alert('此email已被註冊過');  self.location=document.referrer; </script>"); /*跳出提示並導向*/
             /*session.setAttribute("email",request.getParameter("email"));
             response.sendRedirect("Signin.jsp") ;*/
          }
          else
          {
            sql="INSERT members(memberID,memberPWD,memberName,Tel,address)"+"VALUES ('"+email+"','"+memberPWD+"','"+name+"','"+tel+"','"+address+"')";
			boolean no= con.createStatement().execute(sql); //執行成功傳回false
			//int no=con.createStatement().executeUpdate(sql); //可回傳異動數
			if(!no)
			{
				%>
				
				<script>alert('註冊成功！');document.location ='signin.jsp'</script>
				<%
				
			}
			
			else
			{
				out.print("<script>alert('發生錯誤'); self.location=document.referrer; </script>"); 
			}
            
          }
//Step 6: 關閉連線
           con.close();
        }
        else
        {
            out.print("<script>alert('發生錯誤'); self.location=document.referrer; </script>");  
        }
      }      
    }       
    catch (SQLException sExec) 
    {
      out.println("SQL錯誤!" + sExec.toString());
    }

    }       
    catch (ClassNotFoundException err) 
    {
      out.println("class錯誤" + err.toString());
    }    
%>      
 </body>
</html>