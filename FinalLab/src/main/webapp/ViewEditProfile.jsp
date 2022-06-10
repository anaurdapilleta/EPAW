<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<form action="EditProfile"  method="POST" class="w3-panel w3-light-grey w3-text-deep-purple w3-margin" style="height:1100px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
	<h4>My Profile</h4>
	<p><img src="imgs/avatar3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
	<hr>
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
		<div class="w3-rest w3-round">2001-01-01 <br/><br/> 
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