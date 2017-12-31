package com.nymph.adminuser.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.Version;
import java.io.Serializable;

/**
 * <p>
 * 后台用户与角色关系
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@TableName("bbt_admin_user_re_role")
public class BbtAdminUserReRole extends Model<BbtAdminUserReRole> {

    private static final long serialVersionUID = 1L;

    /**
     * 后台用户SID
     */
    @TableId("USER_SID")
	private Long userSid;
    /**
     * 后台角色SID
     */
	@TableField("ROLE_SID")
	private Long roleSid;


	public Long getUserSid() {
		return userSid;
	}

	public void setUserSid(Long userSid) {
		this.userSid = userSid;
	}

	public Long getRoleSid() {
		return roleSid;
	}

	public void setRoleSid(Long roleSid) {
		this.roleSid = roleSid;
	}

	public static final String TABLE_FIELD_USER_SID = "USER_SID";

	public static final String TABLE_FIELD_ROLE_SID = "ROLE_SID";

	@Override
	protected Serializable pkVal() {
		return this.userSid;
	}

	@Override
	public String toString() {
		return "BbtAdminUserReRole{" +
			", userSid=" + userSid +
			", roleSid=" + roleSid +
			"}";
	}
}
