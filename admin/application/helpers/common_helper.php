<?php
    // 具体逻辑步骤：
    // Ⅰ.判断用户是否登录
    //      根据用户名，检查用户数据表status字段的值，为0允许登录，为1不允许登录
    //      (用户已登录，不允许再次登录；用户帐号被禁用，不允许登录)
    //      （这种方式则需要在用户退出时更新数据表的status字段的值为0）
    //      -----未登录，则进行下一步操作
    //      -----已登录，直接返回用户信息
    
    // Ⅱ.判断用户是否存在
    //      ------用户存在，则进行下一步操作
    //      ------用户不存在，提示用户名或密码错误
    
    // Ⅲ.判断用户是否允许登录（用户名或密码输入错误5次进行封号操作）
    //      -----不允许登录，提示“您的帐号已锁定，请联系管理员，重新激活用户！”
    //          （根据用户名获取用户信息，当前剩余允许尝试登录的次数，次数为0时限制用户登录，更新status为1）
    //          （激活用户，重新将允许登录次数更新为5）
    //      -----允许都登录，则进行下一步操作

    // Ⅳ.判断用户是否合法（密码是否正确）
    //      ------用户合法，登录成功，返回用户信息，登录状态存入session
    //      ------用户不合法，提示用户名或密码错误，更新“允许尝试登录的次数”（错误时允许登录次数-1，设置数据表尝试次数默认为5）
    
    public function check_login($username,$password)
    {

        // status 用户帐号状态
        // times 用户允许登录的次数
        // info 用户信息
        $data = array( 'status' => '','times' => '','info' =>'');
        $this->load->model('Index_model','index');


        // 判断用户是否存在
        $user_info = $this->index->get_user_by_username($username,$password);
        $data['status'] = $user_info['status'];
        $data['times'] = $user_info['error_login_try_time'];

        if ($user_info) {
            // 判断用户是否允许登录
            if (intval($data['status']) == 1 || intval($data['times']) == 0) {
                // echo "您的帐号已锁定，请联系管理员，重新激活用户1！";
                // exit();
                $data['status'] = 1;// 帐号已锁定
                return $data;
            }

            // 用户存在，密码不正确
            $check = $this->index->check_password($user_info['user_id'],$user_info['password']);

            if(!$check){
                // 允许登录次数-1
                $times = intval($data['times'])-1;

                $bool = $this->index->update_user_by_id($user_info['user_id'],'error_login_try_time',$times);

                if ($bool) {
                    if ($times == 0) {
                        // echo "您的帐号已锁定，请联系管理员，重新激活用户2！";
                        // exit();
                        $res = $this->index->update_user_by_id($user_info['user_id'],'status',1);
                        if ($res) {
                            $data['status'] = 1;// 帐号已锁定
                            return $data;
                        }
                    }

                    $data['times'] = $times;// 剩余允许登录尝试次数
                    return $data;
                }
            }else{
                // 登录成功
                $data['info'] = $user_info;
                return $data;
            }
        }else{
            //echo "用户不存在";
           return false;
        }
}