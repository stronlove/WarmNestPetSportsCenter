package com.aaa.Entity;

/**
 * 编写人:孙斌
 * @author Administrator
 *
 */
public class RegistrationForm {
	private Long registrationformno;
	private Long rreservationnumber;
	private String rdate;
	private Long rstate;
	private Pet rpets;
	private StaffTable rstafftables;
	
	public Long getRegistrationformno() {
		return registrationformno;
	}
	public void setRegistrationformno(Long registrationformno) {
		this.registrationformno = registrationformno;
	}
	public Long getRreservationnumber() {
		return rreservationnumber;
	}
	public void setRreservationnumber(Long rreservationnumber) {
		this.rreservationnumber = rreservationnumber;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public Long getRstate() {
		return rstate;
	}
	public void setRstate(Long rstate) {
		this.rstate = rstate;
	}
	public Pet getRpets() {
		return rpets;
	}
	public void setRpets(Pet rpets) {
		this.rpets = rpets;
	}
	public StaffTable getRstafftables() {
		return rstafftables;
	}
	public void setRstafftables(StaffTable rstafftables) {
		this.rstafftables = rstafftables;
	}
	
}
