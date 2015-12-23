<?php 
	$span = 12/$cols; 
?>

<div class="box pav-block bloglatest">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
	<?php if( trim($message) ) { ?>
				<div class="box-description"><?php echo $message;?></div>
				<?php } ?>
		<?php if( !empty($blogs) ) { ?>
		<div class="pavblog-latest clearfix box-content">
			<?php foreach( $blogs as $key => $blog ) { ?>
			
			<?php //print("<pre>"); print_r($blog); die();?>
			
			<?php if( $key++%$cols == 0 ) { ?>
			<div class="row">
			<?php } ?>
				<div class="col-lg-<?php echo $span;?> col-sm-<?php echo $span;?> pavblock">
					<div class="blog-item">					
						<div class="blog-body clearfix">
							
							<div class="image clearfix">
								<?php if( $blog['thumb']  )  { ?>
									<img src="<?php echo $blog['thumb'];?>" title="<?php echo $blog['title'];?>" align="left"/>
								<?php } ?>
							</div>
							<div class="group-blog">
								<div class="blog-title">
									<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
								</div>

								<div class="description">
									<?php echo utf8_substr( $blog['description'],0, 70 );?>...
								</div>

								
								<p class="created">
									<span><?php echo $blog['created']; ?></span>
								</p>
							</div>
							
						</div>	
					</div>
				</div>
			<?php if( ( $key%$cols==0 || $key == count($blogs)) ){  ?>			
			</div>
			<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>

