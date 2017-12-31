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
 * 后台用户角色与权限关系
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@TableName("bbt_admin_role_re_perm")
public class BbtAdminRoleRePerm extends Model<BbtAdminRoleRePerm> {

    private static final long serialVersionUID = 1L;

    /**
     * 角色SID
     */
    @TableId("ROLE_SID")
	private Long roleSid;
    /**
     * 权限SID
     */
	@TableField("PERMISSION_SID")
	private Long permissionSid;


	public Long getRoleSid() {
		return roleSid;
	}

	public void setRoleSid(Long roleSid) {
		this.roleSid = roleSid;
	}

	public Long getPermissionSid() {
		return permissionSid;
	}

	public void setPermissionSid(Long permissionSid) {
		this.permissionSid = permissionSid;
	}

	public static final String TABLE_FIELD_ROLE_SID = "ROLE_SID";

	public static final String TABLE_FIELD_PERMISSION_SID = "PERMISSION_SID";

	@Override
	protected Serializable pkVal() {
		return this.roleSid;
	}

	@Override
	public String toString() {
		return "BbtAdminRoleRePerm{" +
			", roleSid=" + roleSid +
			", permissionSid=" + permissionSid +
			"}";
	}
}
