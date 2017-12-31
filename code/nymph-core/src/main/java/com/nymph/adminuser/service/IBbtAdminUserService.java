package com.nymph.adminuser.service;

import com.nymph.adminuser.entity.BbtAdminUser;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * <p>
 * 后台用户信息表 服务类
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
public interface IBbtAdminUserService extends IService<BbtAdminUser> {

	PageInfo<BbtAdminUser> page(Wrapper<BbtAdminUser> wrapper);

}
