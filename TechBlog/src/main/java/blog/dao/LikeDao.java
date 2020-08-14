package blog.dao;

import java.sql.*;

public class LikeDao {
	private Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean f = false;
		try {
			String query = "insert into liked(pid,uid) values(?,?)";
			PreparedStatement p = this.con.prepareStatement(query);
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;
		try {
			String q = "select count(*) from liked where pid=?";
			PreparedStatement p = this.con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet set = p.executeQuery();
			if (set.next()) {
				count = set.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
		try {
			String q = "select * from liked where pid=? and uid=?";
			PreparedStatement p = this.con.prepareStatement(q);

			p.setInt(1, pid);
			p.setInt(2, uid);
			ResultSet set = p.executeQuery();
			if (set.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteLike(int pid, int uid) {
		boolean f = false;
		try {
			String q = "delete from liked where pid=? and uid=?";
			PreparedStatement p = this.con.prepareStatement(q);

			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
