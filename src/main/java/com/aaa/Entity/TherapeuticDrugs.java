package com.aaa.Entity;

public class TherapeuticDrugs {
	private Long terapeuticdrugsno;
	private Long tnumber;
	private Commodity tcommoditys;
	private OpenList topenlists;
	private Long tstate;
	
	public Long getTstate() {
		return tstate;
	}
	public void setTstate(Long tstate) {
		this.tstate = tstate;
	}
	public Long getTerapeuticdrugsno() {
		return terapeuticdrugsno;
	}
	public void setTerapeuticdrugsno(Long terapeuticdrugsno) {
		this.terapeuticdrugsno = terapeuticdrugsno;
	}
	public Long getTnumber() {
		return tnumber;
	}
	public void setTnumber(Long tnumber) {
		this.tnumber = tnumber;
	}
	public Commodity getTcommoditys() {
		return tcommoditys;
	}
	public void setTcommoditys(Commodity tcommoditys) {
		this.tcommoditys = tcommoditys;
	}
	public OpenList getTopenlists() {
		return topenlists;
	}
	public void setTopenlists(OpenList topenlists) {
		this.topenlists = topenlists;
	}
}
