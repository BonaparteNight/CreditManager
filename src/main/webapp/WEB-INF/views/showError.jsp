<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<meta http-equiv="pragma" content="no-cache"> 
		<meta http-equiv="cache-control" content="no-cache, must-revalidate">
		<%@include file="/include.jsp"%>
		<style type="text/css">
			body{background:#fff;}
			#wrapper_sh{ width:500px; margin:0px auto; margin-top:20px;}
			.wrapper_delay table tr td{ color:#333333;color:#0066ff; font-size:12px; line-height:20px; padding:0 6px;}
			.wrapper_delay table tr td span{ color:#333; font-size:14px; font-weight:bold;}
			.wrapper_delay table tr td a:link{ color:#7092be; text-decoration:underline;}
			.wrapper_delay table tr td a:hover{ color:#9f111; text-decoration:underline;}
			.wrapper_delay table tr td a:visited{ text-decoration:underline;}
		</style>
	</head>
	<body>
		<div id="wrapper_sh">
			<div class="wrapper_delay">
				<table width="500" border="0" cellspacing="0">
				  <tr><td width="369"><img src="/images/sys/error.gif"></img><span><span>对不起！<br>数据库连接出现异常!<br>请联系系统管理员！</span></span></td></tr>
				  <tr><td height="15" style=" border-bottom:1px solid #eee;"></td></tr>
				  <tr><td height="10"></td></tr>
				  <tr><td height="25"></td></tr>
				</table>
			</div>
		</div>
	</body>
</html>
