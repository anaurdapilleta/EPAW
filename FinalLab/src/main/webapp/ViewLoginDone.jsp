<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$('#navigation').load('MenuController');
$('#rcolumn').css("visibility", "visible");
$('#lrcolumn').css("visibility", "visible");
</script>

Log in for user ${sessionScope.user} done!