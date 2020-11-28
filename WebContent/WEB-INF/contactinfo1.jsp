<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="../css/mystyle.css"> 
<style type="text/css">
 body{
 background-color: black;
 }
 .container{
 	margin-top:50px;
 	padding : 50px;
 	width : 70%;
 	border : 1px solid;
 	background-color: #b3b3ff;
 }
 </style>
</head>


<body>


		
		<div class="container">
			<a href="#"><b><%= request.getSession().getAttribute("name") %></b></a>
		<form action="ContactInfo" class="form.bg-secondary">
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					class="form-control" id="address" name="address"
					placeholder="Address">
			</div>
			<div class="form-group">
				<label for="city">City:</label> <input type="text"
					class="form-control" id="city" name="city" placeholder="City">

			</div>
			<div class="form-group">
				<label for="state">State:</label> <input type="text"
					class="form-control" id="state" name="state" placeholder="State">

			</div>
			 <div class="form-group">
					<label for="country">Select Country:</label>
					
					<select id="country" name="country">
					  <option value="usa" href ="#">USA</option>
					  <option value="india" href ="#">India</option>
					  <option value="germany" href ="#">Germany</option>
					  <option value="london" href ="#">London</option>
					  <option value="canada" href ="#">Canada</option>
					  <option value="newzeland" href ="#">New Zeland</option>
					</select>
  			</div> 
  			
			<div class="form-group">
				<label for="phoneno">Phone NO:</label> <input type="text"
					class="form-control" id="phoneno" name="phoneno"
					placeholder="Phone No">

			</div>
			

			<button type="submit" class="btn btn-success">Submit</button>
		</form>
	</div>

</body>
</html>