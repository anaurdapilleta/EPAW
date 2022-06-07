<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="w3-container w3-card w3-round w3-white w3-section w3-center ">
  <h4>${other.name}</h4>
  <p><img src="imgs/avatar2.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
  <hr>
  <p class="w3-left-align"> <i class="fa fa-id-card fa-fw w3-margin-right"></i> ${other.user} </p>
  <p class="w3-left-align"> <i class="fa fa-id-badge fa-fw w3-margin-right"></i> ${other.mail} </p>
  <label for="account">  
		<a class="menu w3-button w3-deep-purple w3-section" style="font-weight:bold;" id="GetFollowedUsers" href=# > <i class="fa fa-user-plus"></i>Go back </a>
  </label><br/><br/>
 </div>
<br>