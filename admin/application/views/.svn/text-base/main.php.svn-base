<?php include "header.php"  ?>
<div id="content">
	<div class="col-left left_menu">
    	<div id="leftMain">
        </div>
        <a href="javascript:;" id="openClose" style="outline-style: none; outline-color: invert; outline-width: medium;" hideFocus="hidefocus" class="open" title="展开与关闭"><span class="hidden">展开</span></a>
    </div>
    
    <div class="col-auto mr8">
        <div class="crumbs">
            <div class="shortcut cu-span">
                </div>
        	当前位置：<span id="current_pos"></span>
			</div>
            <div class="col-1">
                <div class="content" style="position:relative; overflow:hidden">
                    <!--右侧正文内容-->
                    <iframe name="right" id="rightMain" src="<?php echo site_url('/Support/index');?>" frameborder="false" scrolling="auto" style="overflow-x:hidden;border:none; margin-bottom:30px" width="100%" height="auto" allowtransparency="true"></iframe>
                    <div class="fav-nav">
                        <div id="panellist"></div>
                    </div>
                </div>
            </div>
        </div>
</div>
<script type="text/javascript"> 
var uname = '<{php}>echo 123;<{/php}>';
//clientHeight-0; 空白值 iframe自适应高度
function windowW(){
	if($(window).width()<980){
			$('.header').css('width',980+'px');
			$('#content').css('width',980+'px');
			$('body').attr('scroll','');
			$('body').css('overflow','');
	}
}
windowW();
$(window).resize(function(){
	if($(window).width()<980){
		windowW();
	}else{
		$('.header').css('width','auto');
		$('#content').css('width','auto');
		$('body').attr('scroll','no');
		$('body').css('overflow','hidden');
		
	}
});
window.onresize = function(){
	var heights = document.documentElement.clientHeight-150;document.getElementById('rightMain').height = heights;
	var openClose = $("#rightMain").height()+39;
	$('#center_frame').height(openClose+9);
	$("#openClose").height(openClose+30);	
}
window.onresize();
//站点下拉菜单
$(function(){
	//默认载入左侧菜单
	$("#leftMain").load("<?php echo site_url('/Support/menu_left');?>");
})

//左侧开关
$("#openClose").click(function(){
	if($(this).data('clicknum')==1) {
		$("html").removeClass("on");
		$(".left_menu").removeClass("left_menu_on");
		$(this).removeClass("close");
		$(this).data('clicknum', 0);
	} else {
		$(".left_menu").addClass("left_menu_on");
		$(this).addClass("close");
		$("html").addClass("on");
		$(this).data('clicknum', 1);
	}
	return false;
});


</script>
</body>
</html>

