package com.aaa.Service;

import java.util.List;

import com.aaa.Entity.CommoditTypeTable;

public interface CommoditTypeTableService {
	// 查询所有商品类型
	public List<CommoditTypeTable> listAll();
	// 后台查询所有商品类型
			public List<CommoditTypeTable> selcommtype();
}
