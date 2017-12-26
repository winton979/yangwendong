package com.nymph.adminuser.service.impl;

import com.nymph.adminuser.entity.BbtAdminUser;
import com.nymph.adminuser.mapper.BbtAdminUserMapper;
import com.nymph.adminuser.service.IBbtAdminUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 后台用户信息表 服务实现类
 * </p>
 *
 * @author winton
 * @since 2017-12-26
 */
@Service
public class BbtAdminUserServiceImpl extends ServiceImpl<BbtAdminUserMapper, BbtAdminUser> implements IBbtAdminUserService {

}
