package blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import blog.entities.Category;
import blog.entities.Post;
public class PostDao 
{
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories()
	{
		ArrayList<Category> list=new ArrayList<Category>();
		
		try
		{
			String q="select * from categories";
			Statement st=this.con.createStatement();
			ResultSet set=st.executeQuery(q);
			while(set.next())
			{
				int cid=set.getInt("cid");
				String name=set.getString("Name");
				String description=set.getString("Description");
				
				Category c=new Category(cid,name,description);
				list.add(c);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	public boolean savePost(Post p)
	{
		boolean flag=false;
		try
		{
			String q="insert into posts(PTitle ,PContent,PCode,PPIC,CatId,UserId)values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2,p.getpContent());
			pstmt.setString(3,p.getpCode());
			pstmt.setString(4,p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			pstmt.executeUpdate();
			flag=true;
			
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	//get all the posts
		public List<Post> getAllPosts()
		{
			List<Post> list=new ArrayList<Post>();
			//fetch all the posts
			try
			{
				PreparedStatement p=con.prepareStatement("select * from posts order by pid desc");
				ResultSet set=p.executeQuery();
				while(set.next())
				{
					 int Pid=set.getInt("Pid");
					 String PTitle=set.getString("PTitle");
					 String PContent=set.getString("PContent");
					 String PCode=set.getString("PCode");
					 String PPIC=set.getString("PPIC");
					 Timestamp pDate=set.getTimestamp("pDate");
					 int CatId=set.getInt("CatId");
					 int UserId=set.getInt("UserId");
					 Post post=new Post(Pid,PTitle,PContent,PCode,PPIC,pDate,CatId,UserId);
					 list.add(post);
				
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
		}
		
		
		public List<Post> getPostByCatId(int catId)
		{
			List<Post> list=new ArrayList<Post>();
			//fetch all the posts of given cat id
			try
			{
				PreparedStatement p=con.prepareStatement("select * from posts where catId=?");
				p.setInt(1, catId);
				ResultSet set=p.executeQuery();
				while(set.next())
				{
					 int Pid=set.getInt("Pid");
					 String PTitle=set.getString("PTitle");
					 String PContent=set.getString("PContent");
					 String PCode=set.getString("PCode");
					 String PPIC=set.getString("PPIC");
					 Timestamp pDate=set.getTimestamp("pDate");
					 int CatId=set.getInt("CatId");
					 int UserId=set.getInt("UserId");
					 Post post=new Post(Pid,PTitle,PContent,PCode,PPIC,pDate,CatId,UserId);
					 list.add(post);
				
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
		}
		public Post getPostByPostId(int postId)
		{
			Post post=null;
			String query="select * from posts where Pid=?";
			try
			{
				PreparedStatement p=this.con.prepareStatement(query);
				p.setInt(1, postId);
				
				ResultSet set=p.executeQuery();
				if(set.next())
				{
					 int Pid=set.getInt("Pid");
					 String PTitle=set.getString("PTitle");
					 String PContent=set.getString("PContent");
					 String PCode=set.getString("PCode");
					 String PPIC=set.getString("PPIC");
					 Timestamp pDate=set.getTimestamp("pDate");
					 int CatId=set.getInt("CatId");
					 int UserId=set.getInt("UserId");
					 post=new Post(Pid,PTitle,PContent,PCode,PPIC,pDate,CatId,UserId);
					
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return post;
		}
}
