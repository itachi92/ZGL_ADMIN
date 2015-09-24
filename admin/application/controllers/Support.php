<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Support extends CI_Controller
{
  public $data = array();// 分配给模板的数据

    function __construct()
    {
        parent::__construct();
        $this->load->model('faq_model','faq');
        $this->view_data();
    }

    function view_data() {
      $this->data = array(
          'title' => '',
          'css' => array(
            'base' => base_url('static/test/css/base.css'),
            'css' => base_url('static/test/css/css.css'),
          ),
          'js' => array(
            'jquery' => base_url('static/test/js/jquery.15.9.17.js'),
            'jquery_min' => base_url('static/test/js/jquery-1.8.3.min.js'),
          ),
          'url' => array(
              'new' => site_url('/Support/list_new_faq'),
              'my' => site_url('/Support/list_my_faq'),
              'done' => site_url('/Support/list_done_faq'),
              'detail' => site_url('/Support/detail_faq'),
          ),
          'nav' => '',// nav_new,nav_my,nav_done
          'content' => array()
      );
    }
    
    function list_new_faq() {
      $faqs_fid = $this->faq->get_fids_by_status(0,1);

      if ($faqs_fid) {
        $result =$this->faq->get_combine_by_fid($faqs_fid,1);
      }
      
      $this->data['content'] = isset($result) ? $result : '';
      $this->data['nav'] = 'nav_new';
      $this->load->view('/support/new_faq_list',$this->data);
//      print_r($this->data);
    }
    
    /*function list_my_faq() {
      //$admin_id = 2;
      $admin_id = intval($_SESSION['id']);

      $faqs_fid = $this->faq->get_fids_by_status(1,$admin_id);

      if ($faqs_fid) {
        $result =$this->faq->get_combine_by_fid($faqs_fid,1);
      }
      
      $this->data['content'] = isset($result) ? $result : '';
      $this->data['nav'] = 'nav_my';
      //print_r($this->data);
      $this->load->view('/support/my_faq_list',$this->data);
    }*/
    
    function list_my_faq()
    {
        $admin_id = intval($_SESSION['id']);
        // $admin_id = 4; //测试使用
        $faqs_fid = $this->faq->get_top_fids($admin_id);

        if ($faqs_fid) {
          $result =$this->faq->get_combine_by_fid($faqs_fid,1);
        }
// print_r($result);exit;
        $this->data['content'] = isset($result) ? $result : '';
        $this->data['nav'] = 'nav_my';
        //print_r($this->data);
        $this->load->view('/support/my_faq_list',$this->data);
    }

    function list_done_faq() {
      // $admin_id = 2;
      $admin_id = intval($_SESSION['id']);
      $faqs_fid = $this->faq->get_fids_by_status(2,$admin_id);
      if ($faqs_fid) {
        $result =$this->faq->get_combine_by_fid($faqs_fid,1);
      }
      
      $this->data['content'] = isset($result) ? $result : '';
      $this->data['nav'] = 'nav_done';
      //print_r($this->data);
      $this->load->view('/support/done_faq_list',$this->data);
    }
    
    function detail_faq($fid = 0) {
      if (empty($fid)) {
        return -1;
      }
      
      $fid = intval($fid);
      $result = $this->faq->get_combine_by_fid($fid);
      $this->data['url']['reply'] = site_url("/support/t2");// 2015924测试
      $this->data['content'] = isset($result) ? $result : '';
      
      $this->load->view('/support/new_faq_detail',$this->data);
    }
    
    function reply($fid = 0) {
      if (empty($fid)) {
        return -1;
      }
      
      if ($this->input->post('submit')) {
        $reply = trim($this->input->post('reply'));
      $admin_id = intval($_SESSION['id']);
      //$admin_id = 2; //测试使用
      $fid = intval($fid);
      $status = 1;
      
      $result = $this->faq->edit_faq($admin_id,$fid,$reply,$status);
      $this->data['reply'] = isset($result) ? '回复成功' : '回复失败';
      
      echo $this->data['reply'];
      }
    }

    function done($fid = 0) {
      if (empty($fid)) {
        return -1;
      }
      
      $admin_id = intval($_SESSION['id']);
      //$admin_id = 2; //测试使用
      $fid = intval($fid);
      $status = 2;
          
      $result = $this->faq->update_faq_status($admin_id,$fid,$status);
      $this->data['done'] = isset($result) ? '处理成功' : '处理失败';
          
      echo $this->data['done'];
    }
    
    /*测试生成有效显示数据*/
    function test() {
      //$admin_id = intval($_SESSION['id']);
      $admin_id = 4; //测试使用
      $my_faqs = $this->faq->get_faq_tree($admin_id);
      //print_r($my_faqs);exit;
      $faqs = $this->faq->get_faq_tree_item(3,$my_faqs);
    print_r($faqs);exit;
      
    }

    /*测试回复*/
    function t2($fid = 0)
    {
      if (empty($fid)) {
        return -1;
      }
      
      if ($this->input->post('submit')) {
        $reply = trim($this->input->post('reply'));
        $admin_id = intval($_SESSION['id']);
        //$admin_id = 2; //测试使用
        $fid = intval($fid);
        $status = 1;

        $result = $this->faq->add_faq($admin_id,$fid,$reply);
        $this->data['reply'] = isset($result) ? '回复成功' : '回复失败';

        echo $this->data['reply'];
      }
    }
/*    public function nav()
    {
      $url = $this->input->server("HTTP_REFERER");
      $result = explode("/",$url);
      $now_nav = array_pop($result);
      
    }*/
}

/* End of file Support.php */
/* Location: ./application/controllers/Support.php */