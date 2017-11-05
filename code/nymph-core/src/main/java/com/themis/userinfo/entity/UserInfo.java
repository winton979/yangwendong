package com.themis.userinfo.entity;

import java.io.Serializable;

import lombok.Data;

/**
 *
 * Auto Generator.
 * Auto Generator database table user_info
 *
 * @mbg.generated do_not_delete_during_merge 2017-09-26
 */
@Data
public class UserInfo implements Serializable {
	
    /**
     * Database Column Remarks:
     *   主键
     *
     * Auto Generator: user_info.id
     *
     * @mbg.generated 2017-09-26
     */
    private Integer id;

    /**
     * Database Column Remarks:
     *   昵称
     *
     * Auto Generator: user_info.nickname
     *
     * @mbg.generated 2017-09-26
     */
    private String nickname;

    /**
     * Database Column Remarks:
     *   第三方id
     *
     * Auto Generator: user_info.suid
     *
     * @mbg.generated 2017-09-26
     */
    private String suid;

    /**
     * Database Column Remarks:
     *   第三方token
     *
     * Auto Generator: user_info.token
     *
     * @mbg.generated 2017-09-26
     */
    private String token;

    /**
     * Database Column Remarks:
     *   登陆名
     *
     * Auto Generator: user_info.sign_in_name
     *
     * @mbg.generated 2017-09-26
     */
    private String signInName;

    /**
     * Database Column Remarks:
     *   登陆密码
     *
     * Auto Generator: user_info.sign_in_password
     *
     * @mbg.generated 2017-09-26
     */
    private String signInPassword;

    /**
     * Database Column Remarks:
     *   盐
     *
     * Auto Generator: user_info.salt
     *
     * @mbg.generated 2017-09-26
     */
    private String salt;

    /**
     * Database Column Remarks:
     *   创建时间
     *
     * Auto Generator: user_info.create_time
     *
     * @mbg.generated 2017-09-26
     */
    private Integer createTime;

    /**
     * Database Column Remarks:
     *   是否禁用
     *
     * Auto Generator: user_info.enabled
     *
     * @mbg.generated 2017-09-26
     */
    private Integer enabled;

    /**
     * Database Column Remarks:
     *   头像url
     *
     * Auto Generator: user_info.head_url
     *
     * @mbg.generated 2017-09-26
     */
    private String headUrl;

    /**
     * Database Column Remarks:
     *   用户类型
     *
     * Auto Generator: user_info.user_type
     *
     * @mbg.generated 2017-09-26
     */
    private Integer userType;

    /**
     * Database Column Remarks:
     *   更新时间
     *
     * Auto Generator: user_info.update_time
     *
     * @mbg.generated 2017-09-26
     */
    private Integer updateTime;

    /**
     * Auto Generator database table user_info
     *
     * @mbg.generated 2017-09-26
     */
    private static final long serialVersionUID = 1L;
}