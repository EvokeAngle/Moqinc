package com.devon.dao.dto;

public class Goods {
	private int nid;
	private String sname;
	private String simg;
	private String sdescription;
	private double nprice;
	private int ncount;
	
	public String getSdescription() {
		return sdescription;
	}
	public void setSdescription(String sdescription) {
		this.sdescription = sdescription;
	}
	
	public String getSimg() {
		return simg;
	}
	public void setSimg(String simg) {
		this.simg = simg;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public double getNprice() {
		return nprice;
	}
	public void setNprice(double nprice) {
		this.nprice = nprice;
	}
	public int getNcount() {
		return ncount;
	}
	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	

	
}
