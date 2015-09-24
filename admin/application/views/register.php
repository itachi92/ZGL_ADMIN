<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="register">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="<?php echo base_url('static');?>/css/base.css" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url('static');?>/css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url('static');?>/css/index.css" />
<script src="<?php echo base_url('static');?>/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('static');?>/js/jquery.bxslider.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('static');?>/js/index.js" type="text/javascript"></script>
</head>
<body>


<div class="content subPage account"> 
		<div class="accountLogo"><a title="回到首页" href="<?php echo site_url('');?>"><img src="<?php echo base_url('static');?>/img/logo.png" alt="" /></a></div>
		<form action="<?php echo site_url('Index/register');?>" method="post" id="formRegister">
			<h1>用户注册</h1>
			<p>
				<input class="account_username" id="phone" type="text" name="phone" placeholder="输入你的手机号"/>
			</p>
			<p>
<!-- 				<input class="account_code" type="text" name="code" placeholder="输入验证码"/> -->
<!-- 				<a class="account_codeGet" href="javascript:void(0);">获取验证码</a> -->
				<span class="tempData" style="color:red;"></span>
			</p>
			<p>
				<input class="account_password" type="password" name="password" placeholder="请输入你的密码"/>
			</p>
			<p class="account_info">
				<input type="checkbox" class="account_check" />
				<span>我已阅读并同意使用条款</span>
				<a href="<?php echo site_url('Index/index');?>">返回登录</a>
			</p>
			<p>
				<input type="submit" class="button account_submit account_register" value="注册" />
			</p>
		</form>
		
	
</div>
<!--content-->


</body>
</html>
