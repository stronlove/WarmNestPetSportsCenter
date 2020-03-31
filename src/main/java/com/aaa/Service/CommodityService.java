package com.aaa.Service;

import java.util.List;

import com.aaa.Entity.Commodity;
import com.aaa.Entity.Delivery;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.TherapeuticDrugs;
import com.aaa.pager.Pager;

public interface CommodityService {
	//周鹏编写上
	// 查询所有商品
		public Pager<Commodity> listAlls(String keyword, Pager<Commodity> pager);

		// 获取购买库存
		public void updatednumber(Integer dnumber, Delivery d, String commodityno);
		// 模糊查询
		Pager<Commodity> findBycf(Pager<Commodity> pager, String search);

		//周鹏编写下
	//康宁添加商品
		public void AddProduct(Commodity comm);

		public List<Commodity> listAll();

		public void Deliveredaaa(String userno, String delivery);

		public List<Commodity> listAll222(long l, String openlist,
				String wherelike);

		
		//刘欢
		public Pager<Commodity> listAllss(String keyword, Pager<Commodity> pagers);

		public List<Commodity> listAll1();

}
