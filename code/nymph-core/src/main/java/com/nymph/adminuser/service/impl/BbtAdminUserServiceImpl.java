package com.nymph.adminuser.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nymph.adminuser.entity.BbtAdminUser;
import com.nymph.adminuser.mapper.BbtAdminUserMapper;
import com.nymph.adminuser.service.IBbtAdminUserService;

/**
 * <p>
 * 后台用户信息表 服务实现类
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@Service
public class BbtAdminUserServiceImpl extends ServiceImpl<BbtAdminUserMapper, BbtAdminUser> implements IBbtAdminUserService {
	
	@Override
	public PageInfo<BbtAdminUser> page(Wrapper<BbtAdminUser> wrapper) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		return PageHelper.startPage(request).doSelectPageInfo(()-> selectList(wrapper));
	}

}
