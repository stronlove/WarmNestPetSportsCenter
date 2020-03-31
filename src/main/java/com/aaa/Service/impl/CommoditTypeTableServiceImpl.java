package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.CommoditTypeTableDao;
import com.aaa.Entity.CommoditTypeTable;
import com.aaa.Service.CommoditTypeTableService;

@Service
@Transactional
public class CommoditTypeTableServiceImpl implements CommoditTypeTableService {

	@Autowired
	private CommoditTypeTableDao ct;

	// 查询所有商品类型
	@Override
	public List<CommoditTypeTable> listAll() {
		// TODO Auto-generated method stub
		return ct.listAll();
	}
	//后台查询所有商品类型
		@Override
		public List<CommoditTypeTable> selcommtype() {
			// TODO Auto-generated method stub
			return ct.selcommtype();
		}
}
