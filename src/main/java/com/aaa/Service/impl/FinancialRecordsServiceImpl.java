package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.AreaDao;
import com.aaa.Dao.FinancialRecordsDao;
import com.aaa.Entity.FinancialRecords;
import com.aaa.Entity.RegistrationForm;
import com.aaa.Entity.statistics;
import com.aaa.Service.FinancialRecordsService;
import com.aaa.Thread.TestTimer;
import com.aaa.pager.Pager;

//财务记录Service实现类
@Service
@Transactional
public class FinancialRecordsServiceImpl implements FinancialRecordsService{
	@Autowired
	private  FinancialRecordsDao frDao;

	public List<statistics> selMoney(Integer month) {
		return frDao.selMoney(month);
	}
	public Long addJumpPayPage(String userno, String howmuchisit,Long long1) {
		frDao.addJumpPayPage(userno,howmuchisit,long1);
		Long a=frDao.selectaddJumpPayPage(userno,howmuchisit);
        TestTimer testTimer = new TestTimer(a,this,0);
        testTimer.start();
        return a;
	}
	
	public Long qianJumpPayPage(String userno, String howmuchisit,Long long1) {
		frDao.qianJumpPayPage(userno,howmuchisit,long1);
		Long a=frDao.selectaddJumpPayPage(userno,howmuchisit);
        TestTimer testTimer = new TestTimer(a,this,0);
        testTimer.start();
        return a;
	}

	public Pager<FinancialRecords> SelectlimitFinancialRecords(
			Pager<FinancialRecords> pager, String likewhere) {
		boolean chinese = pager.isChinese(likewhere);
		List<FinancialRecords> rows = frDao.pagerlistAllFinancialRecords(likewhere,pager.getOffset(), pager.getPagesize(),chinese);
		pager.setRows(rows);
		
		Long total = frDao.countlistAllFinancialRecords(likewhere,chinese);
		pager.setTotal(total);
		return pager;
	}

	public Long selectFinancialStatementcount() {
		return frDao.selectFinancialStatementcount();
	}
	public void process(Long orderId, Integer paymentstatus) {
        frDao.DelOrdersId(orderId);
	}
	
	public void addFinancialStatement(Long howmuchisit) {
		String hho=frDao.selectaddFinancialStatement(howmuchisit);
		frDao.addFinancialStatement(hho.toString());
		frDao.updateaddFinancialStatement(howmuchisit);
	}
	
	public void reducebalance(Long userno,Long howmuchisit) {
		String hho=frDao.selectaddFinancialStatement(howmuchisit);
		frDao.reducebalance(hho,userno);
	}
}
