<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="imgs/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Audiovisual Twitter </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
	$.ajaxSetup({ cache: false }); //Avoids Internet Explorer caching!	
	$(document).on("click",".menu", async function(event) {
		//$('#content').load('ContentController',{content: $(this).attr('id')});
		//const response = await fetch($(this).attr('id'));
		//$('#content').html(await response.text());
		$('#content').load($(this).attr('id'));
		event.preventDefault();
	});
	$(document).on("submit","form", function(event) {
		$('#content').load($(this).attr('action'),$(this).serialize());
	    event.preventDefault();
	});
	/* Add tweet */
	$(document).on("click","#addTweet",function(event){
		$.post( "AddTweet", { content: $("#tweetContent").text()}, function(event) {
			$("#content").load("GetOwnTimeline");		
		});
		event.preventDefault();
	});
	/* Delete tweet */
	$(document).on("click",".delTweet",function(event){
		var tweet = $(this).parent();
		$.post( "DelTweet", { id: $(this).parent().attr("id") } , function(event) {
			$("#content").load("GetOwnTimeline");				
		});
		event.preventDefault();
	});
	/* Follow user */
	$(document).on("click",".followUser",function(event){
		var user = $(this).parent();
		$.post( "FollowUser", { id: $(this).parent().attr("id") }, function(event) { 
			$("#content").load("GetFollowedUsers");
			$("#lcolumn").load("GetNotFollowedUsers");
		});
		event.preventDefault();
	});
	/* UnFollow user */
	$(document).on("click",".unfollowUser",function(event) {
		var user = $(this).parent();
		$.post( "UnFollowUser", { id: $(this).parent().attr("id") }, function(event) {
			$("#content").load("GetFollowedUsers");
			$("#lcolumn").load("GetNotFollowedUsers");
		});
		event.preventDefault();
	});
	/* Info user */
	$(document).on("click",".userInfo",function(event) {
		var user = $(this).parent();
		$.post( "GetUserInfo", { id: $(this).parent().attr("id") }, function(event) {
			$("#content").load("GetUserInfo");
			$("#lcolumn").load("GetNotFollowedUsers");
			$("#rcolumn").load("GetOtherUserInfo", { id: $(this).parent().attr("id") });
		});
		event.preventDefault();
	});
	
	/* Info other user */
	$(document).on("click",".otherUserInfo",function(event) {
		var other = $(this).parent();
		$("#content").load("GetUserTweets", { id: $(this).parent().attr("id") });
		$("#lcolumn").load("GetNotFollowedUsers");
		$("#rcolumn").load("GetOtherUserInfo", { id: $(this).parent().attr("id") });
		
		event.preventDefault();
	});
	//Like tweet
	$(document).on("click",".likeTweet",function(event) {
		$.post( "LikeTweet", { id: $(this).parent().attr("id") }, function(event) {
			$("#content").load("GetOwnTimeline");
		});
		event.preventDefault();
	});
	//Retweet tweet
	$(document).on("click",".retweetTweet",function(event) {
		$.post( "RetweetTweet", { id: $(this).parent().attr("id") }, function(event) {
			$("#content").load("GetOwnTimeline");
		});
		event.preventDefault();
	});
	
	
});
</script>
</head>
<body>

 	<!-- Begin Navigation -->
 	<div class="w3-bar w3-deep-purple" id="navigation">
    <jsp:include page="${menu}" />
 	</div>
 	<!-- End Navigation -->
 
	
	<!-- Begin Content -->
	<div class="w3-row-padding">
 	<!-- Left Column -->
	<div class="w3-container w3-col m3 w3-hide-small">
		<div id="rcolumn">
			<p></p>
		</div>
	</div>
	<!-- Middle Column -->	
	<div class="e3-container w3-col m6">
		<div id="content">
		<jsp:include page="${content}" />
		</div>
	</div>
	<!-- Right Column -->
	<div class="w3-container w3-col m3 w3-hide-small">
		<div id="lcolumn">
			<p></p>
		</div>
	</div>
	</div>
	<!-- End Content -->
	<!-- Footer -->
	<footer class="w3-container w3-theme">
	  <p> Audiovisual Twitter </p>
	</footer>
	
	
	<script>
	function stack() {
		var x = document.getElementById("stack");
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else { 
   			x.className = x.className.replace(" w3-show", "");
 		}
	}
	</script>

  </body>
</html>