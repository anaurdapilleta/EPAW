
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Sign up Form </title>
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
<c:if test = "${user.error[1]}">
	<div class="w3-panel" style="width:600px;height:50px;background-color:lightcoral;transform:translate(50%,2%);text-align:center;padding:2px">
		<p class="w3-center"> Sorry, entered username has been already registered! </p>
	</div>
</c:if>
<c:if test = "${user.error[4]}">
	<div class="w3-panel" style="width:600px;height:50px;background-color:lightcoral;transform:translate(50%,2%);text-align:center;padding:2px">
		<p class="w3-center"> Sorry, entered mail has been already registered! </p>
	</div>
</c:if>
</ul>

<form action="RegisterController"  method="POST" class="w3-panel w3-light-grey w3-text-deep-purple w3-margin" style="width:50%;height:1100px;transform:translate(50%,2%);box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
	<img src="imgs/logo.png" alt="Logo" style="width:90px;"><br/> 
	<h2 class="w3-center w3-text-pink" style="font-weight:bold;"> Sign up </h2>
	<div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user">
	</i></div>
		<div class="w3-rest">      
		     <input class="w3-round w3-input w3-white" type="text" id="name" name="name" placeholder="Name and Surname" value="${user.name}" required pattern="^(?=.*\s)[a-zA-Z\s]{3,}$" title="write name and surname"><br/><br/>
		</div>
	</div>
	<div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user-circle-o">
	</i></div>
		<div class="w3-rest">      
		    <input class="w3-round w3-input w3-white" type="text" id="user" name="user" placeholder="Username" value="${user.user}" autocomplete="username" required pattern="^[a-zA-Z\d]{3,}$"><br/><br/>
		</div>
	</div>
	<div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-calendar">
	</i></div>
		<div class="w3-rest">      
		    <input class="w3-round w3-input w3-white" type="date" id="dbirth" name="dbirth" value="${user.dbirth}" max="2010-01-01" required><br/><br/>
		</div>
	</div> 
	<div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o">
	</i></div>
		<div class="w3-rest">      
		    <input class="w3-round w3-input w3-white" type="email" id="mail" name="mail" placeholder="Mail" value="${user.mail}" required><br/><br/>
		</div>
	</div>
	 <div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock">
	</i></div>
		<div class="w3-rest">      
		    <input class="w3-round w3-input w3-white" type="password" id="pwd1" name="pwd1" placeholder="Password" value="${user.pwd1}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" autocomplete="new-password" title="At least one uppercase, one lowercase and a number (min length = 8)"><br/><br/>
		</div>
	</div>
	<div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock">
	</i></div>
		<div class="w3-rest">      
		    <input class="w3-round w3-input w3-white" type="password" id="pwd2" name="pwd2" placeholder="Confirm Password" value="${user.pwd2}" required><br/><br/>
		</div>
	</div>
	<div class="w3-row w3-section">
		<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-venus-mars">
	</i></div>
		<div class="w3-rest">      
		    <select class="w3-round w3-input w3-white" id="gender" name="gender" >
			    <option value="N">Other</option>
			    <option value="F">F</option>
			    <option value="M">M</option>
		  	</select><br/><br/>
  		</div>
	</div>
    <input class="w3-check" type="checkbox" id="VRequest" name="VRequest" value="${user.VRequest}">
    <label for="VRequest" class="w3-text-black" >Verification Request</label><br/><br/>
    <br/><br/>
    <button class="w3-button w3-block w3-round-large w3-pink w3-ripple w3-padding" type="submit" name="sumbit" value="Submit">Submit</button><br/>
	<label for="account" class="w3-text-black"> Already have an account? 
		<a class="menu w3-text-deep-purple" style="font-weight:bold;" id="LoginController" href=# > Sign in </a>
	</label><br/><br/>
</form>
<script>

const form = document.getElementById("myform");
const user = document.getElementById("user");
const dBirth = document.getElementById("dBirth");
const email = document.getElementById("mail");
const pwd1 = document.getElementById("pwd1");
const pwd2 = document.getElementById("pwd2");

var checkPasswordValidity = function() {
	 if (pwd2.value !== pwd1.value ) {
		pwd2.setCustomValidity("Passwords must match!");
	} else {
		pwd2.setCustomValidity("");
	}
}

email.addEventListener("input", function (event) {
  if (email.validity.typeMismatch) {
    email.setCustomValidity("I am expecting an e-mail address!");
  } else {
    email.setCustomValidity("");
  }
});

pwd2.addEventListener("input", checkPasswordValidity, false);

form.addEventListener("submit", function (event) {
	checkPasswordValidity();
	if (!this.checkValidity()) {
		this.reportValidity();
		event.preventDefault();
	} 
}, false);


</script>
</body>
</html>