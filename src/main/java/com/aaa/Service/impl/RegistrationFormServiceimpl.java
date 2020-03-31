package com.aaa.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aaa.Dao.RegistrationFormDao;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.RegistrationForm;
import com.aaa.Service.RegistrationFormService;
import com.aaa.pager.Pager;

@Service
@Transactional
public class RegistrationFormServiceimpl implements RegistrationFormService {
	@Autowired
	private RegistrationFormDao rfd;

	//孙斌编写上
	public Long AjaxHAAWADTO(Long a) {
		return rfd.AjaxHAAWADTO(a);
	}

	public Long submittoRegistrationForm(RegistrationForm r, Long userno) {
		Long x=rfd.AjaxHAAWADTOaa(r.getRstafftables().getStafftableno())+1L;
		r.setRreservationnumber(x);
		rfd.submittoRegistrationForm(r);
		
		Long count=rfd.selectFinancialStatement();
		count=count+5L;
		rfd.updateFinancialStatement(count);
		rfd.insertFinancialRecords(userno);
		
		Long userubalance=rfd.selectusernoRegistrationForm(userno);
		userubalance=userubalance-5;
		rfd.updateusernoRegistrationForm(userubalance,userno);
		return x;
	}

	public Pager<RegistrationForm> listAllRegistrationForm(String likewhere,
			Pager<RegistrationForm> pager,String rstate) {
		
		List<RegistrationForm> rows = rfd.pagerlistAllRegistrationForm(likewhere,pager.getOffset(), pager.getPagesize(),rstate);
		pager.setRows(rows);
		
		Long total = rfd.countlistAllRegistrationForm(likewhere,rstate);
		pager.setTotal(total);
		return pager;
	}
	public void onclickJH(Long registrationformno) {
		rfd.onclickJH(registrationformno);
	}

	public Pager<OpenList> listAllOpenList(String likewhere,
			Pager<OpenList> pager, Long long1) {
		List<OpenList> rows = rfd.pagerlistAllOpenList(likewhere,pager.getOffset(), pager.getPagesize(),long1);
		pager.setRows(rows);
		Long total = rfd.countlistAllOpenList(likewhere,long1);
		pager.setTotal(total);
		return pager;
	}
	public Long selectcountRegistrationForm(RegistrationForm r) {
		return rfd.selectcountRegistrationForm(r);
	}
	//孙斌编写下
	//康宁编写上
	public Pager<RegistrationForm> RegisteredQuery(Long userno,Pager<RegistrationForm> pager) {
		List<RegistrationForm> rows = rfd.RegisteredQuery(userno,pager.getOffset(), pager.getPagesize());
		pager.setRows(rows);
		Long total = rfd.selcount(userno);
		pager.setTotal(total);
		return pager;
	}
	//康宁编写下

}