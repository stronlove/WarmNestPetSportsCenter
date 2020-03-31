package com.aaa.Service;

import java.util.List;

import com.aaa.Entity.DepartmentTable;
import com.aaa.Entity.OpenList;
import com.aaa.Entity.RegistrationForm;
import com.aaa.pager.Pager;

public interface RegistrationFormService {

	Long AjaxHAAWADTO(Long a);

	Long submittoRegistrationForm(RegistrationForm r, Long userno);

	Pager<RegistrationForm> listAllRegistrationForm(String likewhere,
			Pager<RegistrationForm> pager, String rstate);

	void onclickJH(Long registrationformno);

	Pager<OpenList> listAllOpenList(String likewhere, Pager<OpenList> pager, Long long1);

	Pager<RegistrationForm> RegisteredQuery(Long userno,
			Pager<RegistrationForm> pager);

	Long selectcountRegistrationForm(RegistrationForm r);
	
}
