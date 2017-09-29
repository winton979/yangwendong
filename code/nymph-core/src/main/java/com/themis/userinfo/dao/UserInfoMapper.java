package com.themis.userinfo.dao;

import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.entity.UserInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserInfoMapper {

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	long countByExample(UserInfoExample example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int deleteByExample(UserInfoExample example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int insert(UserInfo record);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int insertSelective(UserInfo record);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	List<UserInfo> selectByExample(UserInfoExample example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	UserInfo selectByPrimaryKey(Integer id);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByExampleSelective(@Param("record") UserInfo record, @Param("example") UserInfoExample example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByExample(@Param("record") UserInfo record, @Param("example") UserInfoExample example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByPrimaryKeySelective(UserInfo record);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByPrimaryKey(UserInfo record);
}