package com.aaa.Entity;
/**
 * 编写人:孙斌
 * @author Administrator
 *
 */
public class Pet {
	private Long petno;
	private String pname;
	private Long page;
	private Long pweight;
	private Long psterilizationState;
	private Long pcatanddog;
	private Long pstate;
	private String pimg;
	private PetUser pusers;
	
	public Long getPetno() {
		return petno;
	}
	public void setPetno(Long petno) {
		this.petno = petno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Long getPage() {
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public Long getPweight() {
		return pweight;
	}
	public void setPweight(Long pweight) {
		this.pweight = pweight;
	}
	public Long getPsterilizationState() {
		return psterilizationState;
	}
	public void setPsterilizationState(Long psterilizationState) {
		this.psterilizationState = psterilizationState;
	}
	public Long getPcatanddog() {
		return pcatanddog;
	}
	public void setPcatanddog(Long pcatanddog) {
		this.pcatanddog = pcatanddog;
	}
	public Long getPstate() {
		return pstate;
	}
	public void setPstate(Long pstate) {
		this.pstate = pstate;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public PetUser getPusers() {
		return pusers;
	}
	public void setPusers(PetUser pusers) {
		this.pusers = pusers;
	}
	
}
