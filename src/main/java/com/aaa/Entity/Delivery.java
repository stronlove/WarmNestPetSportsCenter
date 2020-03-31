package com.aaa.Entity;

/**
 * 送货实体类
 * 
 * @author Administrator
 * 
 */
public class Delivery {
	private Integer delivery;
	private Integer dstate;
	private String daddress;
	private Integer dnumber;
	private StaffTable dstafftableno;
	private Commodity dcommodity;
	private PetUser dpetuser;

	public Integer getDelivery() {
		return delivery;
	}

	public void setDelivery(Integer delivery) {
		this.delivery = delivery;
	}

	public Integer getDstate() {
		return dstate;
	}

	public void setDstate(Integer dstate) {
		this.dstate = dstate;
	}

	public String getDaddress() {
		return daddress;
	}

	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}

	public StaffTable getDstafftableno() {
		return dstafftableno;
	}

	public void setDstafftableno(StaffTable dstafftableno) {
		this.dstafftableno = dstafftableno;
	}

	public Commodity getDcommodity() {
		return dcommodity;
	}

	public void setDcommodity(Commodity dcommodity) {
		this.dcommodity = dcommodity;
	}

	public PetUser getDpetuser() {
		return dpetuser;
	}

	public void setDpetuser(PetUser dpetuser) {
		this.dpetuser = dpetuser;
	}

	public Integer getDnumber() {
		return dnumber;
	}

	public void setDnumber(Integer dnumber) {
		this.dnumber = dnumber;
	}

}
