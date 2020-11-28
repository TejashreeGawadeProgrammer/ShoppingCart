<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body{
background: teal;


margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  }
.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
  margin: 40px;
}
.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
  background-color: teal;
  color: white;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: maroon;
  color: white;
}


.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
}
* {
  box-sizing: border-box;
 
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: maroon;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: threedshadow;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}


@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>
<div class="header">
  <a href="#default" class="logo">My Shopping Cart</a>
  <div class="header-right">
  <a href="#"><b>Hello <%= request.getSession().getAttribute("username") %>
	</b></a>
    <a class="active" href="login.jsp"><b>Login</b></a>
    <a href="SignoutServlet"><b>Sign Out</b></a>
  </div>
</div>
<div class="container">
 	<h1>Flowers</h1>
 	<table class="table table-striped table-hover">
 	<thead>
      <tr class="info">
        <th>Flower Name</th>
        <th>Flower Color</th>
        <th>Qyantity</th>
      </tr>
    </thead>
    <tr>
 	<%
 	try
 	{
 		//Flower flower = new Flower();
 		Class.forName("com.mysql.cj.jdbc.Driver");
 		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspShoppingCart?serverTimezone=UTC","root","1234");
 		int cnt = 0;
 		
 		PreparedStatement preparedStatement = con.prepareStatement("select * from flowers");
       /*  preparedStatement.setString(1, flower.getFname());
        preparedStatement.setString(2, flower.getFcolor());
        preparedStatement.setString(3, flower.getQuantity()); */
        
        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();
        
        while(rs.next()){
        	String fname,fcolor,quantity;
        	fname = rs.getString("fname");
        	fcolor = rs.getString("fcolor");
        	quantity = rs.getString("quantity");
        	
        	if(cnt==3){
        		out.print("<tr></tr>");
        		cnt=0;
        	} 
        	cnt++;
        %>
        <td><%=fname %></td>
        <td><%=fcolor %></td>
        <td><%=quantity %></td></tr>
        <%
        }
        
 	}
 	catch(SQLException e){
 		out.print(e);
 	}
 	
 	%>
 	</table>
</div>
</body>
</html>
