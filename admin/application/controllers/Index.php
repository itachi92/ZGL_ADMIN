<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
  +------------------------------------------------------------------------------
 * index.php   首页 登陆 退出
  +------------------------------------------------------------------------------
 */
class Index extends CI_Controller
{

    public $user = array();
    public $_data = array();
    private $result = array('status' => 0,'message' => '','data' => array());// 返回给视图的结果数组
    
    function __construct()
    {
        parent::__construct();
        $this->load->model('Index_model','index');
    }

    /**
     * 后台登录页面
     */
    public function index()
    {
/*        $data = array();

        //记住密码： 一个用户同时登录多个帐号时会出现问题
        if ($this->input->cookie('remember')) {
            $cookie = unserialize($this->input->cookie('remember'));
             
            $data = array(
                    'id' => $cookie['id'],
                    'phone' => $cookie['phone'],
                    'password' => $cookie['password']
            );
             
            $this->load->view('index',$data);
        }

        $this->load->view('index',$data);*/
        $this->sv('index');
    }
    
    /**
     * sv，show view的缩写，根据传入的视图名称和模板显示数据装载视图显示
     * @param  string $viewName 视图名称
     * @param  array  $data     视图数据
     */
    public function sv($viewName = "",$data = array(''))
    {
        if (empty($viewName)) {
            return FALSE;
        }
// var_dump($viewName);exit;
        if ($viewName == 'index') {
            //记住密码： 一个用户同时登录多个帐号时会出现问题
            if ($this->input->cookie('remember')) {
                $cookie = unserialize($this->input->cookie('remember'));
                 
                $data = array(
                        'id' => $cookie['id'],
                        'phone' => $cookie['phone'],
                        'password' => $cookie['password']
                );
                 
                $this->load->view($viewName,$data);
            }else{
                $this->load->view($viewName);
            }
        }else{
            $this->load->view($viewName,$data);
        }
    }

    /**
     * 处理用户登录  
     * */
    function login() 
    {
        $phone = $this->input->post('phone');
        $pwd = $this->input->post('password');
        $remember = $this->input->post('automatic');
         
        if (empty($phone) or empty($pwd)) {
            $this->result['status'] = -2;
            $this->result['message'] = "输入信息为空";
            echo json_encode($this->result);
            exit;
        }
         
        $user = $this->index->get_user_by_name($phone);
        if ($user) {
            $status = $this->index->check_passwd($user['user_id'],$pwd);
        
            if ($status) {
                // 返回信息
                $this->result['status'] = 1;
                $this->result['message'] = "用户合法";
                $data = array(
                        'id' => $user['user_id'],
                        'name' => $user['phone'],
                        'email' => $user['email'],
                        'login_time' => time()
                );
                $this->result['data'] = $data;
                    
                // 用户信息存入session
                $_SESSION['id'] = $user['user_id'];
                $_SESSION['name'] = $user['phone'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['login_time'] = $data['login_time'];
                
                // 记住密码
                if ($remember == 1){
                    $cookie_data = array(
                            'id' => $user['user_id'],
                            'phone' => $user['phone'],
                            'email' => $user['email'],
                            'password' => $pwd
                    );
                    $cookie = serialize($cookie_data);
                    $cookie_setting = array(
                            'name' => 'remember',
                            'value' => $cookie,
                            'expire' => '865000'
                    );
                    $this->input->set_cookie($cookie_setting);
                }
                
                header("location:".site_url('/Support/list_new_faq'));
                exit;
                //$this->main();
                //echo json_encode($this->result);
                //exit;
            }else {
                // 返回信息
                $this->result['status'] = 0;
                $this->result['message'] = "用户密码错误";
                    
                echo json_encode($this->result);
                exit;
            }
        }else {
            // 返回信息
            $this->result['status'] = -1;
            $this->result['message'] = "用户不存在";
        
            echo json_encode($this->result);
            exit;
        }
        
        return FALSE;
    }
    
    /**
     *   处理用户注册
     **/
    function register() {
        $phone = $this->input->post('phone');
        $pwd = $this->input->post('password');
        if (empty($phone) or empty($pwd)) {
            $this->result['status'] = -2;
            $this->result['message'] = "输入信息为空";
            echo json_encode($this->result);
            exit;
        }
        
        $data = $this->index->add_user($phone,$pwd);
        if ($data > 0) {
            $this->result['status'] = 1;
            $this->result['message'] = "用户注册成功！";
            echo json_encode($this->result);
            exit;
        }elseif ($data === 0){
            $this->result['status'] = 0;
            $this->result['message'] = "用户名已存在，请输入其他用户名！";
            echo json_encode($this->result);
            exit;
        }else{
            $this->result['status'] = -1;
            $this->result['message'] = "用户注册失败！";
            echo json_encode($this->result);
            exit;
        }   
    }

    /**
     * 后台主页
     */
    public function main()
    {
        $data = array();
        $this->load->view('main', $data);
    }

    /**
     * 左侧菜单
     */
    public function menu_left()
    {
        echo '<h4>用户支持 </h4>';
    }


    /**
     * 退出
     */
    function logout()
    {
        $_SESSION = array();
        if (isset($_COOKIE[session_name()]))
        {
            setcookie(session_name(), '', time() - 42000, '/');
        }
        session_destroy();

        header("location:".site_url('/Index/index'));
    }


    public function test()
    {
        echo "test";
        echo "<br />".base_url("static/icons/edit.png");;
    }

}

/* End of file Index.php */
/* Location: ./application/controllers/Index.php */