package ex0405;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDBManager {

	private static String classname = "com.mysql.cj.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost:3306/aaa";
	private static String user = "root";
	private static String password = "1234";

	public Connection getConnection() throws Exception {
		Class.forName(classname);
		Connection con = DriverManager.getConnection(URL, MemberDBManager.user, MemberDBManager.password);
		return con;
	}

	public boolean loginchk(String username, String password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from member where username = ? and password = ?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Member doUpdate(String username, String password, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("update member set username = ?, password = ? where id = ?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setInt(3, Integer.parseInt(id));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new Member();
	}

	public Member doSelectone(String id) {
		Member member = new Member();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from member where id = ?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setId(rs.getInt("id"));
				member.setUsername(rs.getString("username"));
				member.setPassword(rs.getString("password"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	public String doDelete(String ids[]) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String dids = "";
		for (int i = 0; i < ids.length; i++) {
			if (ids.length - 1 != i)
				dids = dids + ids[i] + ",";
			else
				dids = dids + ids[i];
		}
		try {
			con = getConnection();
			pstmt = con.prepareStatement("delete from member where id in (" + dids + ")");
			pstmt.executeUpdate();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	public List<Member> doselect() {
		ArrayList<Member> al = new ArrayList();

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setId(rs.getInt("id"));
				member.setUsername(rs.getString("username"));
				member.setPassword(rs.getString("password"));
				al.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public void doInsert(String user, String pass) {
		Connection con;
		PreparedStatement pstmt;

		try {
			con = getConnection();
			pstmt = con.prepareStatement("insert into member (username,password) values (?,?)");
			pstmt.setString(1, user);
			pstmt.setString(2, pass);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
