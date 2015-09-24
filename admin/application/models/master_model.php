<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Master_model extends CI_Model {

    public $master = NULL;
    public $active_db = NULL;

    function __construct() {
        parent::__construct();
    }

    /**
     * 连接数据库
     *  (框架加载程序不自动连接数据库, 需要对数据库数据操作才连接。)
     * @param string $active_db 活动连接
     * @return object
     */
    public function connect_db($active_db = '') {
        if (is_null($this->master)) {
            $this->active_db = empty($active_db) ? 'default' : $active_db;
            //第二参数TRUE,  返回一个数据库连接对象
            $this->master = $this->load->database($this->active_db, TRUE);
        }

        return $this->master;
    }

    /**
     * 插入单条记录
     * @param string $table_name
     * @param mixed( 一维array | object ) $data   
     * @return int 插入记录的id
     */
    public function create($table_name, $data) {
        if (!isset($table_name) || !isset($data)) {
            return;
        }

        $this->connect_db();
        $this->master->insert($table_name, $data);

        return $this->master->insert_id();
    }

    /**
     * 批量插入记录
     * @param string  $table_name
     * @param mixed( 二维array | object ) $data   
     * @return  int  第一条插入的id
     */
    public function create_batch($table_name, $data) {
        if (!isset($table_name) || !isset($data)) {
            return;
        }

        $this->connect_db();
        $this->master->insert_batch($table_name, $data);

        return $this->master->insert_id();
    }

    /**
     * @param string $field_str 字段名,逗号分隔
     * @return 
     */
    public function select($field_str) {
        if (!is_string($field_str)) {
            return;
        }
        $this->connect_db();
        return $this->master->select($field_str);
    }

    /**
     *  显示条数
     * @param int $listrow
     * @param int $start_pos
     * @return
     */
    public function limit($listrow, $start_pos = 0) {
        if (!is_int($listrow) || !is_int($start_pos)) {
            return;
        }

        $this->connect_db();
        $this->master->limit($listrow, $start_pos);
    }

    /**
     * 
     * @param string $order_field
     * @param string $order_mode ( ASC | DESC )
     * @return 
     */
    public function order($order_field, $order_mode = 'DESC') {
        if (!is_string($order_field) || !is_string($order_mode)) {
            return;
        }

        $this->connect_db();
        $this->master->order_by($order_field, $order_mode);
    }

    /**
     *  单表查询一条数据
     * @param string $table_name
     * @param mixed(array | string ) $where
     * @return array  一维数组
     */
    public function select_one($table_name, $where) {
        if (!is_string($table_name) || empty($where)) {
            return;
        }

        $this->connect_db();
        $this->master->from($table_name);
        $this->master->where($where);
        return $this->master->get()->row_array();
    }

    /**
     * 单表查询多条数据
     * @param stirng $table_name
     * @param mixed(array | string ) $where
     * @param string $order_field
     * @param string $order_mode
     * @return 二维数组
     */
    public function select_all($table_name, $where, $order_field = NULL, $order_mode = 'DESC') {
        if (!is_string($table_name) || empty($where)) {
            return;
        }

        $this->connect_db();
        $this->master->from($table_name);
        $this->master->where($where);

        if ($order_field !== NULL && $order_mode !== NULL) {
            $this->order($order_field, $order_mode);
        }

        return $this->master->get()->result_array();
    }

    /**
     * 单表查询范围数据
     * @param string $table_name
     * @param string $field_in
     * @param array  $ids 
     */
    public function select_in($table_name, $field_in, $ids) {
        if (!is_string($table_name) || !is_string($field_in) || !is_array($ids)) {
            return;
        }

        sort($ids);

        $this->connect_db();
        $this->master->from($table_name);
        $this->master->where_in($field_in, $ids);
        return $this->master->get()->result_array();
    }

    /**
     * 单表查询是否存在数据
     * @param string $table_name
     * @param mixed(array | string ) $where
     * @return boolean
     */
    public function select_bool($table_name, $where) {
        if (!is_string($table_name) || empty($where)) {
            return;
        }

        $this->connect_db();
        $this->master->from($table_name);
        $this->master->where($where);

        return ($this->master->get()->num_rows() > 0 ? TRUE : FALSE);
    }

    /**
     * 单表获取记录总数
     * @param string $table_name
     * @param mixed (array | string ) $where
     * @return int
     */
    public function record_count($table_name, $where) {
        if (!is_string($table_name) || empty($where)) {
            return;
        }

        $this->connect_db();
        $this->master->from($table_name);
        $this->master->where($where);
        return $this->master->get()->num_rows();
    }

    /**
     * 单表删除记录
     * @param string $table_name
     * @param mixed (array | string ) $where
     * @return boolean
     */
    public function delete($table_name, $where, $can_exec = FALSE) {
        if (!is_string($table_name) || empty($where)) {
            return;
        }

        $this->connect_db();
        $this->master->where($where);

        if ($can_exec) {
            return $this->master->delete($table_name, $where);
        }

        $this->master->delete($table_name, $where);

        return ($this->master->affected_rows() > 0 ? TRUE : FALSE);
    }

    /**
     * 两个表合作删除记录
     */
    public function delete_multi() {
        
    }

    /**
     *  更新数据
     * @param string $table_name
     * @param mixed(array | string ) where 
     * @param mixed $data 变更数据
     * @param string $field_set 用于字段的计算
     * @param string $inc_or_dec  计算累加( inc ) / 减少( dec )
     * @param int $mod_num   计算累加 / 减少 的数量  
     * @param  boolean $return_exec_result  只要执行结果 ，不判断更新数量
     * @return boolean 数据有变更TRUE, 否则FALSE( 没有启用开关 )
     */
    public function update($table_name, $where, $data = NULL, $field_set = NULL, $inc_or_dec = 'inc', $mod_num = 1, $return_exec_result = FALSE) {
        if (!is_string($table_name) || empty($where)) {
            return;
        }

        if ($data === NULL && $field_set === NULL) {
            return;
        }

        $this->connect_db();

        if (!empty($field_set) && is_string($field_set)) {
            $field = (string) $field_set;
            $set = $inc_or_dec == 'inc' ? $field . "+$mod_num" : $field . "-$mod_num";
            $this->master->set($field, $set, FALSE);
        }

        $this->master->where($where);

        if (empty($data)) {
            $can_exec = $this->master->update($table_name);
        } else {
            $can_exec = $this->master->update($table_name, $data);
        }

        if ($return_exec_result === TRUE) {
            return $can_exec;
        }

        return ($this->master->affected_rows() > 0 ? TRUE : FALSE);
    }

    /**
     * 原生SQL语句查询单条记录
     * @param string $sql
     * @return array
     */
    public function find_one($sql) {
        if (!is_string($sql)) {
            return;
        }

        $this->connect_db();
        return $this->master->query($sql)->row_array();
    }

    /**
     *  原生SQL语句查询多条记录
     * @param string $sql
     * @return array
     */
    public function find_all($sql) {
        if (!is_string($sql)) {
            return;
        }

        $this->connect_db();
        return $this->master->query($sql)->result_array();
    }

    /**
     * 手动开启事务(关闭严格模式)
     * @return void
     */
    public function trans_begin() {
        $this->connect_db();
        $this->master->trans_strict(FALSE);
        $this->master->trans_begin();
    }

    /**
     * 提交事务
     * @return void
     */
    public function trans_commit() {
        $this->master->trans_commit();
    }

    /**
     * 事务回滚
     * @return void
     */
    public function trans_rollback() {
        $this->master->trans_rollback();
    }

    /**
     * 事务执行状态
     * @return boolean
     */
    public function trans_status() {
        return $this->master->trans_status();
    }

    /**
     * 返回最后运行的查询语句,不是查询结果
     */
    public function get_last_sql() {
        return $this->master->last_query();
    }

    /**
     * 获取在执行之前的查询语句
     */
    public function get_pre_exec_sql() {
        return $this->master->_compile_select();
    }
    
}

/* End of file master_model.php */
/* Location: ./application/model/master_model.php */