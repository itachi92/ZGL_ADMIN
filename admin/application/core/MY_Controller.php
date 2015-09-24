<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class MY_Controller extends CI_Controller
{

    public $_login_user = array();

    public function __construct()
    {
        parent::__construct();
        $this->sys_init();
    }

    /**
     * 加载控制器的初始化操作
     */
    final public function sys_init()
    {
        $this->check_priv();
    }

    /**
     * 判断用户是否登录，以及权限 
     */
    public function check_priv()
    {
        //$_SERVER['PATH_INFO'] = str_replace('','', $_SERVER['PATH_INFO'], 1);

        // http://localhost/zgl_admin/index.php/index/index
        // /index/index
        $path_info = strtolower($_SERVER['PATH_INFO']);
        $path_info = str_replace('/index.php', '', $path_info);
// var_dump($path_info);
// exit;
        if (!empty($path_info))
        {
            // $path_info = strtolower($_SERVER['PATH_INFO']);
            // $path_info = str_replace('/index.php', '', $path_info);

            // 不允许对验证码进行直接操作
            if ($path_info == '/index/vcode')
            {
                return true;
            }
// var_dump($path_info);
// exit;
            // session中不存在用户信息，允许进行登录或访问后台的操作
            if (empty($_SESSION['id']) && ($path_info == '/index/login' || $path_info == '/index/index'))
            {
                return true;
            }

            // session中不存在用户信息，进行除[登录或访问后台操作]以外的操作，都会被重定向到“后台登录”
            // 只允许进行登录或者访问登录页面
            // if (empty($_SESSION['id']) && ($path_info != '/index/login' || $path_info != '/index/index'))
            // {
            //     $redirect_url = site_url('index/index');
            //     header('Location: '.$redirect_url);
            //     exit;
            // }

            // session中存在用户信息，进行登录或访问后台的操作，会被直接重定向到后台首页
            if (!empty($_SESSION['id']) && ($path_info == '/index/login' || $path_info == '/index/index'))
            {
                $redirect_url = site_url('index/main');
                header('Location: '.$redirect_url);
                exit;
            }
        } else
        {
            //  http://localhost/zgl_admin/index.php
            //  session中存在用户信息，访问后台时直接定向到后台首页
            if (!empty($_SESSION['id']))
            {
                $redirect_url = site_url('index/main');
                header('Location: '.$redirect_url);
                exit;
            }
        }

        return true;
    }

}

/* End of file MY_Controller.php */
/* Location: ./application/core/MY_Controller.php */