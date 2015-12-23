<?php echo $header; $module_row=0; ?>
 
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div>
			<table class="form">
						<tr>
						  <td><?php echo $entry_layout; ?></td>
						  <td><select name="pavcontentslider_module[<?php echo $module_row; ?>][layout_id]">
							 <?php foreach ($layouts as $layout) { ?>
							  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
							  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
							  <?php } else { ?>
							  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
							  <?php } ?>
							  <?php } ?>
							</select></td>
						</tr>
						<tr>
						  <td><?php echo $entry_position; ?></td>
						  <td><select name="pavcontentslider_module[<?php echo $module_row; ?>][position]">
							  <?php foreach( $positions as $pos ) { ?>
							  <?php if ($module['position'] == $pos) { ?>
							  <option value="<?php echo $pos;?>" selected="selected"><?php echo $this->language->get('text_'.$pos); ?></option>
							  <?php } else { ?>
							  <option value="<?php echo $pos;?>"><?php echo $this->language->get('text_'.$pos); ?></option>
							  <?php } ?>
							  <?php } ?> 
							</select></td>
						</tr>
						<tr>
						  <td><?php echo $entry_status; ?></td>
						  <td><select name="pavcontentslider_module[<?php echo $module_row; ?>][status]">
							  <?php if ($module['status']) { ?>
							  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							  <option value="0"><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
							  <option value="1"><?php echo $text_enabled; ?></option>
							  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select></td>
						</tr>
						<tr>
						  <td><?php echo $entry_sort_order; ?></td>
						  <td><input type="text" name="pavcontentslider_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
						</tr>
						
						<tr>
						  <td><?php echo $this->language->get('text_auto_play'); ?></td>
						  <td><select name="pavcontentslider_module[<?php echo $module_row; ?>][auto_play]">
							  <?php if ( isset($module['auto_play']) && $module['auto_play'] ) { ?>
							  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							  <option value="0"><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
							  <option value="1"><?php echo $text_enabled; ?></option>
							  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select></td>
						</tr>

						<tr>
						  <td><?php echo $this->language->get('text_interval'); ?></td>
						  <td><input type="text" name="pavcontentslider_module[<?php echo $module_row; ?>][text_interval]" value="<?php echo $module['text_interval']; ?>" size="3" /></td>
						</tr>
						

						<tr>
						  <td><?php echo $entry_width; ?></td>
						  <td><input type="text" id="banner_width" name="pavcontentslider_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="8" /></td>
						</tr>
						<tr>
						  <td><?php echo $entry_height; ?></td>
						  <td><input type="text" id="banner_height" name="pavcontentslider_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="8" /></td>
						</tr>
						
						<tr>
						  <td><?php echo $entry_image_navigator; ?></td>
						  <td><select name="pavcontentslider_module[<?php echo $module_row; ?>][image_navigator]">
							  <?php if ( isset($module['image_navigator']) && $module['image_navigator'] ) { ?>
							  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							  <option value="0"><?php echo $text_disabled; ?></option>
							  <?php } else { ?>
							  <option value="1"><?php echo $text_enabled; ?></option>
							  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							  <?php } ?>
							</select></td>
						</tr>
						<tr>
						  <td><?php echo $entry_navigator_width; ?></td>
						  <td><input type="text" name="pavcontentslider_module[<?php echo $module_row; ?>][navimg_weight]" value="<?php echo $module['navimg_weight']; ?>" size="8" /></td>
						</tr>
						<tr>
						  <td><?php echo $entry_navigator_height; ?></td>
						  <td><input type="text" name="pavcontentslider_module[<?php echo $module_row; ?>][navimg_height]" value="<?php echo $module['navimg_height']; ?>" size="8" /></td>
						</tr>
						</table>
		</div>
		<h3>List of Banner Images</h3>
        <div class="vtabs">
	
          <?php 
		  
	// 	  echo '<pre>'.print_r( $banner_image,1 ); die; 
		  $banner_row=1;
		  
		  foreach ($banner_image as $banner_row=> $banner) { ?>
          <a href="#tab-module-<?php echo $banner_row; ?>" id="module-<?php echo $banner_row; ?>"><?php echo $tab_module . ' ' . $banner_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $banner_row; ?>').remove(); $('#tab-module-<?php echo $banner_row; ?>').remove(); return false;" /></a>
 
          <?php } ?>
          <span id="module-add"><?php echo $this->language->get('add_module_banner'); ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
        <?php $banner_row = 1; ?>
        <?php foreach ($banner_image as $banner_row=> $banner) { ?>
        <div id="tab-module-<?php echo $banner_row; ?>" class="vtabs-content">
		
		 <table class="form">
		 
			 <tr>
				<td>Image</td>
			 <td class="left">
			 	<div class="image">
			 		<div class="image-preview">
			 			<img src="<?php echo $banner['thumb']; ?>" alt="" id="thumb<?php echo $banner_row; ?>" />
			 		</div>	

                  <input type="hidden" name="banner_image[<?php echo $banner_row; ?>][image]" value="<?php echo $banner['image']; ?>" id="image<?php echo $banner_row; ?>"  />
                  <br />
                  <a onclick="image_upload('image<?php echo $banner_row; ?>', 'thumb<?php echo $banner_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $banner_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $banner_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div>
              </td>
			</tr>
			<tr>
				<td>Link</td>
				<td><input name="banner_image[<?php echo $banner_row;?>][link]" value="<?php echo $banner['link']?>" type="text"/></td>
			</tr>
		  </table>
		  
          <div id="language-<?php echo $banner_row; ?>" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#tab-language-<?php echo $banner_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>

          <?php foreach ($languages as $language) { ?>
          <div id="tab-language-<?php echo $banner_row; ?>-<?php echo $language['language_id']; ?>">
    
      		<div class="clone-caption-layer">Add Caption</div>
         	<?php 
         		$j=0; foreach( $banner['title'][$language['language_id']]  as $ilayer => $captionlayer ) {  
         		$top 	= 	$banner['top'][$language['language_id']][$ilayer];
         		$left   = 	$banner['left'][$language['language_id']][$ilayer];
         		$ieffect = isset($banner['effect'][$language['language_id']][$ilayer])?($banner['effect'][$language['language_id']][$ilayer]):"";
         		$class  = 	isset($banner['class'][$language['language_id']][$ilayer])?$banner['class'][$language['language_id']][$ilayer]:"";
         	?>
         	<div class="caption-layer">
         	<a href="#" class="remove-caption-layer">Remove</a>
            <table class="form ">
			  <tr>
                <td><?php echo $this->language->get('text_caption'); ?>	</td>
                <td>
                	<div class="caption-layers">
                	<label><?php echo $this->language->get('entry_caption');?></label>
                	<textarea size="60" name="banner_image[<?php echo $banner_row; ?>][title][<?php echo $language['language_id']; ?>][]"   rows="3" cols="60"><?php echo $captionlayer ?></textarea>
               
                	<div class="layer-setting"><div>
        		 	<label><?php echo $this->language->get('entry_effect');?></label>
	                <select name="banner_image[<?php echo $banner_row; ?>][effect][<?php echo $language['language_id']; ?>][]">
	                	<?php foreach( $effects as $effect ) { ?>
	                		<option class="<?php echo $effect; ?>" <?php if( $effect == $ieffect ) {?> selected="selected" <?php } ?>><?php echo $effect; ?></option>
	                 	<?php } ?> 
	                </select>
<div class="typo-class">	                
<label><?php echo $this->language->get('entry_class');?></label>
<input size="46" value="<?php echo $class; ?>" name="banner_image[<?php echo $banner_row; ?>][class][<?php echo $language['language_id']; ?>][]"/>
<a href="#" class="insert-typo">Insert Typo</a>
</div>
<div class="slide-changer">
	<?php echo $this->language->get('entry_top');?><div class="slider-range" data-type="height"></div>
<input value="<?php echo $top; ?>" type="hidden" name="banner_image[<?php echo $banner_row; ?>][top][<?php echo $language['language_id']; ?>][]"/>
<span class="unit"></span></div>              	 	
              	 	<div class="slide-changer">
              	 		<?php echo $this->language->get('entry_left');?>
              	 		<div class="slider-range" data-type="width"></div>
						<input type="hidden" value="<?php echo $left; ?>"  name="banner_image[<?php echo $banner_row; ?>][left][<?php echo $language['language_id']; ?>][]"/>
						<span class="unit"></span>
					</div></div> <span class="caret"></span>
				</div></div>	
              	</td>
              </tr>
            </table></div>
            <?php } ?>
          </div>
          <?php } ?>
         
 
        </div>
 
        <?php $banner_row++; } ?>
      </form>
    </div>
  </div>
</div>
 <script type="text/javascript"> 

$("#content").delegate( '.remove-caption-layer', 'click', function(){
		if( $( ".caption-layer",  $(this).parent().parent() ).length <= 1 ){

			return false;
		}
	 (  $(this).parent().remove() );
	return false;
} ); 
$(function() {
	$(".slide-changer .slider-range").each( function(){
		var $parent = $(this).parent();
		var max = $(this).data("type") == 'height'? $("#banner_height").val(): $("#banner_width").val();
		$( ".slider-range", $parent ).slider({
				range: "min",
				value: $( "input",$parent ).val(),
				min: 1,
				max:max,
				slide: function( event, ui ) {
				 $( "input",$parent ).val(   ui.value );
				 $(".unit",$parent).html(  ui.value+"/"+ max + " px");
		} });
		 $(".unit",$parent).html(  $( "input",$parent ).val() + "/" + max  + " px");
	} );
	
});
</script>
<script type="text/javascript">
	 $("#content").delegate( ".insert-typo",'click',function(){   
	 	var $parent = $(this).parent();

		var field = 'input-layer-class';
		var $class = $( "input", $parent ).val();
 
		$('#dialog').remove();
		$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=module/pavcontentslider/typo&token=<?php echo $token;?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
			 
		$('#dialog').dialog({
				title: 'Typo Management',
				close: function (event, ui) {
					if( $('#dialog').data('selected-class')  ){
						$( "input", $parent ).val( $class + " " + $('#dialog').data('selected-class') );
					}
				},	
				bgiframe: false,
				width: 800,
				height: 500,
				resizable: false,
				modal: false
		});  
		return false; 
	});

</script>

<script type="text/javascript">
 $("#content").delegate( '.clone-caption-layer', 'click' , function(){
 	 	var $parent = $(this).parent();
 	 	var captionLayer = $(".caption-layer", $parent).clone();
 	 	$( $parent ).append(  captionLayer );
 } );
 </script>
<script type="text/javascript"><!--
var banner_row = <?php echo $banner_row; ?>;

function addModule() {	
	
	var bannerID ='tab-module-' + banner_row;

	html  = '<div id="tab-module-' + banner_row + '" class="vtabs-content">';

	
	html += '<table class="form"><tr><td>Image</td><td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + banner_row + '" /><input type="hidden" name="banner_image[' + banner_row + '][image]" value="" id="image' + banner_row + '" /><br /><a onclick="image_upload(\'image' + banner_row + '\', \'thumb' + banner_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + banner_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + banner_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '<tr><td>Link</td><td><input name="banner_image['+banner_row+'][link]" type="text" value=""/></td></tr>';
	html += '</table>';
		html += '  <div id="language-' + banner_row + '" class="htabs">';
    <?php foreach ($languages as $language) { ?>
    html += '    <a href="#tab-language-'+ banner_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
    <?php } ?>
	html += '  </div>';
	<?php foreach ($languages as $language) { ?>
	html += '    <div id="tab-language-'+ banner_row + '-<?php echo $language['language_id']; ?>">';
	html += '      <div class="clone-caption-layer">Add Caption</div><div class="caption-layer">';
	html += ' <a href="#" class="remove-caption-layer">Remove</a> ';
	html += '<table class="form">';
	html += '<tr>';
	html += '<td><?php echo $this->language->get('text_caption'); ?></td><td>';
	html += '<div class="caption-layers">';
	html += '<label><?php echo $this->language->get('entry_caption'); ?></label>';
	html += '<textarea cols="60" rows="3"  name="banner_image[' + banner_row + '][title][<?php echo $language['language_id']; ?>][]"></textarea>';
	html += '<div class="layer-setting"><div>';
	html += '  <label><?php echo $this->language->get('entry_effect');?></label>';
	html += '  <select name="banner_image[<?php echo $banner_row; ?>][effect][<?php echo $language['language_id']; ?>][]">';
 	<?php foreach( $effects as $effect ) { ?>
	html += ' <option class="<?php echo $effect; ?>"><?php echo $effect; ?></option>';
	<?php } ?> 
	html += ' </select> ';

	html += '<div class="typo-class">';
	html += '<label><?php echo $this->language->get('entry_class'); ?></label>';
	html += '<input name="banner_image[' + banner_row + '][class][<?php echo $language['language_id']; ?>][]" size="45" type="text"/>';
	html += '<a href="#" class="insert-typo">Insert Typo</a></div>';

	html += '<div class="slide-changer">';
	html += '<?php echo $this->language->get('entry_top');?><div class="slider-range" data-type="height"></div>';
	html += '<input type="hidden" name="banner_image[' + banner_row + '][top][<?php echo $language['language_id']; ?>][]"  type="text"/>';
	html += '<span class="unit"></span></div>';
	html += '<div  class="slide-changer">';
	html += '<?php echo $this->language->get('entry_left');?><div class="slider-range" data-type="width"></div>';
	html += '<input type="hidden" name="banner_image[' + banner_row + '][left][<?php echo $language['language_id']; ?>][]"  type="text"/>';
	html += '<span class="unit"></span></div>';
	html += '	</div> <span class="caret"></span>';
	html += '	</div></div>';
 	
	html += ' </td>';
	html += '        </tr>';
	html += '      </table></div>';
	html += '    </div>';
	<?php } ?>
	html += '</div>';
	
	$('#form').append(html);
	
 	$("#"+bannerID+" .slide-changer .slider-range").each( function(){
		var $parent = $(this).parent();
		var max = $(this).data("type") == 'height'? $("#banner_height").val(): $("#banner_width").val();
		$( ".slider-range", $parent ).slider({
				range: "min",
				value: $( "input",$parent ).val(),
				min: 1,
				max:max,
				slide: function( event, ui ) {
				 $( "input",$parent ).val(   ui.value );
				 $(".unit",$parent).html(  ui.value+"/"+ max + " px");
		} });
		 $(".unit",$parent).html(  $( "input",$parent ).val() + "/" + max  + " px");
	} );
	
	$('#language-' + banner_row + ' a').tabs();
	
	$('#module-add').before('<a href="#tab-module-' + banner_row + '" id="module-' + banner_row + '"><?php echo $tab_module; ?> ' + banner_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + banner_row + '\').remove(); $(\'#tab-module-' + banner_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#module-' + banner_row).trigger('click');
	
	banner_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $banner_row = 1; ?>
<?php foreach ($banner_image as $banner) { ?>
$('#language-<?php echo $banner_row; ?> a').tabs();
<?php $banner_row++; ?>
<?php } ?> 
//--></script> 

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value'))+"&width=600",
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<?php echo $footer; ?>
