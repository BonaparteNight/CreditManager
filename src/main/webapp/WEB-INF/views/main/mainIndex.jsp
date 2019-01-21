<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<%@ page isELIgnored="false" %>
	<%@ page language="java" pageEncoding="UTF-8"%>
	<%@ page import="com.core.entity.SessionBean"%>
	<%@ page import="com.core.utils.GlobalConst"%>
	<%@ page import="java.util.Map"%>
	<%@ page import="com.core.utils.Utils"%>
	<%
	SessionBean sessionBean = (SessionBean)request.getSession().getAttribute(GlobalConst.SESSION_KEY);
	Map<String,String> pmp = sessionBean.getRoleMap();
	String userId = sessionBean.getUserId();
	String path = request.getContextPath();
	%>
	<title>****系统</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/my.css">
	<link rel="stylesheet" href="/assets/css/ready.css">
	<link rel="stylesheet" href="/assets/css/demo.css">
	<link href="/bootstrap/assets/css/icons.css" rel="stylesheet" />
	<link href="/bootstrap/assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
	<link href="/bootstrap/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="/bootstrap/assets/css/plugins.css" rel="stylesheet" />
    <link href="/bootstrap/assets/css/main.css" rel="stylesheet" />
    <link href="/bootstrap/assets/css/custom.css" rel="stylesheet" />
    <!-- <link rel="stylesheet" type="text/css" href="/css/remind.css" /> -->
	<link rel="stylesheet" type="text/css" href="/bootstrap/assets/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/bootstrap/easyui.css" />
</head>
<body>
<div id="win" class="easyui-window" data-options="closed:true,resizable:false"></div>
<!--头部-->
    <div class="header">
    	<div class="header_l">
            <div class="header_logo"></div>
        </div>
        <div class="header_r">
        	<h3>${userName}(${userId})，您好</h3>
        </div>
    </div>
	<%-- <div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="/MainIndex/mainIndex.do" class="logo">
					我的主页
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
		</div>
		<div class="sidebar">
				<div class="scrollbar-inner sidebar-wrapper">
					<div class="user">
						<div class="info">
							<a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									<span class="user-level">${userName}</span>
									<span class="caret"></span>
								</span>
							</a>
							<div class="clearfix"></div>

							<div class="collapse in" id="collapseExample" aria-expanded="true" style="">
								<ul class="nav">
									<li>
										<a href="/MainIndex/mainIndex.do">
											<span class="link-collapse">我的案子</span>
										</a>
									</li>
									<li>
										<a href="/MainIndex/mainIndex.do">
											<span class="link-collapse">我的待办</span>
										</a>
									</li>
									<li>
										<a href="/MainIndex/mainIndex.do">
											<span class="link-collapse">我的历史</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					
					
					
					
					<nav class="nav" id="ulMain">
					
					
					</nav>
				</div>
			</div>
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<h4 class="page-title">我的主页</h4>
						<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">我的待办</h4>
								<p class="card-category">这是您需要处理的案子:</p>
							</div>
							<div class="card-body">
								<table class="table table-head-bg-primary mt-4">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">案子名称</th>
										<th scope="col">类型</th>
										<th scope="col">客户名称</th>
										<th scope="col">贷款金额</th>
										<th scope="col">环节</th>
										<th scope="col">状态</th>
										<th scope="col">操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>***</td>
										<td>一首房</td>
										<td>张三</td>
										<td>100000</td>
										<td>新增</td>
										<td>待业务经理确认</td>
										<td><a href="#">审核</a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>***</td>
										<td>二首房</td>
										<td>张三</td>
										<td>100000</td>
										<td>结案</td>
										<td>待结案</td>
										<td><a href="#" >结案</a></td>
									</tr>
									<tr>
										<td>3</td>
										<td>***</td>
										<td>二首房</td>
										<td>张三</td>
										<td>100000</td>
										<td>外勤接受</td>
										<td>待外勤接受</td>
										<td><a href="#">外勤接受确认</a></td>
									</tr>
								</tbody>
							</table>
							</div>
						</div>
						</div>
				   </div>
				   <div class="container-fluid">
					
						<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">工作跟踪</h4>
								<p class="card-category">这是您参与的案子:</p>
							</div>
							<div class="card-body">
								<table class="table table-head-bg-primary mt-4">
								<thead>
										<tr>
										<th scope="col">#</th>
										<th scope="col">案子名称</th>
										<th scope="col">类型</th>
										<th scope="col">客户名称</th>
										<th scope="col">贷款金额</th>
										<th scope="col">环节</th>
										<th scope="col">状态</th>
										<th scope="col">操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>***</td>
										<td>一首房</td>
										<td>张三</td>
										<td>100000</td>
										<td>新增</td>
										<td>待业务经理确认</td>
										<td><a href="#">查看</a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>***</td>
										<td>二首房</td>
										<td>张三</td>
										<td>100000</td>
										<td>结案</td>
										<td>待结案</td>
										<td><a href="#" >查看</a></td>
									</tr>
									<tr>
										<td>3</td>
										<td>***</td>
										<td>二首房</td>
										<td>张三</td>
										<td>100000</td>
										<td>外勤接受</td>
										<td>待结案</td>
										<td><a href="#">查看</a></td>
									</tr>
								</tbody>
							</table>
							</div>
						</div>
						</div>
				   </div>
				</div>
			</div>
		
	</div>
	
	<div id="centerPanel" data-options="region:'center',border:true,title:''" >
		<div id="tt" class="easyui-tabs" data-options="tabPosition:'top',fit:true,border:false,plain:true">
		</div>
	</div> --%>
	
</body>
<!-- <script src="/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="/assets/js/core/popper.min.js"></script>
<script src="/assets/js/core/bootstrap.min.js"></script>
<script src="/assets/js/plugin/chartist/chartist.min.js"></script>
<script src="/assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="/assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="/assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="/assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="/assets/js/ready.min.js"></script>
<script>
	$( function() {
		$( "#slider" ).slider({
			range: "min",
			max: 100,
			value: 40,
		});
		$( "#slider-range" ).slider({
			range: true,
			min: 0,
			max: 500,
			values: [ 75, 300 ]
		});
	} );
	
	$(document).ready(function() {
		var array = new Array();
		var url="";
		var func_name="";
		var func_type="";  
		var super_func_id="";
		var func_id="";
		
		var eData="<li class='nav-item'><i class='la la-dashboard></i><p>";
		
		
		
		array='${menuList}';
	    var newArray=eval('(' + array + ')');
	 	 for ( var i = 0; i <newArray.length; i++){
	 		 url=newArray[i]["func_url"];
			 func_name=newArray[i]["func_name"];
			 func_id=newArray[i]["func_id"];
			 func_type=newArray[i]["func_type"];
			 super_func_id=newArray[i]["super_func_id"];
		
			 
			 if(''==super_func_id||null==super_func_id){
				 eData='<li class="nav-item"><div class="user"><div class="info"><a class="" data-toggle="collapse" href="#collapseExample'+func_id+'" aria-expanded="true">'+
				 		'<span><span class="user-level">'+func_name+'</span><span class="caret"></span></span></a><div class="clearfix"></div><div class="collapse in" id="collapseExample'+func_id+'" aria-expanded="true" style=""><ul id="'+func_id+'" class="nav"></ul></div></div></div></li>'
				 		$("#ulMain").append(eData);
			 }else{
				 eData='<li><a href="'+url+'" target="_blank" ><span class="link-collapse">'+func_name+'</span></a></li>';
				 $("#"+super_func_id).append(eData);
				 
			 }
			 
	    } 
		
		
		 
	})
	
	
	
</script> -->
</html>