package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aaa.Entity.Area;

@Mapper
public interface AreaDao {
	// 查询所有地区
	public List<Area> listAll();

}
