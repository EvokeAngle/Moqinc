package com.devon.dao.dto;

public class OrderItem {
	
	private String nid;
	private String norderId;
	private String nmcId;
	private String smcName;
	private String sdescription;
	private String simg;
	private String ncount;
	private String nprice;
	private String ntotalPrice;
	
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public String getNorderId() {
		return norderId;
	}
	public void setNorderId(String norderId) {
		this.norderId = norderId;
	}
	public String getNmcId() {
		return nmcId;
	}
	public void setNmcId(String nmcId) {
		this.nmcId = nmcId;
	}
	public String getSmcName() {
		return smcName;
	}
	public void setSmcName(String smcName) {
		this.smcName = smcName;
	}
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
	public String getNcount() {
		return ncount;
	}
	public void setNcount(String ncount) {
		this.ncount = ncount;
	}
	public String getNprice() {
		return nprice;
	}
	public void setNprice(String nprice) {
		this.nprice = nprice;
	}
	public String getNtotalPrice() {
		return ntotalPrice;
	}
	public void setNtotalPrice(String ntotalPrice) {
		this.ntotalPrice = ntotalPrice;
	}

}
