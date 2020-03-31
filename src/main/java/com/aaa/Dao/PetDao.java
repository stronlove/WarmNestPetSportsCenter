package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.Delivery;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.pager.Pager;

@Mapper
public interface PetDao {

	//孙斌写的上
	List<Pet> petwhere(PetUser petuser);
	List<Pet> utelephoneselectajax(@Param("a")String a);

	//孙斌写的下
	//刘欢写的上
		//查询所有宠物
		public List<Pet> petall();
		
		public Pet findByPetno(Long petno);
		//添加宠物
		public void addpet(Pet pet);
		//修改宠物
		public void updatepet(Pet pet);
		
		
		public List<Pet> findbyuserno(Long userno);
		
		public List<Pet> usernoandpuser(Long userno);
		
		
		List<Pet> QueryPet(@Param("offset")Long offset, @Param("pagesize")Long pagesize,@Param("userno")Long userno);
		
		Long selpetcount(Long userno);

		
		
		//刘欢写的下

}
