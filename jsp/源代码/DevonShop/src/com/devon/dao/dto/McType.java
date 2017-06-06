package com.devon.dao.dto;

import java.io.Serializable;

public class McType implements Serializable{

	private String nid;
	private String sname;
	private String npid;
	
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getNpid() {
		return npid;
	}
	public void setNpid(String npid) {
		this.npid = npid;
	}
}
