package com.themis.base;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BaseService<Example,Entity> {
	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	long countByExample(Example example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int deleteByExample(Example example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int insert(Entity record);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int insertSelective(Entity record);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	List<Entity> selectByExample(Example example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	Entity selectByPrimaryKey(Integer id);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByExampleSelective(@Param("record") Entity record, @Param("example") Example example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByExample(@Param("record") Entity record, @Param("example") Example example);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByPrimaryKeySelective(Entity record);

	/**
	 * Auto Generator database table user_info
	 * @mbg.generated  2017-09-26
	 */
	int updateByPrimaryKey(Entity record);
}
