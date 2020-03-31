package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.aaa.Entity.Commodity;
import com.aaa.Entity.Delivery;
import com.aaa.Entity.TherapeuticDrugs;

@Mapper
public interface CommodityDao {
	//周鹏编写上
	// 查询所有商品
		public List<Commodity> listAlls();

		/**
		 * 查询分页数据
		 * 
		 * @return
		 */
		public List<Commodity> pager(@Param("keyword") String keyword,
				@Param("offset") Long offset, @Param("pagesize") Long pagesize);

		/**
		 * 查询总条数
		 * 
		 * @return
		 */
		public Long count(@Param("keyword") String keyword);

		// 获取购买库存
		public void updatednumber(@Param("dnumber") Integer dnumber, Delivery d,
				@Param("commodityno") String commodityno);

		// 模糊查询
			public List<Commodity> findBycf(@Param("offset") Long offset,
					@Param("pagesize") Long pagesize, @Param("search") String search);

			Long selusercount();

		//周鹏编写下
	//康宁添加商品
		public void AddProduct(Commodity comm);

		public List<Commodity> listAll();

		public void Deliveredaaa(@Param("userno")String userno,@Param("delivery")String delivery);

		public List<Commodity> listAll222(@Param("l")long l, 
				@Param("openlist")String openlist,
				@Param("wherelike")String wherelike);
		
		
		
		//刘欢
		public List<Commodity> listAllss();
		
		public List<Commodity> pagers(@Param("keyword") String keyword,
		@Param("offset") Long offset, @Param("pagesize") Long pagesize);
		
		public Long counts(@Param("keyword") String keyword);

		public List<Commodity> listAll1();
		
}
