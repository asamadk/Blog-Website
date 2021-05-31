package com.everything.blog;

import java.sql.Timestamp;

public class postblog {
	 private int pid;
	 private String ptitle;
	 private String pcontent;
	 private Timestamp pdate;
	 private int catid;
	 private int uid;
	
	 public postblog() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 public postblog(String ptitle,String pcontent) {
		 this.ptitle = ptitle;
		 this.pcontent = pcontent;
	 }

	public postblog(int pid, String ptitle, String pcontent, Timestamp pdate, int catid, int uid) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pdate = pdate;
		this.catid = catid;
		this.uid = uid;
	}

	public postblog(String ptitle, String pcontent, Timestamp pdate, int catid, int uid) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pdate = pdate;
		this.catid = catid;
		this.uid = uid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public Timestamp getPdate() {
		return pdate;
	}

	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}

	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	 
	 
	 
}
