<?php
/*视图：左边菜单+右边内容  */
/*用户支持：内容公共顶部  */
/*3个按钮：新问题、我的问题、已解决  */
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>管理员中心</title>
<link href="<?= $css['css']?>" rel="stylesheet" type="text/css" />
<script src="<?=$js['jquery_min'] ?>" type="text/javascript"></script>
<script src="<?=$js['jquery'] ?>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	// var now_nav = '"#'+<?php echo $nav;?>+'"';
	var temp="<?php echo $nav;?>";
	var nav = '#'+temp;
	$(nav).addClass("tilte_bar_li_style");
});
</script>
</head>
<body>
<!-- -->
<!--out main -->
<div id="wrapper">
<div id="header">
<div id="logo"></div>
</div>
<!--end header -->
<div class="content clearfix">
		<!--content of left -->
		<div class="con_left fl">
			<div class="margin_top_40">你好，管理员</div>
			<div class="con_left_phone"><?php echo $_SESSION['name'];?></div>
				<ul class="profileNav">
					<li class="profileNav_background"><a class="icon2" href="#">技术支持</a></li>
					<li><a class="icon5" href="<?php echo site_url('/Index/logout');?>">退出</a></li>
				</ul>
		</div>
		<!--content of right -->
		<div class="con_right fr">
		<!--ringt of title -->
		<ul class="tilte_bar clearfix"><!-- class="tilte_bar_li_style" -->
			<li><a href="<?php echo $url['new'];?>" id= "nav_new" target="_self" >新问题</a></li>
			<li><a href="<?php echo $url['my'];?>" id = "nav_my" target="_self">我的问题</a></li>
			<li><a href="<?php echo $url['done'];?>" id= "nav_done" target="_self">已解决</a></li>
		</ul>