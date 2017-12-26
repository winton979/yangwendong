package com.nymph.userinfo.service.impl;

import com.nymph.userinfo.entity.UserInfo;
import com.nymph.userinfo.mapper.UserInfoMapper;
import com.nymph.userinfo.service.IUserInfoService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author winton
 * @since 2017-12-26
 */
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements IUserInfoService {

}
