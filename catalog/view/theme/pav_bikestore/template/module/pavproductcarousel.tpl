<?php 
	$span = 12/$cols; 
	$active = 'latest';
	$id = rand(1,9);	
	$categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 
?>
<div class="box productcarousel">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
	<div class="box-content" >
 		<div class="box-products slide" id="productcarousel<?php echo $id;?>">
			<?php if( trim($message) ) { ?>
			<div class="box-description"><?php echo $message;?></div>
			<?php } ?>
			<?php if( count($products) > $itemsperpage ) { ?>
			<div class="carousel-controls">
			<a class="carousel-control left" href="#productcarousel<?php echo $id;?>"   data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#productcarousel<?php echo $id;?>"  data-slide="next">&rsaquo;</a>
			</div>
			<?php } ?>
			<div class="carousel-inner ">		
			 <?php 
				$pages = array_chunk( $products, $itemsperpage);
			//	echo '<pre>'.print_r( $pages, 1 ); die;
			 ?>	
			  <?php foreach ($pages as  $k => $tproducts ) {   ?>
					<div class="item <?php if($k==0) {?>active<?php } ?>">
						<?php foreach( $tproducts as $i => $product ) { ?>
							<?php if( $i++%$cols == 0 ) { ?>
							  <div class="row box-product">
							<?php } ?>
								  <div class="col-lg-<?php echo $span;?> "><div class="product-block">
								  	
									<?php if ($product['thumb']) { ?>
									<div class="image">
										<?php if( $product['special'] ) {   ?>
								    	<div class="product-label-special label"><?php echo $this->language->get( 'text_sale' ); ?></div>
								    	<?php } ?>
								    	<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
								      	<?php if( $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
								      	<a href="<?php echo $zimage;?>" class="colorbox product-zoom" rel="colorbox" title="<?php echo $product['name']; ?>"><span class="icon-zoom-in"></span></a>
								      	<?php } ?>
								      </div>
									<?php } ?>
									<h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
									<div class="description">
										<?php echo utf8_substr( strip_tags($product['description']),0,58);?>...
									</div>
									 <div class="group-item"> 
									<?php if ($product['rating']) { ?>
									<div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
									<?php } ?>
									
								    <div class="price-cart">
									  <?php if ($product['price']) { ?>
									 <div class="price">
										  <?php if (!$product['special']) { ?>
										  <?php echo $product['price']; ?>
										  <?php } else { ?>
										  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
										  <?php } ?>
										</div>
									  <?php } ?>
									  
									  <div class="cart">
										<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
									  </div>
									  </div>
									  </div>
									  <div class="wishlist-compare">
										  <a class="wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_wishlist"); ?>" ><?php echo $this->language->get("button_wishlist"); ?></a>
										  <a class="compare"  onclick="addToCompare('<?php echo $product['product_id']; ?>');" title="<?php echo $this->language->get("button_compare"); ?>" ><?php echo $this->language->get("button_compare"); ?></a>
									 </div>
								  
								  
								  </div></div>
						  
						  <?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
							 </div>
							<?php } ?>
						<?php } //endforeach; ?>
					</div>
			  <?php } ?>
			</div>  
		</div>
 </div> </div>

<script type="text/javascript">
$('#productcarousel<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
</script>
