package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.FinancialRecords;
import com.aaa.Entity.statistics;

@Mapper
public interface FinancialRecordsDao {
	//查询当天收入
	public List<statistics> selMoney(@Param("month")Integer month);

	public void addJumpPayPage(@Param("userno")String userno, 
			@Param("howmuchisit")String howmuchisit,
			@Param("foperatingstaff")Long foperatingstaff);

	public void addFinancialStatement(@Param("howmuchisit")String howmuchisit);

	public List<FinancialRecords> pagerlistAllFinancialRecords(
			@Param("likewhere")String likewhere, @Param("offset")Long offset, 
			@Param("pagesize")Long pagesize, @Param("chinese")boolean chinese);

	public Long countlistAllFinancialRecords(@Param("likewhere")String likewhere,
			@Param("chinese")boolean chinese);

	public void qianJumpPayPage(@Param("userno")String userno, 
			@Param("howmuchisit")String howmuchisit,
			@Param("foperatingstaff")Long foperatingstaff);

	public void qianFinancialStatement(@Param("howmuchisit")String howmuchisit);

	public Long selectFinancialStatementcount();

	public Long DelOrdersId(@Param("orderId")Long orderId);

	public void DeldealOrdersId(@Param("orderId")Long orderId);

	public Long selectaddJumpPayPage(@Param("userno")String userno,
			@Param("howmuchisit")String howmuchisit);

	public String selectaddFinancialStatement(@Param("howmuchisit")Long howmuchisit);

	public void updateaddFinancialStatement(@Param("howmuchisit")Long howmuchisit);

	public void reducebalance(@Param("wIDsubject")String wIDsubject,@Param("userno")Long userno);
}
