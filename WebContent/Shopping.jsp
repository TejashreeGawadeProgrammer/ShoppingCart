<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page session="true" %>
 <%@page session="true" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  padding: 50px;
  margin: 30px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
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
  <a href="#" class="logo">My Shopping Cart </a>
  <div class="header-right">
  	<a href="#"><b>Hello <%= request.getSession().getAttribute("username") %>
	</b></a>
    <a class="active" href="login.jsp"><b>Login</b>&nbsp</a>
    <a href="SignoutServlet"><b>Sign Out</b></a>
  </div>
</div>
<div class="container">
	<form action="FlowerServlet" method="post">
	<h1>Shop Flowers For Birthday!!!</h1>
	 
	 <div class="row">
      <div class="col-25">
        <label for="">Flower Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="fname" placeholder="Flower Name..">
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="">Flower Color</label>
      </div>
      <div class="col-75">
        <input type="text" id="fcolor" name="fcolor" placeholder="Flower Color">
      </div>
    </div>
    
     <div class="row">
      <div class="col-25">
        <label for="">Quantity</label>
      </div>
      <div class="col-75">
        <input type="text" id="quantity" name="quantity" placeholder="Quantity..">
      </div>
    </div>
	 
	 
	  <input type="submit" value="Add To Cart....">
	</form>
 </div>

</body>
</html>