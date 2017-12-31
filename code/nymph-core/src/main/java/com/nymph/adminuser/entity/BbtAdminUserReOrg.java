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
 * bbt_admin_user_re_org
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@TableName("bbt_admin_user_re_org")
public class BbtAdminUserReOrg extends Model<BbtAdminUserReOrg> {

    private static final long serialVersionUID = 1L;

    /**
     * 后台用户SID
     */
    @TableId("USER_SID")
	private Long userSid;
    /**
     * 组织机构SID
     */
	@TableField("ORG_SID")
	private Long orgSid;


	public Long getUserSid() {
		return userSid;
	}

	public void setUserSid(Long userSid) {
		this.userSid = userSid;
	}

	public Long getOrgSid() {
		return orgSid;
	}

	public void setOrgSid(Long orgSid) {
		this.orgSid = orgSid;
	}

	public static final String TABLE_FIELD_USER_SID = "USER_SID";

	public static final String TABLE_FIELD_ORG_SID = "ORG_SID";

	@Override
	protected Serializable pkVal() {
		return this.userSid;
	}

	@Override
	public String toString() {
		return "BbtAdminUserReOrg{" +
			", userSid=" + userSid +
			", orgSid=" + orgSid +
			"}";
	}
}
