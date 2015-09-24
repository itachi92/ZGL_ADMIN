<?php
/**
 *  Index_model
 *  操作admin_user和admin_password数据表
 * @author huanglongjian
 */
class Index_model extends CI_model
{

    private  $salt = "";// 密码加盐
    
    function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->config->load('secret');
        $this->salt = $this->config->item('auth_key');
    }

//     /**
//      * 获取用户信息
//      * @param string $email
//      * @return  FALSE| array
//      */
//     public function get_user_by_name($email, $pwd)
//     {
//         $this->select('user_id,realname,email,status');
//         $user = $this->select_one('ym_admin_user', array('email' => $email));
//         if (empty($user) || $user['status'] == 1)
//         {
//             return FALSE;
//         } else
//         {
//             $this->select('password, authstr');
//             $ident = $this->select_one('ym_admin_passwd', array('user_id' => $user['user_id']));
            
//             $this->config->load('secret');
//             $salt = $this->config->item('auth_key');         
//             if ($ident['password'] == md5(md5($pwd) . $ident['authstr'] . $salt))
//             {
//                 return $user;
//             } else
//             {
//                 return FALSE;
//             }
//         }
//     }

    /**
     * 根据用户名（手机号）获取用户信息
     * @param string $username
     * @return boolean|array|number  
     * */
    function get_user_by_name($username = NULL) {
        if (empty($username)) {
            return FALSE;// 缺少必要参数
        }
        
        $data = array();
        
        //  获取用户信息
        $query = $this->db->get_where("ym_admin_user",array("phone" => $username),1);
        if ($query ->num_rows() > 0) {
             $data = $query->row_array();
             
             return $data;
        }
        
        return 0;
    }
        
    /**
     * 验证密码合法性
     * @param string $user_id
     * @param string $passwd
     * @return boolean|number  
     * */
    function check_passwd($user_id = NULL,$passwd = NULL) {
        if (empty($user_id)) {
            return FALSE;// 缺少必要参数
        }
        
        //  获取用户密码
        $query = $this->db->get_where("ym_admin_passwd",array("user_id" => $user_id),1);
        if ($query->num_rows() > 0) {
            $result = $query->row_array();
            
            if ($result['password'] == md5(md5($passwd).$this->salt)) {
                return TRUE;
            }
            
            return FALSE;
        }
        
        return 0;
    }

    /**
     * 根据传入的用户手机号、密码添加用户
     * @param string $phone，用户手机号
     * @param string $password，用户密码
     * @return boolean|number  
     * */
    function add_user($phone,$password) {
        if (empty($phone) or empty($password))
            return FALSE;// 缺少必要参数
        
        // 判断用户名是否已存在[待修改，用户名可以是手机号或邮箱]
        $check = $this->db->get_where("ym_admin_user",array("phone" => $phone));
        if ($check->num_rows() > 0) {
            return 0;// 用户名已存在
        }
        
        // 添加用户
        $data = array(
                'email'=> $phone."@zgl.com",
                'phone' => $phone,
                'add_time' =>  time()
        );
        $this->db->insert("ym_admin_user",$data);
        $user_id = $this->db->insert_id();
        
        if ($user_id) {
            $pwd = md5(md5($password).$this->salt);
            $data = array(
                    'user_id' => $user_id,
                    'password' => $pwd
            );
            
            $this->db->insert("ym_admin_passwd",$data);
            $pw_id = $this->db->insert_id();
            if ($pw_id)
                return $user_id;
        }
        
        return -1;  
    }
}

/* End of file index_model.php */
/* Location: ./application/models/index_model.php */