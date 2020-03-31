package com.aaa.Dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aaa.Entity.RoleTable;
@Mapper
public interface RoleTableDao {	
	/*
	 * 角色
	 */
	public List<RoleTable> listRoleTable();

}
