<html>
<head><title>Enter to database</title></head>
<body>
<table>
<%@ page import="java.util.*" %>
<%@ page import="javax.sql.*;" %>
<% 

java.sql.Connection con;
java.sql.Statement s;
java.sql.ResultSet rs;
java.sql.PreparedStatement pst;

con=null;
s=null;
pst=null;
rs=null;

// Remember to change the next line with your own environment
String url= "jdbc:mysql://localhost:3306/test";
String id= "root";
String pass = "";
try{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection(url, id, pass);
}catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();
}
String sql = "select * from test.papers";
try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>

<%
while( rs.next() ){
%><tr>
<td><%= rs.getString("Name") %></td>
</tr>
<%
}
%>

<%

}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}

%>
</body>
</html>