<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="welcome">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>ZGL后台管理</title>
<link rel="stylesheet" type="text/css" href="<?php echo base_url('static');?>/css/base.css" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url('static');?>/css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="<?php echo base_url('static');?>/css/index.css" />
<script src="<?php echo base_url('static');?>/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('static');?>/js/jquery.bxslider.min.js" type="text/javascript"></script>
<script src="<?php echo base_url('static');?>/js/index.js" type="text/javascript"></script>
</head>
<body>


<div class="content subPage account" id="formLogin"> 
        <div class="accountLogo"><a title="回到首页" href="<?php echo site_url('');?>"><img src="<?php echo base_url('static');?>/img/logo.png" alt="" /></a></div>
        <form action="<?php echo site_url('/Index/login');?>" method="post" class="formLogin" id="formLogin">
            <h1>欢迎登陆</h1>
            <p>
                <input class="account_username" id="phone" type="text" name="phone" placeholder="手机号或邮箱" autocomplete="off" value="<?php if(isset($phone)) echo $phone;?>" />
            </p>
            <p>
                <input class="account_password" type="password" name="password" placeholder="密码" autocomplete="off"  value="<?php if (isset($password)) echo $password;?>" />
            </p>
            <p class="account_info">
                <input type="checkbox" class="account_check" name="automatic" value="1" />
                <span>记住密码</span>
                <a href="forgetpassword.html">忘记密码</a>
            </p>
            <p>
                <input type="submit" class="button account_submit account_login" value="登录" />
            </p>
            <p>
                <a class="button account_submit account_register" href="<?php echo site_url('/Index/sv/register');?>">注册</a>
            </p>
            <span class="tempData" style="margin-left:20px;color:red;"></span>
        </form>
    
</div>
<!--content-->

</body>
</html>
