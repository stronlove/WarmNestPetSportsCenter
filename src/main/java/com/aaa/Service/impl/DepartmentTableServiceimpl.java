package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.DepartmentTableDao;
import com.aaa.Dao.PetDao;
import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.Service.DepartmentTableService;
import com.aaa.Service.PetService;

@Service
@Transactional
public class DepartmentTableServiceimpl implements DepartmentTableService {
	@Autowired
	private DepartmentTableDao dt;
	//孙斌编写上
	public List<DepartmentTable> selectDepartmentTable() {
		return dt.selectDepartmentTable();
	}
	//孙斌编写下
	
}
