package com.aaa.Service;

import java.util.List;

import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.pager.Pager;

public interface PetService {

	List<Pet> petwhere(PetUser petuser);

	//查询所有宠物
	public List<Pet> petall();
	
	
	
	public Pet findByPetno(Long petno);
	//添加宠物
	public void addpet(Pet pet);
	//修改宠物
	public void updatepet(Pet pet);

	List<Pet> utelephoneselectajax(String a);
	
	
	//以puser为条件查询宠物
	public List<Pet> findbyuserno(Long userno);
	
	public List<Pet> usernoandpuser(Long userno);
	//分页查询
	Pager<Pet> QueryPet(Pager<Pet> pager,Long userno);
}
