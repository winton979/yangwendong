package com.nymph.adminuser.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.annotations.Version;
import java.io.Serializable;

/**
 * <p>
 * 后台用户权限表
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@TableName("bbt_admin_permission")
public class BbtAdminPermission extends Model<BbtAdminPermission> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@TableId(value="SID", type= IdType.AUTO)
	private Long sid;
    /**
     * 权限编码
     */
	@TableField("PERMISSION_CODE")
	private String permissionCode;
    /**
     * 权限类型
     */
	@TableField("PERMISSION_TYPE")
	private String permissionType;
    /**
     * 权限名称
     */
	@TableField("PERMISSION_NAME")
	private String permissionName;
    /**
     * 权限分类
     */
	@TableField("PERMISSION_CATEGORY")
	private String permissionCategory;
    /**
     * 权限URL
     */
	@TableField("PERMISSION_URL")
	private String permissionUrl;
    /**
     * 权限顺序
     */
	@TableField("ORDER_RANK")
	private Integer orderRank;
    /**
     * 权限描述
     */
	@TableField("DESCRIPTION")
	private String description;
    /**
     * 创建者
     */
	@TableField("CREATED_BY")
	private Long createdBy;
    /**
     * 创建时间
     */
	@TableField("CREATED_DT")
	private Date createdDt;
    /**
     * 版本
     */
	@TableField("VERSION")
	private Integer version;
    /**
     * 更新者
     */
	@TableField("UPDATED_BY")
	private Long updatedBy;
    /**
     * 更新时间
     */
	@TableField("UPDATED_DT")
	private Date updatedDt;


	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public String getPermissionCode() {
		return permissionCode;
	}

	public void setPermissionCode(String permissionCode) {
		this.permissionCode = permissionCode;
	}

	public String getPermissionType() {
		return permissionType;
	}

	public void setPermissionType(String permissionType) {
		this.permissionType = permissionType;
	}

	public String getPermissionName() {
		return permissionName;
	}

	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}

	public String getPermissionCategory() {
		return permissionCategory;
	}

	public void setPermissionCategory(String permissionCategory) {
		this.permissionCategory = permissionCategory;
	}

	public String getPermissionUrl() {
		return permissionUrl;
	}

	public void setPermissionUrl(String permissionUrl) {
		this.permissionUrl = permissionUrl;
	}

	public Integer getOrderRank() {
		return orderRank;
	}

	public void setOrderRank(Integer orderRank) {
		this.orderRank = orderRank;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDt() {
		return createdDt;
	}

	public void setCreatedDt(Date createdDt) {
		this.createdDt = createdDt;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public Long getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Long updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedDt() {
		return updatedDt;
	}

	public void setUpdatedDt(Date updatedDt) {
		this.updatedDt = updatedDt;
	}

	public static final String TABLE_FIELD_SID = "SID";

	public static final String TABLE_FIELD_PERMISSION_CODE = "PERMISSION_CODE";

	public static final String TABLE_FIELD_PERMISSION_TYPE = "PERMISSION_TYPE";

	public static final String TABLE_FIELD_PERMISSION_NAME = "PERMISSION_NAME";

	public static final String TABLE_FIELD_PERMISSION_CATEGORY = "PERMISSION_CATEGORY";

	public static final String TABLE_FIELD_PERMISSION_URL = "PERMISSION_URL";

	public static final String TABLE_FIELD_ORDER_RANK = "ORDER_RANK";

	public static final String TABLE_FIELD_DESCRIPTION = "DESCRIPTION";

	public static final String TABLE_FIELD_CREATED_BY = "CREATED_BY";

	public static final String TABLE_FIELD_CREATED_DT = "CREATED_DT";

	public static final String TABLE_FIELD_VERSION = "VERSION";

	public static final String TABLE_FIELD_UPDATED_BY = "UPDATED_BY";

	public static final String TABLE_FIELD_UPDATED_DT = "UPDATED_DT";

	@Override
	protected Serializable pkVal() {
		return this.sid;
	}

	@Override
	public String toString() {
		return "BbtAdminPermission{" +
			", sid=" + sid +
			", permissionCode=" + permissionCode +
			", permissionType=" + permissionType +
			", permissionName=" + permissionName +
			", permissionCategory=" + permissionCategory +
			", permissionUrl=" + permissionUrl +
			", orderRank=" + orderRank +
			", description=" + description +
			", createdBy=" + createdBy +
			", createdDt=" + createdDt +
			", version=" + version +
			", updatedBy=" + updatedBy +
			", updatedDt=" + updatedDt +
			"}";
	}
}
