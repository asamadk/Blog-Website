package com.everything.blog;

public class User {
	private int userid;
	private String email;
	private String fname;
	private String lname;
	private String passwowrd;
	
	
	public User(String email, String fname, String lname, String passwowrd) {
		super();
		this.email = email;
		this.fname = fname;
		this.lname = lname;
		this.passwowrd = passwowrd;
	}


	public User(int userid, String email, String fname, String lname, String passwowrd) {
		super();
		this.userid = userid;
		this.email = email;
		this.fname = fname;
		this.lname = lname;
		this.passwowrd = passwowrd;
	}


	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getPasswowrd() {
		return passwowrd;
	}


	public void setPasswowrd(String passwowrd) {
		this.passwowrd = passwowrd;
	}
	
}
