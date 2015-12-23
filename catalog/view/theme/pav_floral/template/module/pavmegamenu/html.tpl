<?php if( isset($widget_name)){
?>
<span class="menu-title"><?php echo $widget_name[$this->config->get('config_language_id')];?></span>
<?php
}?>
<div class="widget-html">
	<div class="widget-inner">
		<?php echo $html; ?>
	</div>
</div>