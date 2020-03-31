package com.aaa.Entity;

/**
 * 商品实体类
 * 
 * @author Administrator
 * 
 */
public class Commodity {
	private Integer commodityno;
	private String cpicture;
	private String cprice;
	private String cfunction;
	private StaffTable cimporter;
	private CommoditTypeTable ccommodittypetables;
	private String cinventory;

	public Integer getCommodityno() {
		return commodityno;
	}

	public void setCommodityno(Integer commodityno) {
		this.commodityno = commodityno;
	}

	public String getCpicture() {
		return cpicture;
	}

	public void setCpicture(String cpicture) {
		this.cpicture = cpicture;
	}

	public String getCprice() {
		return cprice;
	}

	public void setCprice(String cprice) {
		this.cprice = cprice;
	}

	public String getCfunction() {
		return cfunction;
	}

	public void setCfunction(String cfunction) {
		this.cfunction = cfunction;
	}

	public StaffTable getCimporter() {
		return cimporter;
	}

	public void setCimporter(StaffTable cimporter) {
		this.cimporter = cimporter;
	}

	public CommoditTypeTable getCcommodittypetables() {
		return ccommodittypetables;
	}

	public void setCcommodittypetables(CommoditTypeTable ccommodittypetables) {
		this.ccommodittypetables = ccommodittypetables;
	}

	public String getCinventory() {
		return cinventory;
	}

	public void setCinventory(String cinventory) {
		this.cinventory = cinventory;
	}

}
