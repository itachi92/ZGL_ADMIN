<?php include_once 'header.php';?>
            <!--right of content_out -->
            <div class="content_out">
            	<!--first 1 -->
            	<div class="QA_item clearfix">
                    <div class="leftSection width_100">
                    <?php if ($content['faq']['ym_status'] == 1) :?>
                    	<a class="lable_ed" href="<?php echo site_url('/Support/done').'/'.$content['faq']['ym_fid'];?>">已解决</a>
                    <?php endif;?>              	
                    	<ul>
                        	<li>账号：<?php echo $content['user']['ym_phone'];?></li>
                            <li>姓名：<?php echo $content['user']['ym_name'];?></li>
                            <li>邮箱：<?php echo $content['user']['ym_mail'];?></li>
                            <li>地址：<?php echo $content['user']['ym_address'];?></li>
                        </ul>
                        <!--one -->
                        <div class="clearfix"><h2 class="fl"><?php echo $content['faq']['ym_title'];?></h2><span class="fr margin_top_10">2015-09-17 13:55 编辑</span></div>
                        <p class="con_text">
                        	<?php echo $content['faq']['ym_faq'];?>
                        </p>
                        <?php if (!empty($content['faq']['ym_reply'])):?>
                        <div class="clearfix"><h2 class="fl color_57c2de">ZGL回复</h2><span class="fr margin_top_10">2015-09-17 13:55 编辑</span></div>
                        <p class="con_text">
                        	<?php echo $content['faq']['ym_reply'];?>
                        </p>
                        <?php endif;?>
                        <!--question -->
                        <div class="questionNew">
                        	<form action="<?php echo $url['reply'].'/'.$content['faq']['ym_fid'];?>" method="post">
                        		<textarea cols="100" rows="10" name="reply"></textarea>
                            	<p><input type="submit" class="button" name="submit"></p>
                        	</form>
                        </div>
                        
                        <span><?php if (!empty($reply)) echo $reply;?></span>
                    </div>
                </div>
                
                
                
            </div>
  <?php include_once 'footer.php';?>