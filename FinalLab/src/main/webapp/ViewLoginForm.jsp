<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Log in Form </title>
<style>
input:valid {
	border-left: 6px solid green;
	
}
input:invalid {
	border-left: 6px solid red;
}
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top:20px;
}
</style>
</head>
<body>

<ul>

<c:if test = "${user.error[2]}">
	<div class="w3-panel" style="width:50%;height:50px;background-color:lightcoral;text-align:center;padding:2px;transform:translate(50%,2%);"> 
		<p class="w3-center">Sorry, entered username does not exist! </p>
 	</div>
</c:if>
<c:if test = "${user.error[6]}">
	<div class="w3-panel" style="width:600px;height:50px;background-color:lightcoral;text-align:center;padding:2px;transform:translate(50%,2%);"> 
		<p class="w3-center">Sorry, incorrect password! </p>
	</div>
</c:if>
</ul>




<form action="LoginController" method="POST" class="w3-panel w3-light-grey w3-text-deep-purple w3-margin" style="width:50%;height:550px;transform:translate(50%,2%);box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" >
	<img src="imgs/logo.png" alt="Logo" style="width:90px;"><br/> 
	<h2 class="w3-center w3-text-pink" style="font-weight:bold;">Log in </h2>
	<div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user-circle-o">
	</i></div>
		<div class="w3-rest">      
		    <input class="w3-round w3-input w3-white" type="text" name="user" placeholder="Username" value="${user.user}" autocomplete="username" required pattern="^[a-zA-Z\d]{3,}$" title="Invalid format of username">
		</div>
	</div>
	<br/><br/>
    <div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock">
	</i></div>
		<div class="w3-rest">      
    	<input class="w3-round w3-input w3-white" type="password" name="pwd1" placeholder="Password"  value="${user.pwd1}" required required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" autocomplete="new-password" title="At least one uppercase, one lowercase and a number (min length = 8)"><br/><br/>
    </div>
	</div><br/>
    <button class="w3-button w3-block w3-round-large w3-pink w3-ripple w3-padding" type="submit" name="submit" value="Submit">Submit</button><br/>
	<label for="account" class="w3-text-black"> Don't have an account?
		<a class="menu w3-text-deep-purple" style="font-weight:bold;" id="RegisterController" href=# > Sign up </a>
	</label><br/><br/>
	
</form>
