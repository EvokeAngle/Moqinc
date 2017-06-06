package com.devon.dao.dto;

public class GoodsSearchCondition {

	private String nmaxId;
	private String nminId;
	private String keywords;
	public String getNmaxId() {
		return nmaxId;
	}
	public void setNmaxId(String nmaxId) {
		this.nmaxId = nmaxId;
	}
	public String getNminId() {
		return nminId;
	}
	public void setNminId(String nminId) {
		this.nminId = nminId;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
}
