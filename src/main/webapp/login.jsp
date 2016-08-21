<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/bg.css" rel="stylesheet" type="text/css">

<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap-theme.min.css" rel="stylesheet"
	type="textcss">
<link href="/css/templatemo_style.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div class="navbar navbar-fixed-top" role="navigation">

		<div class="navbar-header">
			<h3>
				<span class="glyphicon glyphicon-cog">10990漆翔宇</span>
			</h3>
		</div>
	</div>


	<div class="container">
		<div class="col-md-12">
			<form
				class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30"
				role="form" action="/customer/validate" method="post">
				<div class="form-group">
					<h3 class="margin-bottom-2 col-md-offset-1">电影租赁管理系统</h3>
					
				</div>
				<div class="form-group has-success has-feedback">
				  <div class="col-md-2">
				  	<label class="control-label" for="inputSuccess2">用户名:</label>
				  </div>
				  <div class="col-md-10">
					  <input name = "firstName" type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
					  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					  <span id="inputSuccess2Status" class="sr-only">(success)</span>
				  </div>
				</div>
				<div class="form-group has-success has-feedback">
				  <div class="col-md-2">
				  	<label class="control-label" for="inputSuccess2">密码:</label>
				  </div>
				  <div class="col-md-10">
					  <input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
					  <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
					  <span id="inputSuccess2Status" class="sr-only">(success)</span>
				  </div>
				</div>

				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<input type="submit" value="Log in" name = "login"class="btn btn-info">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>