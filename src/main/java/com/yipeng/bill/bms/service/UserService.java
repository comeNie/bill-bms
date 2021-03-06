package com.yipeng.bill.bms.service;

import com.yipeng.bill.bms.core.model.Page;
import com.yipeng.bill.bms.domain.Bill;
import com.yipeng.bill.bms.domain.User;
import com.yipeng.bill.bms.vo.LoginUser;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by Administrator on 2017/3/7.
 */
public interface UserService {
    /**
     * 新增用户
     * @param user
     * @return
     */
    int saveUser(User user);

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    User getUserById(Long id);

    /**
     * 根据用户名查询用户
     * @param userName
     * @return
     */
    User getUserByName(String userName);

    /**
     * 根据参数查询用户列表
     * @param params
     * @return
     */
    Map<String, Object>findList(int limit, int offset);

    /**
     * 获取用户集合个数
     * @return
     */
    Long getUserListCount();

    /**
     * 查找当前登录对象对应的客户
     * @param params
     * @return
     */
    List<User> userCreater(Map<String,Long> params);

    List<User> getUserAll(Map<String,Long> params);

    List<User> getSearchUser(LoginUser loginUser,String way);

    /**
     * 修改信息
     * @param user
     * @return
     */
    int updateByPrimaryKeySelective(User user);

    Boolean checkPwd(User user);
}
