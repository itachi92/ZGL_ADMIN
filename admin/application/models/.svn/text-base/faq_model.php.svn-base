<?php
if (!defined('BASEPATH'))
  exit('No direct script access allowed');

class Faq_model extends CI_model
{
  public $user_db = "ym_user";
  public $faq_db = "ym_faq";
  
    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 根据问题编号获取问题信息
     * @param int $fid,问题编号
     * @return array | int
     * */
  function get_faq_by_fid($fid = 0) {
    if (empty($fid)) {
      return -1;
    }
    
    $where = array('ym_fid' => $fid);
    $query = $this->db->get_where($this->faq_db,$where,1);
    if ($query->num_rows() > 0) {
      $result = $query->row_array();
      
      return $result;
    }
    
    return 0;
    }
    
   /**
    * 根据用户编号获取单个用户信息
    * @param number $id
    * @return number|array
    * */
   function get_user_by_id($id = 0) {
      if (empty($id)) {
        return -1;
      }
      
      $where = array('ym_id' => $id);
      $query = $this->db->get_where($this->user_db,$where,1);
      if ($query->num_rows() > 0) {
        $result = $query->row_array();
          
        return $result;
      }
      
      return 0;
   }
   
   /**
    * 根据问题编号获取问题“树结构”中的单个元素
    * @param number $fid
    * @param array $tree,get_faq_tree方法处理后得到的结果
    * @return array
    * */
   function get_faq_tree_item($fid = 0,$tree = array()) {
      if (empty($fid) or  empty($tree)) {
        return -1;
      }
      
      $result = array();
      
      foreach ($tree as $k => $v) {
        if ($v['ym_fid'] == $fid) {
          $result = $v;
        }
      }
      
      return $result;
   }
   
   /**
    * 获取问题信息“树结构”
    * @param string $admin_id
    * @param number $parentid
    * @param unknown $result
    * @return number|unknown  */
   function get_faq_tree($admin_id = NULL,$parentid = 0, &$result = array()) {
      if (empty($admin_id)) {
        return -1;
      }
       
      $where = array(
          'ym_admin_id' => $admin_id,
          'ym_parentid' => $parentid
            
      );
      $query = $this->db->get_where($this->faq_db,$where);
      if ($query->num_rows() > 0) {
        $arr = $query->result_array();
        foreach ($arr as $cm) {
          $thisArr= &$result[];
          $cm["children"] = $this->get_faq_tree($admin_id,$cm["ym_fid"],$thisArr);
          $thisArr = $cm;
        }
        return $result;
      }
      
      return 0;// 结果为空
   }

   public function get_top_fids($admin_id = NULL)
   {
      if (empty($admin_id)) {
        return -1;
      }

      $where = array(
          'ym_admin_id' => $admin_id,
          'ym_parentid' => 0
      );

      $query = $this->db->select('ym_fid')->get_where($this->faq_db,$where);
      if ($query->num_rows() > 0) {
        $result = $query->result_array();
        return $result;
      }
      return 0;// 结果为空
   }

   /**
    * 根据管理员编号和问题状态获取问题信息编号
    * @param number $status
    * @param integer $admin_id
    * @return number|array  
    * */
   function get_fids_by_status($status = 0,$admin_id = NULL) {
      if (empty($admin_id)) {
        return -1;
      }
      
      $where = array(
          'ym_status' => $status,
          'ym_admin_id' => $admin_id
      );
      $query = $this->db->select('ym_fid')->get_where($this->faq_db,$where);
      if ($query->num_rows() > 0) {
        $result = $query->result_array();
        return $result;
      }
      return 0;// 结果为空
   }
   
   /**
    * 根据问题编号获取组合信息（用户+问题）
    * @param int|array $fid，问题编号，可以为数组，也可以为单个的数字
    * @param number $flag，标志位，为1时循环获取组合信息；为0时获取单个组合信息
    * @return array|int
    * */
   function get_combine_by_fid($fid = NULL,$flag = 0) {
      if (empty($fid)) {
        return -1;// 参数错误
      }

      $result = array();
      
      if ($flag == 1) {
        foreach ($fid as $k => $v) {
          $result[$k] = $this->get_combine_by_fid($v['ym_fid'],0);
        }
        return $result;
      }

      // $faq_item = $this->get_faq_by_fid($fid['ym_fid']);
      $faq_item = $this->get_faq_by_fid($fid);

      if ($faq_item) {
        $user_item = $this->get_user_by_id($faq_item['ym_user_id']);
        if ($user_item) {
          $result['faq'] = $faq_item;
          $result['user'] = $user_item;

          return $result;
        }
        return -2;// 用户不存在
      }
      return -3;// 问题不存在
   }
   
   function test($admin_id = NULL){

   }

   /**
    * 编辑问题信息，更新回复
    * @param number $admin_id
    * @param number $fid
    * @param string $reply
    * @param number $status
    * @return number  
    * */
   function edit_faq($admin_id = 0,$fid =0,$reply = '',$status = 0) {
      if (empty($fid) or empty($admin_id) or empty($reply)) {
        return -1;
      }
      
      $content = array(
          'ym_admin_id' => $admin_id,
          'ym_reply' => $reply,
          'ym_status' => $status
      );
      $this->db->where('ym_fid',$fid);
      $this->db->update($this->faq_db,$content);
       
      return $this->db->affected_rows();
   }
   
    public function add_faq($admin_id = 0,$fid =0,$reply = '')
    {
        if (empty($fid) or empty($admin_id) or empty($reply)) {
          return -1;
        }

        $where = array("ym_fid"=>$fid);
        $query = $this->db->get_where($this->faq_db,$where,1);
        if ($query->num_rows() > 0) 
        {
          $result = $query->row_array();

          if (empty($result['ym_reply'])) {
              return $this->edit_faq($admin_id,$fid,$reply,1);
          }else{
              $data = array(
                'ym_user_id' => $result['ym_user_id'],
                'ym_admin_id' => $result['ym_admin_id'],
                'ym_title' => $result['ym_title'],
                'ym_faq' => 'test',//测试使用，需要修改
                'ym_reply' => $reply,
                'ym_faq_type' => $result['ym_faq_type'],
                'ym_status' => 1,
                'ym_parentid' => $result['ym_fid'],
                'ym_reply_time' => time()
              );

              $this->db->insert($this->faq_db, $data);
              return $this->db->insert_id();
          }
        }
        return 0;// 结果为空
    }

   /**
    * 更新问题的状态，“已解决”
    * @param number $admin_id
    * @param number $fid
    * @param number $status
    * @return number  */
   function update_faq_status($admin_id = 0,$fid =0,$status = 0) {
      if (empty($fid) or empty($admin_id) or empty($status)) {
        return -1;
      }
       
      $content = array(
          'ym_admin_id' => $admin_id,
          'ym_status' => $status
      );
      $this->db->where('ym_fid',$fid);
      $this->db->update($this->faq_db,$content);
      
      return $this->db->affected_rows();
   }
   
}

/* End of file faq_model.php */
/* Location: ./application/models/faq_model.php */