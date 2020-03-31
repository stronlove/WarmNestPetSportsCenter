package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.CommodityDao;
import com.aaa.Entity.Commodity;
import com.aaa.Entity.Delivery;
import com.aaa.Entity.TherapeuticDrugs;
import com.aaa.Service.CommodityService;
import com.aaa.pager.Pager;

@Service
@Transactional
public class CommodityServiceImpl implements CommodityService {

	@Autowired
	private CommodityDao co;
	//周鹏编写上
	// 查询所有商品
		@Override
		public Pager<Commodity> listAlls(String keyword, Pager<Commodity> pager) {
			// TODO Auto-generated method stub
			// 第一步，查询分页数据，封装到pager的rows属性里面
			List<Commodity> rows = co.pager(keyword, pager.getOffset(),
					pager.getPagesize());
			pager.setRows(rows);
			// 第二步，查询总条数，封装到pager的total属性里面
			Long total = co.count(keyword);
			pager.setTotal(total);
			return pager;
		}

		// 获取购买库存
		@Override
		public void updatednumber(Integer dnumber, Delivery d, String commodityno) {
			// TODO Auto-generated method stub
			co.updatednumber(dnumber, d, commodityno);
		}
		@Override
		public Pager<Commodity> findBycf(Pager<Commodity> pager, String search) {
			List<Commodity> rows = co.findBycf(pager.getOffset(),
					pager.getPagesize(), search);
			pager.setRows(rows);
			Long total = co.selusercount();
			pager.setTotal(total);
			return pager;
		}
		//周鹏编写下
		
	//康宁添加商品
		public void AddProduct(Commodity comm) {
			co.AddProduct(comm);
		}

		public List<Commodity> listAll() {
			return co.listAll();
		}
		public List<Commodity> listAll1() {
			return co.listAll1();
		}

		public void Deliveredaaa(String userno,String delivery) {
			co.Deliveredaaa(userno,delivery);
		}

		public List<Commodity> listAll222(long l, String openlist,
				String wherelike) {
			return co.listAll222(l,openlist,wherelike);
		}
		
		
		@Override
		public Pager<Commodity> listAllss(String keyword, Pager<Commodity> pagers) {
			// TODO Auto-generated method stub
			// 第一步，查询分页数据，封装到pager的rows属性里面
			List<Commodity> rows = co.pagers(keyword, pagers.getOffset(),
					pagers.getPagesize());
			pagers.setRows(rows);
			// 第二步，查询总条数，封装到pager的total属性里面
			Long total = co.counts(keyword);
			pagers.setTotal(total);
			return pagers;
		}
}
