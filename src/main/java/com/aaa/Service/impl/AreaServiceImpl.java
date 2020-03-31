package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.AreaDao;
import com.aaa.Entity.Area;
import com.aaa.Service.AreaService;

@Service
@Transactional
public class AreaServiceImpl implements AreaService {
	@Autowired
	private AreaDao areaDao;

	// 查询所有地区
	@Override
	public List<Area> listAll() {
		// TODO Auto-generated method stub
		return areaDao.listAll();
	}

}
