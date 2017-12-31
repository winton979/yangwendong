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
 * 
 * </p>
 *
 * @author winton
 * @since 2017-12-31
 */
@TableName("bbt_system_code")
public class BbtSystemCode extends Model<BbtSystemCode> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Long id;
	private Integer code;
	private String name;
	private Integer enabled;
	@TableField("create_time")
	private Date createTime;
	private String type;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public static final String TABLE_FIELD_ID = "id";

	public static final String TABLE_FIELD_CODE = "code";

	public static final String TABLE_FIELD_NAME = "name";

	public static final String TABLE_FIELD_ENABLED = "enabled";

	public static final String TABLE_FIELD_CREATE_TIME = "create_time";

	public static final String TABLE_FIELD_TYPE = "type";

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "BbtSystemCode{" +
			", id=" + id +
			", code=" + code +
			", name=" + name +
			", enabled=" + enabled +
			", createTime=" + createTime +
			", type=" + type +
			"}";
	}
}
