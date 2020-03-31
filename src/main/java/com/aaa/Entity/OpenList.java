package com.aaa.Entity;

import java.util.List;

public class OpenList {
	private Long openlistno;
	private String osymptom;
	private String diagnosisandtreatment;
	private String ooctorsorder;
	private String ostate;
	private Long hangsinglenumber;
	private String listtime;
	private Pet opets;
	private StaffTable ostafftables;
	
	public Long getOpenlistno() {
		return openlistno;
	}
	public void setOpenlistno(Long openlistno) {
		this.openlistno = openlistno;
	}
	public String getOsymptom() {
		return osymptom;
	}
	public void setOsymptom(String osymptom) {
		this.osymptom = osymptom;
	}
	public String getDiagnosisandtreatment() {
		return diagnosisandtreatment;
	}
	public void setDiagnosisandtreatment(String diagnosisandtreatment) {
		this.diagnosisandtreatment = diagnosisandtreatment;
	}
	public String getOoctorsorder() {
		return ooctorsorder;
	}
	public void setOoctorsorder(String ooctorsorder) {
		this.ooctorsorder = ooctorsorder;
	}
	public String getOstate() {
		return ostate;
	}
	public void setOstate(String ostate) {
		this.ostate = ostate;
	}
	public Pet getOpets() {
		return opets;
	}
	public void setOpets(Pet opets) {
		this.opets = opets;
	}
	public StaffTable getOstafftables() {
		return ostafftables;
	}
	public void setOstafftables(StaffTable ostafftables) {
		this.ostafftables = ostafftables;
	}
	public Long getHangsinglenumber() {
		return hangsinglenumber;
	}
	public void setHangsinglenumber(Long hangsinglenumber) {
		this.hangsinglenumber = hangsinglenumber;
	}
	public String getListtime() {
		return listtime;
	}
	public void setListtime(String listtime) {
		this.listtime = listtime;
	}
}
