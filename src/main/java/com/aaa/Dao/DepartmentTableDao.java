package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;

@Mapper
public interface DepartmentTableDao {

	//
	//孙斌写的上
	List<DepartmentTable> selectDepartmentTable();
	//孙斌写的下
	
	/*王金格
	 * 部门
	 */
	public List<DepartmentTable> listDepartmentTable();
}
