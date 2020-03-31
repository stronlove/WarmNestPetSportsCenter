package com.aaa.Entity;

import java.util.List;

/**
 * 编写人:孙斌
 * @author Administrator
 *
 */
public class RoleTable {
	private Long roletableno;
	private String rname;
	private List<PermissionsTable> proletables;
	public Long getRoletableno() {
		return roletableno;
	}
	public void setRoletableno(Long roletableno) {
		this.roletableno = roletableno;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public List<PermissionsTable> getProletables() {
		return proletables;
	}
	public void setProletables(List<PermissionsTable> proletables) {
		this.proletables = proletables;
	}
	
}
