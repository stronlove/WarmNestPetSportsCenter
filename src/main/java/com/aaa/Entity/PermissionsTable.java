package com.aaa.Entity;

/**
 * 编写人:孙斌
 * @author Administrator
 *
 */
public class PermissionsTable {
	private Long permissionstableno;
	private String pname;
	private String purl;
	private String plevel;
	private RoleTable proletables;
	public RoleTable getProletables() {
		return proletables;
	}
	public void setProletables(RoleTable proletables) {
		this.proletables = proletables;
	}
	public Long getPermissionstableno() {
		return permissionstableno;
	}
	public void setPermissionstableno(Long permissionstableno) {
		this.permissionstableno = permissionstableno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPurl() {
		return purl;
	}
	public void setPurl(String purl) {
		this.purl = purl;
	}
	public String getPlevel() {
		return plevel;
	}
	public void setPlevel(String plevel) {
		this.plevel = plevel;
	}
	
}
