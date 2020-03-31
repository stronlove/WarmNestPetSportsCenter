package com.aaa.Entity;

/**
 * 编写人:孙斌
 * @author Administrator
 *
 */
public class StaffTable {
	private Long stafftableno;
	private String sname;
	private String spassword;
	private String srealname;
	private String sid;
	private Long srole;
	private DepartmentTable sdepartments;
	private RoleTable sroleas;
	
	public Long getStafftableno() {
		return stafftableno;
	}
	public void setStafftableno(Long stafftableno) {
		this.stafftableno = stafftableno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSpassword() {
		return spassword;
	}
	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}
	public String getSrealname() {
		return srealname;
	}
	public void setSrealname(String srealname) {
		this.srealname = srealname;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public Long getSrole() {
		return srole;
	}
	public void setSrole(Long srole) {
		this.srole = srole;
	}
	public DepartmentTable getSdepartments() {
		return sdepartments;
	}
	public void setSdepartments(DepartmentTable sdepartments) {
		this.sdepartments = sdepartments;
	}
	public RoleTable getSroleas() {
		return sroleas;
	}
	public void setSroleas(RoleTable sroleas) {
		this.sroleas = sroleas;
	}
	
}
