package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aaa.Entity.CommoditTypeTable;

@Mapper
public interface CommoditTypeTableDao {
	// 查询所有商品类型
	public List<CommoditTypeTable> listAll();
	// 后台查询所有商品类型
		List<CommoditTypeTable> selcommtype();
}
