package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.PetDao;
import com.aaa.Entity.Pet;
import com.aaa.Entity.PetUser;
import com.aaa.Service.PetService;
import com.aaa.pager.Pager;

@Service
@Transactional
public class PetServiceimpl implements PetService {
	@Autowired
	private PetDao pet;

	//孙斌编写上
	public List<Pet> petwhere(PetUser petuser) {
		return pet.petwhere(petuser);
	}
	public List<Pet> utelephoneselectajax(String a) {
		return pet.utelephoneselectajax(a);
	}
	//孙斌编写下
	//刘欢编写上
		@Override
		public List<Pet> petall() {
			return pet.petall();
		}
		@Override
		public Pet findByPetno(Long petno) {
			// TODO Auto-generated method stub
			return pet.findByPetno(petno);
		}
		@Override
		public void addpet(Pet pets) {
			// TODO Auto-generated method stub
			pet.addpet(pets);
		}
		@Override
		public void updatepet(Pet pets) {
			// TODO Auto-generated method stub
			pet.updatepet(pets);
		}
		//刘欢编写下
		@Override
		public List<Pet> findbyuserno(Long userno) {
			// TODO Auto-generated method stub
			return pet.findbyuserno(userno);
		}
		@Override
		public List<Pet> usernoandpuser(Long userno) {
			// TODO Auto-generated method stub
			return pet.usernoandpuser(userno);
		}
		
		@Override
		public Pager<Pet> QueryPet(Pager<Pet> pager,Long userno) {
			List<Pet> rows = pet.QueryPet(pager.getOffset(), pager.getPagesize(),userno);
			pager.setRows(rows);
			Long total = pet.selpetcount(userno);
			pager.setTotal(total);
			return pager;
		}
	//刘欢编写下
	
}
