package com.aaa.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.Commodity;
import com.aaa.Entity.Delivery;
import com.aaa.Entity.FinancialRecords;
import com.aaa.Entity.PetUser;
import com.aaa.pager.Pager;

public interface PetUserService {

	Long loginusercoun(PetUser p);

	Long loginuforbidden(PetUser p);

	List<PetUser> loginuser(PetUser p);
	
	public void updateuser(Long userno,Long urole);

	Pager<PetUser> QueryOpenList(Pager<PetUser> pager, String likewhere);

	
	//刘欢编写上

	//余额
/*	public void updatepetuser(int pye);*/
	//余额查询
	public PetUser findByPetUserno(Long userno);
	//添加用户
		public void addpetuser(PetUser petuser);
		//修改用户
		public void updatepetuser(PetUser petuser);
		//模糊查询
		Pager<PetUser> findbyuname(Pager<PetUser> pager,@Param("search")String search);
		
		//真实姓名验证
		Long findbyunamesname(String unamesname);
		//身份证验证
		Long findByUid(String unamesname);
		
		Long findByPhone(String utelephone);
		
		
		public void insertunumberOfPets(Long userno);
		public void updateFinancialStatements(Float cprice);
		
		
		//刘欢编写下
	
	
	
	
	//王金格写的上
	public void saveuser(PetUser p);
	
	List<PetUser> findBypetname(String uname);

	List<PetUser> findByutelephone(String utelephone);

	List<PetUser> findByuid(String uid);
	//王金格写的下
	/*王金格：取药*/
	Pager<PetUser> QueryOpenStaList(Pager<PetUser> pager, String likewhere);
	/*王金格：取药*/
	Pager<PetUser> QueryOpenStateList(Pager<PetUser> pager, String likewhere);

	//周鹏写的上
	// 添加商品
	// 添加商品
		public void addDelivery(Delivery d);

		// 查询送货订单
		public Pager<Delivery> listDelivery(Long userno, String keyword,
				Pager<Delivery> pager);

		// 添加金额记录
		public void addFinancialRecords(FinancialRecords f, String cprice);

		// 获取购买余额
		public void updateubalance(String cprice, Commodity ca, String userno);

		// 添加总金额
		public void updateFinancialStatement(String cprice,
				String financialstatementno, Commodity ca);
	//周鹏写的下
	//康宁用户的禁用启用
	Pager<PetUser> QueryUser(Pager<PetUser> pager);
	//康宁修改用户状态

	Pager<PetUser> QueryOpenListwhere1(Pager<PetUser> pager, String likewhere);
	Pager<PetUser> QueryOpenListwhere1a(Pager<PetUser> pager, String likewhere);

	Pager<PetUser> QueryOpenListwhere1w(Pager<PetUser> pager, String likewhere);

	Long yuefuqiancount(String userno, String howMuchIsIt);

	void yuefuqian(String userno, String howMuchIsIt);

	void reducebalance(String wIDsubject, Long userno);

	Pager<Delivery> listDeliveryqwe(String keyword, Pager<Delivery> pager);

	void ConfirmationOfDeliveryqwe(String delivery);

	String selecttdananLoad(String userno);

	PetUser selectpetusersession(Long userno);
}
