<?php
class ControllerModulePavcontentslider extends Controller {
	private $error = array(); 
	 
	public function index() {   
		$this->language->load('module/pavcontentslider');
		$this->load->model('tool/image');
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		
			
			$this->request->post['pavcontentslider_module'][0]['banner_image'] = 	$this->request->post['banner_image'];
			unset($this->request->post['banner_image']);
			
	
			$this->model_setting_setting->editSetting('pavcontentslider', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('module/pavcontentslider', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
 		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');			
				
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_width'] = $this->language->get('entry_width');
		$this->data['entry_height'] = $this->language->get('entry_height');
		
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);		
		$this->data['entry_show_image'] = $this->language->get( 'entry_show_image' );
		$this->data['entry_module_title'] = $this->language->get( 'entry_module_title' );
		$this->data['tab_module'] = $this->language->get('tab_module_banner');
		$this->data['entry_image_navigator'] = $this->language->get( 'entry_image_navigator' );
		$this->data['entry_navigator_width'] = $this->language->get( 'entry_navigator_width' );
		$this->data['entry_navigator_height'] = $this->language->get( 'entry_navigator_height' );
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/pavcontentslider', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/pavcontentslider', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];

		$this->data['modules'] = array();
		$this->data['positions'] = array( 'mainmenu',
										  'slideshow',
										  'promotion',
										  'content_top',
										  'column_left',
										  'column_right',
										  'content_bottom',
										  'mass_bottom',
										  'footer_top',
										  'footer_center',
										  'footer_bottom'
		);
		
		$d = array('layout_id'=>'','position'=>'','status'=>'','sort_order'=>'1',
		'banner_image'=>array(),'width'=>940,'height'=>350,
		'image_navigator' => 0,
		'navimg_height'   =>97,
		'navimg_weight'   =>177,
		'text_interval'=>8000
		);

		$this->data['effects'] = array('slideUp','slideDown','slideLeft',
					'slideRight','slideExpandUp','expandUp','fadeIn',
					'expandOpen','bigEntrance','hatch','bounce',
					'pulse','floating','tossing','pullUp','pullDown','stretchLeft','stretchRight'
					);
		if (isset($this->request->post['pavcontentslider_module'])) {
			$this->data['modules'] = $this->request->post['pavcontentslider_module'];
		} elseif ($this->config->get('pavcontentslider_module')) { 
			$this->data['modules'] = $this->config->get('pavcontentslider_module');
		}	
		if( !empty($this->data['modules']) ){
			 $d = array_merge($d,$this->data['modules'][0]);			
		}
		$this->data['module'] = $d;
		if( $d['banner_image'] ){
			$tmp = array();$i=1;
			foreach( $d['banner_image'] as $key => $banner ){
				$banner['link'] = isset($banner['link'])?trim($banner['link']):"";
				$banner['thumb'] = $this->model_tool_image->resize($banner['image'], 100, 100);
				$tmp[$i++] = $banner;
			}
			 $d['banner_image'] = $tmp;
		}

		$this->data['banner_image'] = $d['banner_image'];
		$this->load->model('design/layout');
		$this->data['layouts'][] = array('layout_id'=>99999, 'name' => $this->language->get('all_page') );
		
		$this->data['layouts'] = array_merge($this->data['layouts'],$this->model_design_layout->getLayouts());
		
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		$this->document->addStyle('view/stylesheet/pavcontentslider.css');
		$this->template = 'module/pavcontentslider.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function typo(){

		if (isset($this->request->get['field'])) {
			$this->data['field'] = $this->request->get['field'];
		} else {
			$this->data['field'] = '';
		}
 
	 
	 	$typoFile = 	HTTP_CATALOG."catalog/view/theme/default/stylesheet/pavcontentslider.css";	
		if( file_exists( DIR_CATALOG ."view/theme/". $this->config->get('config_template')."/stylesheet/pavcontentslider.css" ) ){
			$typoFile = 	HTTP_CATALOG."catalog/view/theme/". $this->config->get('config_template')."/stylesheet/pavcontentslider.css";	
		}
		$content = file_get_contents(  $typoFile );

		$this->data['typoFile'] = $typoFile; 
		$data = preg_match_all("#\.pav-caption\.([\w\-]+)\s*{\s*#", $content, $matches);
	
	
		$this->data['captions'] = array();

		if( isset($matches[1]) ){
			$this->data['captions']  = $matches[1];
		}  	

		 
		$this->template = 'module/pavcontentslider_typo.tpl';
		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/pavcontentslider')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if( !isset($this->request->post['banner_image']) ){
			$this->error['warning'] = $this->language->get('error_missing_banner');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
