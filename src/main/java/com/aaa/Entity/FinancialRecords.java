package com.aaa.Entity;

/**
 * 编写人:孙斌
 * @author Administrator
 *
 */
public class FinancialRecords {
	private Long financialrecordsno;
	private String ftimeofoccurrence;
	private Long famountofoccurrence;
	private String fevent;
	private StaffTable foperatingstaffs;
	private PetUser fuser;
	private String fremarks;
	
	public Long getFinancialrecordsno() {
		return financialrecordsno;
	}
	public void setFinancialrecordsno(Long financialrecordsno) {
		this.financialrecordsno = financialrecordsno;
	}
	public String getFtimeofoccurrence() {
		return ftimeofoccurrence;
	}
	public void setFtimeofoccurrence(String ftimeofoccurrence) {
		this.ftimeofoccurrence = ftimeofoccurrence;
	}
	public Long getFamountofoccurrence() {
		return famountofoccurrence;
	}
	public void setFamountofoccurrence(Long famountofoccurrence) {
		this.famountofoccurrence = famountofoccurrence;
	}
	public String getFevent() {
		return fevent;
	}
	public void setFevent(String fevent) {
		this.fevent = fevent;
	}
	public StaffTable getFoperatingstaffs() {
		return foperatingstaffs;
	}
	public void setFoperatingstaffs(StaffTable foperatingstaffs) {
		this.foperatingstaffs = foperatingstaffs;
	}
	public String getFremarks() {
		return fremarks;
	}
	public void setFremarks(String fremarks) {
		this.fremarks = fremarks;
	}
	public PetUser getFuser() {
		return fuser;
	}
	public void setFuser(PetUser fuser) {
		this.fuser = fuser;
	}
	
	
}
