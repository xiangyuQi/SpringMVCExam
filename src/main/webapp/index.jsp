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

<body  class=" theme-blue">


	<div class="navbar navbar-default" role="navigation">
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
				</a></li></ul>
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

		<h4 class="page-title">客户管理</h4>

		<div class="main-content">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">客户列表
				<button  id = "add" type="button" class="btn btn-info col-md-offset-4" >新建</button>
				</div>

				<!-- Table -->
				<table class="table">
					<tr>
						<th>操作</th>
						<th>FirstName</th>
						<th>LastName</th>
						<th>Address</th>
						<th>Email</th>
						<th>CustomerId</th>
						<th>LastUpdate</th>
					</tr>
					<tbody id="tbody">

					</tbody>
				</table>
				<nav>
				<ul id="pageShow" class="pagination">


				</ul>
				</nav>
			</div>

		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">信息修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-inline" id="updateForm">
					<input type="hidden" name="customerId" />
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
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" id="modify">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script type="text/javascript">
		var pageNo;
		$(document).ready(function() {
			$.post("/customer/list", function(data) {
				var lists = data["lists"];
				showLists(lists);
				var totalPages = data["totalPages"];
				pageNo = data["pageNo"];
				showPages(totalPages);
			}, "json");
		});

		function pageAction(page) {
			$.post("/customer/list", 'pageNo=' + page, function(data) {
				var lists = data["lists"];
				showLists(lists);
				var totalPages = data["totalPages"];
				pageNo = data["pageNo"];
				showPages(totalPages);
			}, "json");
		}

		function showLists(lists) {
			$("#tbody").children().remove();
			for ( var obj in lists) {
				$("#tbody").append(
						"<tr> <td> <a  data-toggle='modal' data-target='#myModal' onclick='modify("+lists[obj].customerId+")' > 编辑</a> |<a href='javascript:del("+lists[obj].customerId+")'> 删除</a>"
								+ "</td><td>" + lists[obj].firstName
								+ "</td><td>" + lists[obj].lastName
								+ "</td><td>" + lists[obj].address.address
								+ "</td><td>" + lists[obj].email + "</td><td>"
								+ lists[obj].customerId + "</td><td>"
								+ lists[obj].lastUpdate + "</td></tr>");

			}
		}

		function showPages(totalPages) {
			var pageShow = $("#pageShow");
			pageShow.children().remove();
			pageShow
					.append("<li ><a  aria-label='Previous' href='javascript:pageAction("
							+ (parseInt(pageNo) - 1)
							+ ")'> <span aria-hidden='true'>&laquo;</span></a></li>");
			for (var i = 1; i <= totalPages; i++) {
				if (i == pageNo) {
					pageShow
							.append("<li class='active'><a class='page' href='javascript:pageAction("
									+ i + ")'>" + i + "</a></li>");
				} else
					pageShow
							.append("<li><a class='page' href='javascript:pageAction("
									+ i + ")'>" + i + "</a></li>");
			}
			pageShow
					.append("<li><a  aria-label='Next' href='javascript:pageAction("
							+ (parseInt(pageNo) + 1)
							+ ")'> <span aria-hidden='true'>&raquo;</span></a></li>");
		}
		function del(customerId){
			if(confirm("确认删除吗")){ 
				$.post("/customer/del/"+customerId, function(data) {
					alert("删除成功！");
					pageAction(pageNo);
				});
				return;
			} 
			
			else{ 
				return; 
			} 
		}
		function modify(customerId){
			var addressId ;
			$.get("/customer/get/"+customerId, function(data) {
				$("[name='firstName']").val(data.firstName);
				$("[name='lastName']").val(data.lastName);
				$("[name='email']").val(data.email);
				$("[name='customerId']").val(data.customerId);
				addressId = data.address.addressId;
			}, "json");
			$.post("/address/list",function(data){
				for( var obj in data){
					if(data[obj].addressId == addressId ){
						$("#select").append("<option selected value='"+data[obj].addressId+"'>"
								+data[obj].address+"</option>");
					}
					else {
						$("#select").append("<option value='"+data[obj].addressId+"'>"
						+data[obj].address+"</option>");
					}
				}
		},"json");
		}
		$("#add").click(function(){
			window.location.href="/customerAdd.jsp"; 
		})
		$("#modify").click(function(){
			$.get("/customer/update",$("#updateForm").serialize(),function(data) {
				alert(data.msg);
				pageAction(pageNo);
				$('#myModal').modal('hide');
			}, "json");
			pageAction(pageNo);
		})
	</script>

</body>
</html>
