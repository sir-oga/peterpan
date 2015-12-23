<?php  
class ControllermodulePavcontentslider extends Controller {
	protected function index( $setting ) {
	
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavcontentslider.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/pavcontentslider.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/pavcontentslider.css');
		}
		$a = array('interval'=> 8000,'auto_play'=>0 );
		$setting = array_merge( $a, $setting );

		$this->data['banners'] = array();
		$this->data['setting'] = $setting;
		$this->data['auto_play'] = $setting['auto_play']?"true":"false";
		$this->data['auto_play_mode'] = $setting['auto_play'];
		$this->data['interval'] = (int)$setting['interval'];
		$langID = $this->config->get('config_language_id');
		if( isset($setting['banner_image'])){
			foreach( $setting['banner_image'] as $banner ){
				$banner['thumb'] = $this->model_tool_image->resize($banner['image'], $setting['width'], $setting['height']);
				$banner['layers'] = array();
				if( isset($banner['title'][$langID]) && is_array($banner['title'][$langID]) ){
					foreach( $banner['title'][$langID] as $ilayer => $caption ) {
						$layer = array();
						$layer['caption'] =  html_entity_decode( $caption, ENT_QUOTES, 'UTF-8') ;
						$layer['effect'] =  isset($banner['effect'][$langID][$ilayer])?$banner['effect'][$langID][$ilayer]:"";
						$layer['class'] =  isset($banner['class'][$langID][$ilayer])?$banner['class'][$langID][$ilayer]:"normal-caption";
						$layer['top'] =  isset($banner['top'][$langID][$ilayer])?$banner['top'][$langID][$ilayer]:"";
						$layer['left'] =  isset($banner['left'][$langID][$ilayer])?$banner['left'][$langID][$ilayer]:"";
						$banner['layers'][] = $layer;
					}
				}
				$banner['title'] = isset($banner['title'][$langID])?str_replace(array("&lt;","&gt;"),array("<",">"),$banner['title'][$langID]):"";
				$banner['description'] = isset($banner['description'][$langID])?str_replace(array("&lt;","&gt;"),array("<",">"),$banner['description'][$langID]):"";
				$banner['title'] = (is_array($banner['title'])&&isset($banner['title'][0]))?$banner['title'][0]:'';
				if( isset($setting['image_navigator']) && $setting['image_navigator'] ){ 
					$banner['image_navigator'] =  $this->model_tool_image->resize($banner['image'], $setting['navimg_weight'], $setting['navimg_height'], 'w' );
				}else {
					$banner['image_navigator'] = '';
				}
				$this->data['banners'][] = $banner;
			}
		}

		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pavcontentslider.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/pavcontentslider.tpl';
		} else {
			$this->template = 'default/template/module/pavcontentslider.tpl';
		}
		
		$this->render();
	}
}
?>
