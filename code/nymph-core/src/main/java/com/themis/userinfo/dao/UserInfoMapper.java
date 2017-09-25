package com.themis.userinfo.dao;

import com.themis.userinfo.entity.UserInfo;
import com.themis.userinfo.entity.UserInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserInfoMapper {
    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    long countByExample(UserInfoExample example);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int deleteByExample(UserInfoExample example);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int insert(UserInfo record);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int insertSelective(UserInfo record);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    List<UserInfo> selectByExample(UserInfoExample example);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    UserInfo selectByPrimaryKey(Integer id);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int updateByExampleSelective(@Param("record") UserInfo record, @Param("example") UserInfoExample example);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int updateByExample(@Param("record") UserInfo record, @Param("example") UserInfoExample example);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int updateByPrimaryKeySelective(UserInfo record);

    /**
     * Auto Generator.
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-25
     */
    int updateByPrimaryKey(UserInfo record);
}