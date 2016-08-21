<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>首页</title>

<link rel="stylesheet" type="text/css" href="/css/theme.css">
<link rel="stylesheet" type="text/css" href="/css/premium.css">
<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="/js/jquery.min.js">
	
</script>
<script src="/js/bootstrap.min.js"></script>
</head>

<body>


	<div class="navbar navbar-default" role="navigation" s>
		<div class="navbar-header ">
			<a class="" href="index.html"><span class="navbar-brand"><span
					class="fa fa-paper-plane"></span>10990漆翔宇</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="/logout.do"
					> <span
						class="glyphicon glyphicon-user padding-right-small"
						style="position: relative; top: 3px;"></span> 退出登录 <i
						class="fa fa-caret-down"></i>
				</a>
		</div>
	</div>

	<div class="sidebar-nav">
		<ul>
			<li><a href="/index.do" data-target=".dashboard-menu"
				class="nav-header" data-toggle="collapse"><span
					class="fa fa-fw fa-dashboard"></span> Customer管理 <i
					class="fa fa-chevron-right glyphicon glyphicon-ok"
					aria-hidden="true" style="float: right"></i> </a></li>



			<li><a href="#" data-target=".accounts-menu"
				class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-briefcase"> </i> Flim设置 </a></li>

		</ul>
	</div>

	<div class="content">

		<h1 class="page-title">创建Customer</h1>

		<div class="main-content">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">基本信息列表
				</div>

				<!-- Table -->
				<form class="form-inline" id="form">
						<div class="form-group ">
							<label for="exampleInputName2">First Name</label> <input type="text"
								class="form-control" name="firstName"
								placeholder="First Name">
						</div>
						<br/><br/>
						<div class="form-group ">
							<label for="exampleInputName2">Last Name</label> <input type="text"
								class="form-control" name="lastName"
								placeholder="Last Name">
						</div>
						<br/><br/>
						<div class="form-group ">
							<label for="exampleInputName2">Email &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</label> <input type="text"
								class="form-control" name="email"
								placeholder="email">
						</div>
						<br/><br/>
						<div class="form-group ">
							<label for="exampleInputName2">Address &nbsp;&nbsp;&nbsp; </label> 
							<select id="select" name="address.addressId">
							</select>
						</div>
						<br/><br/>
						<div class="form-group  col-md-offset-1">
							<button id="confirm" type="button" class="btn btn-info">新建</button>
							<button id="cancel" type="button" class="btn btn-default">取消</button>
						</div>
					</form>
			</div>

		</div>
	</div>
	
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
		
			$.post("/address/list",function(data){
					for( var obj in data){
						$("#select").append("<option value='"+data[obj].addressId+"'>"
						+data[obj].address+"</option>");
					}
			},"json");
		});
		$("#cancel").click(function(){
			window.history.back(-1); 
		})
		$("#confirm").click(function(){
			$.post("/customer/add",$("#form").serialize(),function(data){
				alert(data.msg);
				window.history.back(-1); 
				});
		})
	</script>		
			


</body>
</html>
