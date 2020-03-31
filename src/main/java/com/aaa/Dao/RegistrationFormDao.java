package com.aaa.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.aaa.Entity.OpenList;
import com.aaa.Entity.RegistrationForm;
import com.aaa.pager.Pager;

@Mapper
public interface RegistrationFormDao {

	//孙斌写的上
	Long AjaxHAAWADTO(Long a);

	void submittoRegistrationForm(RegistrationForm r);

	Long AjaxHAAWADTOaa(Long a);

	Long selectFinancialStatement();

	void updateFinancialStatement(Long count);

	void insertFinancialRecords(@Param("userno")Long userno);

	Long selectusernoRegistrationForm(Long userno);

	void updateusernoRegistrationForm(@Param("ubalance")Long ubalance, @Param("userno")Long userno);

	List<RegistrationForm> pagerlistAllRegistrationForm(@Param("likewhere")String likewhere,
			@Param("offset")Long offset, @Param("pagesize")Long pagesize,@Param("rstate") String rstate);

	Long countlistAllRegistrationForm(@Param("likewhere")String likewhere, @Param("rstate")String rstate);

	void onclickJH(@Param("registrationformno")Long registrationformno);

	List<OpenList> pagerlistAllOpenList(@Param("likewhere")String likewhere,  @Param("offset")Long offset,
			@Param("pagesize")Long pagesize, @Param("long1")Long long1);

	Long countlistAllOpenList(@Param("likewhere")String likewhere, @Param("long1")Long long1);

	Long selectcountRegistrationForm(RegistrationForm r);
	//孙斌写的下
	//康宁编写上
	List<RegistrationForm> RegisteredQuery(@Param("userno")Long userno,@Param("offset")Long offset, @Param("pagesize")Long pagesize);

	Long selcount(@Param("userno")Long userno);
	//康宁编写下

}
