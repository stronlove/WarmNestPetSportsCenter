package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.RoleTableDao;
import com.aaa.Entity.RoleTable;
import com.aaa.Service.RoleTableService;



@Service
@Transactional
public class RoleTableServiceImpl implements RoleTableService{
	@Autowired
	RoleTableDao rDao;

	@Override
	public List<RoleTable> listRoleTable() {
		// TODO Auto-generated method stub
		return rDao.listRoleTable();
	}

}
