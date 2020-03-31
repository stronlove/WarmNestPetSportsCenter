package com.aaa.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.FinancialRecords;
import com.aaa.Entity.statistics;
import com.aaa.pager.Pager;

//财务记录接口
public interface FinancialRecordsService {
	public List<statistics> selMoney(@Param("month")Integer month);

	public Long addJumpPayPage(String userno, String howmuchisit, Long long1);

	public Pager<FinancialRecords> SelectlimitFinancialRecords(
			Pager<FinancialRecords> pager, String likewhere);

	public Long qianJumpPayPage(String string, String wIDtotal_amount, Long l);

	public Long selectFinancialStatementcount();

	public void process(Long orderId, Integer paymentstatus);

	public void addFinancialStatement(Long howmuchisit);

	public void reducebalance(Long userno, Long howmuchisit);
}
