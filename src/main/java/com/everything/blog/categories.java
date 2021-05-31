package com.everything.blog;

public class categories {
	private int cid;
	private String categories;
	private String description;
	public categories() {
		super();
		// TODO Auto-generated constructor stub
	}
	public categories(int cid, String categories, String description) {
		super();
		this.cid = cid;
		this.categories = categories;
		this.description = description;
	}
	public categories(int cid, String categories) {
		super();
		this.cid = cid;
		this.categories = categories;
	}
	public categories(String categories) {
		super();
		this.categories = categories;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
