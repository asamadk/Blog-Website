package com.everything.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.everything.blog.categories;
import com.everything.blog.postblog;

public class Categoriesdao {
	
		Connection con;
		
		public Categoriesdao(Connection con) {
			this.con = con;
		}
		
		public ArrayList<categories> retriveCategories() {
			
			String query="select * from categories";
			ArrayList<categories> li = new ArrayList<>();
			
			try {
				
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					int id = rs.getInt("cid");
					String name = rs.getString("name");
					categories cat = new categories(id,name);
					li.add(cat);
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return li;
		}
		
		public boolean insertblog(postblog p) {
			
			String query="insert into posts (ptitle,pcontent,pdate,catid,uid) values(?,?,?,?,?)";
			
			try {
				
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, p.getPtitle());
				ps.setString(2, p.getPcontent());
				ps.setTimestamp(3, p.getPdate());
				ps.setInt(4, p.getCatid());
				ps.setInt(5, p.getUid());
				
				int rs = ps.executeUpdate();
				if(rs == 1)return true;
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}
		
		public List<postblog> getAllPost(){
			List<postblog> li = new ArrayList<postblog>();
			
			try {
				
			String query="select * from posts";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				int postid = rs.getInt("pid");
				String posttitle = rs.getString("ptitle");
				String postContent = rs.getString("pcontent");
				Timestamp postDate = rs.getTimestamp("pdate");
				int categoryId = rs.getInt("catid");
				int userIdForeignKey = rs.getInt("uid");
				
				postblog pb = new postblog(postid, posttitle, postContent, postDate, categoryId, userIdForeignKey);
				li.add(pb);
				
			}
			
			}catch(Exception e) {
				
				e.printStackTrace();
			
			}
			
			return li;
		}
		
		public List<postblog> getpostbycat(int catid){
			
			List<postblog> list = new ArrayList<postblog>();
			String query = "select * from posts where catid=?";
			
			try {
				
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, catid);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					
					int postid = rs.getInt("pid");
					String postitle = rs.getString("ptitle");
					String postcontent = rs.getString("pcontent");
					Timestamp postDate = rs.getTimestamp("pdate");
					int categoryId = rs.getInt("catid");
					int userId = rs.getInt("uid");
					
					postblog pb = new postblog(postid,postitle,postcontent,postDate,categoryId,userId);
					list.add(pb);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		public postblog getfullblog(int postID) {
			
			postblog pb = null;
			String query = "select * from posts where pid = ?";
			
			try {
				
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, postID);
				
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					String posttitle = rs.getString("ptitle");
					String postcontent = rs.getString("pcontent");
					 
					 pb = new postblog(posttitle,postcontent);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return pb;
		}
		
		public List<postblog> getpostbyuser(int id){
			List<postblog> list = new ArrayList<>();
			String query = "select * from posts where uid = ?";
			
			try {
				
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					
					int postid = rs.getInt("pid");
					String postitle = rs.getString("ptitle");
					String postcontent = rs.getString("pcontent");
					Timestamp postDate = rs.getTimestamp("pdate");
					int categoryId = rs.getInt("catid");
					int userId = rs.getInt("uid");
					
					postblog p = new postblog(postid, postitle, postcontent, postDate, categoryId, userId);
					list.add(p);
					
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return list;
		}
	
}
