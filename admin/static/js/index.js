$(document).ready(function(){
	$('.bxslider').bxSlider({
	  auto:'true'
	});

	$('.nav_item').click(function(){
		$(this).addClass('active').parent().siblings().children().removeClass('active');
	});

	$('.tabMenu li').click(function(){
		var index=$(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$(this).parent().siblings('.tabContent').children('.contentItem').hide().eq(index).fadeIn();
	});

	$('.contentItem dl:eq(1)').css({'margin-left':'30px','margin-right':'30px'});
	$('.contentItem dl:eq(4)').css({'margin-left':'30px','margin-right':'30px'});

	$('.contentItem dl').hover(function(){
		$(this).find('.dtInfo').stop().animate({'bottom':'0'});
	},function(){
		$(this).find('.dtInfo').animate({'bottom':'-60px'});
	});

	$('.functionItem').hover(function(){
		$(this).css('color','#fff').children('img').stop().fadeOut().siblings('em').stop().animate({'top':'90px'});
	},function(){
		$(this).css('color','#595959').children('img').stop().fadeIn().siblings('em').stop().animate({'top':'205px'});
	});
	$('.functionItem').eq(0).hover(function(){
		$(this).css({'background-color':'#faa3db'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});
	$('.functionItem').eq(1).hover(function(){
		$(this).css({'background-color':'#42d0f5'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});
	$('.functionItem').eq(2).hover(function(){
		$(this).css({'background-color':'#1fd036'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});
	$('.functionItem').eq(3).hover(function(){
		$(this).css({'background-color':'#16aef5'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});
	$('.functionItem').eq(4).hover(function(){
		$(this).css({'background-color':'#59e29a'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});
	$('.functionItem').eq(5).hover(function(){
		$(this).css({'background-color':'#ba9eff'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});
	$('.functionItem').eq(6).hover(function(){
		$(this).css({'background-color':'#5ce0dd'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});
	$('.functionItem').eq(7).hover(function(){
		$(this).css({'background-color':'#5bd6e4'});
	},function(){
		$(this).css({'background-color':'#fff'});
	});

	/*subPage*/
	/*quickStart*/
	$('.quickStart .most p input:checked').parent().addClass('active');
	$('.quickStart .most p').click(function(){
		$('.quickStart .most p input:checked').parent().addClass('active').siblings().removeClass('active');
	});
	$('.groupItem h2').click(function(){
		$(this).siblings('ul').slideToggle();
	});
	$('.groupItem1 li,.groupItem2 li').click(function(){
		$(this).toggleClass('active').siblings().removeClass('active');
	});
	$('.groupItem3 li').click(function(){
		console.log('test');
		$(this).toggleClass('active').siblings().removeClass('active');
	});
	/*$('.myChoose p em').click(function(){
		$(this).parent().remove();
	});
	$('.myChoose h2 em').click(function(){
		$(this).parent().siblings('p').remove();
	});*/

	$(document).mouseup(function(e){
		  var _con = $('.QStemplate');   // 设置目标区域
		  if(!_con.is(e.target) && _con.has(e.target).length === 0){ 
		  	 $('.demoLayer').stop().fadeOut();
		  }
	});
	$('.QStemplate').click(function(e){
		$('.demoLayer').stop().fadeOut();
		$(this).children('.demoLayer').stop().fadeIn();
		var QSleft=$('.QStemplate').offset().left;
		var pX=e.pageX;
		if(pX<1000){
			if(pX<748){
				$('.demoLayer').css({'left':pX-602});
			}
			else{
				$('.demoLayer').css({'left':146});
			}	
			
		}else{
			if(pX<1402){
				$('.demoLayer').css({'left':0});
			}else{
				$('.demoLayer').css({'left':pX-1402});
			}
			
		}
		
	});
	$('.demoLayer .close').hover(function(){
		$('.demoLayer').fadeOut();
	});
		/*$('.QStemplate').hover(function(e){
			var img=$(this).find('.QStemplate_data_img img').attr('src');
			var titles=$(this).find('.QStemplate_data_titles').text();
			var text=$(this).find('.QStemplate_data_text').text();
			var detial=$(this).find('.QStemplate_data_detial').html();
			var demo=$(this).find('.QStemplate_data_link_demo').attr('href');
			var trial=$(this).find('.QStemplate_data_link_trial').attr('href');
			$('.demoLayer_img img').attr("src",img);
			$('.demoLayer_info h1').text(titles);
			$('.demoLayer_info_text').text(text);
			$('.demoLayer_info_detial').html(detial);
			$('.demoLayer_info_links .links1').attr("href",demo);
			$('.demoLayer_info_links .links2').attr("href",trial);
			var toTop=$('.rightContent').offset().top;
			console.log(toTop);
			var posX=e.pageX;
			var posY=e.pageY-toTop-200;
			
		},function(){

		});*/



	
	/*join*/
	$('.joinNav a').eq(3).css('border-bottom','none');
	$('.joinNav a').click(function(){
		$(this).addClass('active').parent().siblings().children().removeClass('active');
	});
	
	/*profile*/
	$('.profileNav a:last').css('border-bottom','none');
	$('.profileNav a').click(function(){
		$(this).addClass('active').parent().siblings().children().removeClass('active');
	});

	/*test*/
	/*$('.account_codeGet').click(function(){
		$('#formGetCode').submit();
	});*/
	$('.account_codeGet').click(function(){
		/*document.domain = 'zgl.com';*/
		jQuery.support.cors = true;
		var phoneVal=$("#phone").val();
		var regPhone=/^0?1[3|4|5|8][0-9]\d{8}$/;
        var phoneTest=regPhone.test(phoneVal);
			if(phoneTest){
					$.ajax({
						type:"POST",
						url:"//test.zgl.com:8080/sms",
						data: {"phone":$("#phone").val()},
						dataType: "json",
						cache: false,
						error:function(a,b,c){
							$('.tempData').text('ajax请求失败');
							console.log(a);
							console.log(b);
							console.log(c);
						},
						success:function(a,b){
							$('.tempData').text('ajax请求成功:'+'返回结果/'+a.data);
						}
					});
				}
				else{
					alert("无效的手机号码！");
					return false;
				}	
	});
	/*$('.account_login').click(function(){
							document.domain = 'zgl.com';
							var phoneVal=$("#phone").val();
							var regPhone=/^0?1[3|4|5|8][0-9]\d{8}$/;
					        var phoneTest=regPhone.test(phoneVal);
								if(phoneTest){
										$.ajax({
											type:"POST",
											url:"//test.zgl.com:8080/username/login",
											data: {"phone":$("#phone").val(),"password":$('.account_password').val(),"automatic":1},
											dataType: "json",
											error:function(a,b,c){
												$('.tempData').text('ajax请求失败');
												console.log(a);
												console.log(b);
												console.log(c);
											},
											success:function(a,b){
												$('.tempData').text('ajax请求成功:'+'返回结果/'+a.data);
											}
										});
									}
									else{
										alert("无效的手机号码！");
										return false;
									}	
									

	});*/



	$('.account_register').click(function(){
		$('#formRegister').submit();
	});
	




});