package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.Delivery;
import com.aaa.Entity.PetUser;
import com.aaa.pager.Pager;

@Mapper
public interface PetUserDao {

	//孙斌写的上
	Long loginusercoun(PetUser p);

	Long loginuforbidden(PetUser p);

	List<PetUser> loginuser(PetUser p);

	//孙斌写的下
	//刘欢写的上
	//余额
	/*public void updatepetuser(int pye);*/
	//余额查询
	public PetUser findByPetUserno(Long userno);
	//添加用户
	public void addpetuser(PetUser petuser);
	//修改用户
	public void updatepetuser(PetUser petuser);
	//模糊查询
	public List<PetUser> findbyuname(@Param("offset")Long offset, @Param("pagesize")Long pagesize,@Param("search")String search);
	//真实姓名验证
	Long findbyunamesname(String unamesname);
	//身份证验证
	Long findByUid(String uid);
	
	Long findByPhone(String utelephone);
	//刘欢写的下
	//王金格写的上
	public void saveuser(PetUser p);
	//以账号进行查询
	public List<PetUser> findBypetname(@Param("UserRegistrationval")String uname);
	//以手机号进行查询
	public List<PetUser> findByutelephone(@Param("PhoneNumber")String utelephone);
	//以身份证进行查询
	List<PetUser> findByuid(@Param("RegisteredIdentityCardNumber")String uid);
	
	
	//添加宠物数量
	public void insertunumberOfPets(Long userno);
	// 添加总金额
	public void updateFinancialStatements(@Param("cprice") Float cprice);

	
	
	
	//王金格写的下
	

    /*王金格：取药*/
	List<PetUser> QueryOpenStaList(@Param("offset")Long offset, @Param("pagesize")Long pagesize,@Param("likewhere") String likewhere);

	List<PetUser> QueryOpenStateList(@Param("offset")Long offset, @Param("pagesize")Long pagesize,@Param("likewhere") String likewhere);

	Long OpenListcountquu(@Param("likewhere")String likewhere);
	/*王金格：取药*/
	Long OpenListcountquuu(@Param("likewhere")String likewhere);
	//周鹏写的上
	// 添加商品
			public void addDelivery(Delivery d);

			// 查询送货订单
			public List<Delivery> listDelivery(@Param("userno") Long userno,
					String keyword, Pager<Delivery> pager);

			// 添加金额记录
			public void addFinancialRecords(@Param("userno") Long userno,
					@Param("cprice") String cprice);

			// 添加总金额
			public void updateFinancialStatement(@Param("cprice") String cprice,
					@Param("financialstatementno") String financialstatementno);

			// 获取购买余额
			public void updateubalance(@Param("cprice") String cprice,
					@Param("userno") String userno);

			/**
			 * 查询分页数据
			 * 
			 * @param userno
			 * 
			 * @return
			 */
			public List<Delivery> pager(@Param("userno") Long userno,
					@Param("keyword") String keyword, @Param("offset") Long offset,
					@Param("pagesize") Long pagesize);

			/**
			 * 查询总条数
			 * 
			 * @param userno
			 * 
			 * @return
			 */
			public Long count(@Param("keyword") String keyword,
					@Param("userno") Long userno);
	//周鹏写的下
	//康宁查询用户
	List<PetUser> QueryUser(@Param("offset")Long offset, @Param("pagesize")Long pagesize);
	//康查询总条数
	Long selusercount();
	//修改用户状态
	public void updateuser(@Param("userno")Long userno,@Param("urole")Long urole);

	List<PetUser> QueryOpenList(@Param("offset")Long offset, @Param("pagesize")Long pagesize,@Param("likewhere") String likewhere);
	List<PetUser> QueryOpenLista(@Param("offset") Long offset,@Param("pagesize") Long pagesize,@Param("likewhere") String likewhere);
	List<PetUser> QueryOpenListw(@Param("offset") Long offset,@Param("pagesize") Long pagesize,@Param("likewhere") String likewhere);

	Long OpenListcountqu(@Param("likewhere") String likewhere);
	Long OpenListcountqua(@Param("likewhere") String likewhere);
	Long OpenListcountquw(@Param("likewhere") String likewhere);

	Long yuefuqiancount(@Param("userno")String userno, @Param("howMuchIsIt")String howMuchIsIt);

	void yuefuqian(@Param("userno")String userno, @Param("howMuchIsIt")String howMuchIsIt);

	void reducebalance(@Param("wIDsubject")String wIDsubject,@Param("userno")Long userno);

	List<Delivery> listDeliveryqwe(@Param("offset")Long offset, @Param("pagesize")Long pagesize, @Param("keyword")String keyword);

	Long listDeliveryqwecountqwe(@Param("keyword")String keyword);

	void ConfirmationOfDeliveryqwe(@Param("delivery")String delivery);

	String selecttdananLoad(@Param("userno")String userno);

	PetUser selectpetusersession(@Param("userno")Long userno);

}
