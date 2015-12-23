
<?php if( count($banners) ) { ?>
	<?php $id = rand(1,10);?>
   <div id="pavcontentslider<?php echo $id;?>" class="carousel slide pavcontentslider">
	
		<div class="carousel-inner">
			 <?php foreach ($banners as $i => $banner) {  ?>
				<div class="item <?php if($i==0) {?>active<?php } ?>">
					<?php if ($banner['link']) { ?>
					<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['thumb']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
					<?php } else { ?>
					<img src="<?php echo $banner['thumb']; ?>" alt="<?php echo $banner['title']; ?>" />
					<?php } ?>
					<?php if( isset($banner['layers']) && $banner['layers'] ) { ?>
					<?php foreach( $banner['layers'] as $layer ) { ?>
					<div class="pav-caption <?php echo $layer['effect']. " ".$layer['class'];?>" style="top:<?php echo (int)$layer['top']?>px;left:<?php echo (int)$layer['left']?>px">
						<?php  echo $layer['caption'];?>
					</div>
					<?php } ?>
					<?php } ?>		 
				</div>
			<?php } ?>
		</div>
		<?php if( count($banners) > 1 ){ ?>	
		<a class="carousel-control left " href="#pavcontentslider<?php echo $id;?>" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#pavcontentslider<?php echo $id;?>" data-slide="next">&rsaquo;</a>
		<?php } ?>

		<?php if( count($banners)  > 1 ) { ?>	
			<?php if( isset($setting['image_navigator']) && $setting['image_navigator'] ) { ?>
			<ol class="carousel-indicators thumb-indicators hidden-phone ">
			<?php foreach ( $banners as $j=>$item )  : ?>
				<li data-target="#pavcontentslider<?php echo $id;?>" data-slide-to="<?php echo $j;?>" class="<?php if($j==0) {?>active<?php } ?>">
					<img src="<?php echo $item['image_navigator'];?>"/>
				</li>
			<?php endforeach ?>
			</ol>
			<?php } else { ?>
			<ol class="carousel-indicators">
			<?php foreach ( $banners as $j=>$item )  : ?>
				<li data-target="#pavcontentslider<?php echo $id;?>" data-slide-to="<?php echo $j;?>" class="<?php if($j==0) {?>active<?php } ?>"></li>
			<?php endforeach ?>
			</ol>
			<?php } ?>
		<?php } ?>
		
		
		
    </div>
	<?php if( count($banners) > 1 ){ ?>
	<script type="text/javascript">
	<!--
		$('#pavcontentslider<?php echo $id;?>').carousel({interval:8000});
	-->
	</script>
	<?php } ?>
<?php } ?>

