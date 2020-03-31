package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.PetUserDao;
import com.aaa.Entity.Commodity;
import com.aaa.Entity.Delivery;
import com.aaa.Entity.FinancialRecords;
import com.aaa.Entity.PetUser;
import com.aaa.Service.PetUserService;
import com.aaa.pager.Pager;

@Service
@Transactional
public class PetUserServiceimpl implements PetUserService{
	@Autowired
	private PetUserDao pu;

	//孙斌编写上
	public Long loginusercoun(PetUser p){
		return pu.loginusercoun(p);
	}

	public Long loginuforbidden(PetUser p){
		return pu.loginuforbidden(p);
	}

	public List<PetUser> loginuser(PetUser p){
		return pu.loginuser(p);
	}

	public Pager<PetUser> QueryOpenList(Pager<PetUser> pager,String likewhere) {
		List<PetUser> rows = pu.QueryOpenList(pager.getOffset(), pager.getPagesize(),likewhere);
		pager.setRows(rows);
		Long total = pu.OpenListcountqu(likewhere);
		pager.setTotal(total);
		return pager;
	}
	//孙斌编写下

	//刘欢编写上
	//余额充值
	/*	@Override
	public void updatepetuser(int pye) {
		// TODO Auto-generated method stub
		pu.updatepetuser(pye);
	}*/

	@Override
	public PetUser findByPetUserno(Long userno) {
		// TODO Auto-generated method stub
		return pu.findByPetUserno(userno);
	}
	@Override
	public void addpetuser(PetUser petuser) {
		// TODO Auto-generated method stub
		pu.addpetuser(petuser);
	}

	@Override
	public void updatepetuser(PetUser petuser) {
		// TODO Auto-generated method stub
		pu.updatepetuser(petuser);
	}

	@Override
	public Pager<PetUser> findbyuname(Pager<PetUser> pager,String search) {
		List<PetUser> rows = pu.findbyuname(pager.getOffset(), pager.getPagesize(), search);
		pager.setRows(rows);
		Long total = pu.selusercount();
		pager.setTotal(total);
		return pager;
	}

	@Override
	public Long findbyunamesname(String unamesname) {
		return pu.findbyunamesname(unamesname);
	}

	@Override
	public Long findByUid(String uid) {
		// TODO Auto-generated method stub
		return pu.findByUid(uid);
	}

	@Override
	public Long findByPhone(String utelephone) {
		// TODO Auto-generated method stub
		return pu.findByPhone(utelephone);
	}
	
	//刘欢编写下
	//王金格写的上

	public void saveuser(PetUser p) {
		pu.saveuser(p);
	}

	public List<PetUser> findBypetname(String uname) {
		return pu.findBypetname(uname);
	}

	public List<PetUser> findByutelephone(String utelephone) {
		return pu.findByutelephone(utelephone);
	}

	public List<PetUser> findByuid(String uid) {
		return pu.findByuid(uid);
	}

	//王金格写的下
	//周鹏写的上
	// 添加商品
		@Override
		public void addDelivery(Delivery d) {
			// TODO Auto-generated method stub
			pu.addDelivery(d);
		}

		// 查询送货订单
		@Override
		public Pager<Delivery> listDelivery(Long userno, String keyword,
				Pager<Delivery> pager) {
			// 第一步，查询分页数据，封装到pager的rows属性里面
			List<Delivery> rows = pu.pager(userno, keyword, pager.getOffset(),
					pager.getPagesize());
			pager.setRows(rows);
			// 第二步，查询总条数，封装到pager的total属性里面
			Long total = pu.count(keyword, userno);
			pager.setTotal(total);
			return pager;
		}

		// 添加金额记录
		public void addFinancialRecords(FinancialRecords f, String cprice) {
			pu.addFinancialRecords(f.getFuser().getUserno(), cprice);
		}

		// 获取购买余额
		public void updateubalance(String cprice, Commodity ca, String userno) {
			pu.updateubalance(cprice, userno);
		}

		// 添加总金额
		@Override
		public void updateFinancialStatement(String cprice,
				String financialstatementno, Commodity ca) {
			pu.updateFinancialStatement(cprice, financialstatementno);
		}
	//周鹏写的下
	//康宁分页查询用户及禁用启用上
		@Override
		public Pager<PetUser> QueryUser(Pager<PetUser> pager) {
			List<PetUser> rows = pu.QueryUser(pager.getOffset(), pager.getPagesize());
			pager.setRows(rows);
			Long total = pu.selusercount();
			pager.setTotal(total);
			return pager;
		}
		//康宁修改用户状态
		@Override
		public void updateuser(Long userno, Long urole) {
			// TODO Auto-generated method stub
			pu.updateuser(userno, urole);
		}
		

		public Pager<PetUser> QueryOpenListwhere1(Pager<PetUser> pager,
				String likewhere) {
			List<PetUser> rows = pu.QueryOpenList(pager.getOffset(), pager.getPagesize(),likewhere);
			pager.setRows(rows);
			Long total = pu.OpenListcountqu(likewhere);
			pager.setTotal(total);
			return pager;
			
		}
		@Override
		public Pager<PetUser> QueryOpenListwhere1a(Pager<PetUser> pager,
				String likewhere) {
			List<PetUser> rows = pu.QueryOpenLista(pager.getOffset(),
					pager.getPagesize(), likewhere);
			pager.setRows(rows);
			Long total = pu.OpenListcountqua(likewhere);
			pager.setTotal(total);
			return pager;
		}

		@Override
		public Pager<PetUser> QueryOpenListwhere1w(Pager<PetUser> pager,
				String likewhere) {
			List<PetUser> rows = pu.QueryOpenListw(pager.getOffset(),
					pager.getPagesize(), likewhere);
			pager.setRows(rows);
			Long total = pu.OpenListcountquw(likewhere);
			pager.setTotal(total);
			return pager;
		}

		public Long yuefuqiancount(String userno, String howMuchIsIt) {
			return pu.yuefuqiancount(userno,howMuchIsIt);
		}

		public void yuefuqian(String userno, String howMuchIsIt) {
			pu.yuefuqian(userno,howMuchIsIt);
		}

		public void reducebalance(String wIDsubject, Long userno) {
			pu.reducebalance(wIDsubject,userno);
		}
		/**王金格
	     * 取药
	    */
		public Pager<PetUser> QueryOpenStaList(Pager<PetUser> pager,String likewhere) {
			List<PetUser> rows = pu.QueryOpenStaList(pager.getOffset(), pager.getPagesize(),likewhere);
			pager.setRows(rows);
			Long total = pu.OpenListcountquu(likewhere);
			pager.setTotal(total);
			return pager;
		}
		public Pager<PetUser> QueryOpenStateList(Pager<PetUser> pager,String likewhere) {
			List<PetUser> rows = pu.QueryOpenStateList(pager.getOffset(), pager.getPagesize(),likewhere);
			pager.setRows(rows);
			Long total = pu.OpenListcountquuu(likewhere);
			pager.setTotal(total);
			return pager;
		}

		public Pager<Delivery> listDeliveryqwe(String keyword,
				Pager<Delivery> pager) {
			List<Delivery> rows = pu.listDeliveryqwe(pager.getOffset(), pager.getPagesize(),keyword);
			pager.setRows(rows);
			Long total = pu.listDeliveryqwecountqwe(keyword);
			pager.setTotal(total);
			return pager;
		}

		public void ConfirmationOfDeliveryqwe(String delivery) {
			pu.ConfirmationOfDeliveryqwe(delivery);
		}

		public String selecttdananLoad(String userno) {
			return pu.selecttdananLoad(userno);
		}

		public PetUser selectpetusersession(Long userno) {
			return pu.selectpetusersession(userno);
		}
		
		
		
		
		public void insertunumberOfPets(Long userno) {
			// TODO Auto-generated method stub
			pu.insertunumberOfPets(userno);
		}

	@Override
		public void updateFinancialStatements(Float cprice) {
			// TODO Auto-generated method stub
			pu.updateFinancialStatements(cprice);
		}
}
