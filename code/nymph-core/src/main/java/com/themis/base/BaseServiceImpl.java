package com.themis.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class BaseServiceImpl<example,entity> implements BaseService<example, entity>{
	
	@Autowired
	BaseMapperDao<example, entity> dao;

	@Override
	public long countByExample(example example) {
		
		return dao.countByExample(example);
	}

	@Override
	public int deleteByExample(example example) {
		
		return dao.deleteByExample(example);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(entity record) {
		
		return dao.insert(record);
	}

	@Override
	public int insertSelective(entity record) {
		
		return dao.insertSelective(record);
	}

	@Override
	public List<entity> selectByExample(example example) {
		
		return dao.selectByExample(example);
	}

	@Override
	public entity selectByPrimaryKey(Integer id) {
		
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByExampleSelective(entity record, example example) {
		
		return dao.updateByExampleSelective(record, example);
	}

	@Override
	public int updateByExample(entity record, example example) {
		
		return dao.updateByExample(record, example);
	}

	@Override
	public int updateByPrimaryKeySelective(entity record) {
		
		return dao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(entity record) {
		
		return dao.updateByPrimaryKey(record);
	}
	
	
}
