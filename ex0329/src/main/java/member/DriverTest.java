package member;

import java.sql.*;
import java.util.ArrayList;



 
public class DriverTest{
	
	
	public ArrayList<Member> doSelect(){
		
		ArrayList<Member> al = new ArrayList<Member>();
		
		
		System.out.println("doSelect 왔음 ...");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager
					.getConnection(
						"jdbc:mysql://localhost:3306/aaa",
							"root",
							"1234");
			pstmt = con
					.prepareStatement(
							"select * from member");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				member.setId(rs.getInt(1));
				member.setUsername(rs.getString(2));
				member.setPassword(rs.getString(3));
				al.add(member);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	
	
	
	
	public String doInsert(String username, String password){
		// 연결을 들고 있는거
		Connection con;
		// sql구문 담는 객체
		PreparedStatement pstmt;

		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aaa", "root", "1234");
			pstmt = con.prepareStatement("insert into member "
										+ "(username, password) "
										+ "values "
										+ "(?,?)");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.executeUpdate();
			System.out.println("Success");
			return "suc";
		}
		catch(SQLException ex){ 
			System.out.println("SQLException" + ex);
		}
		catch(Exception ex){
			System.out.println("Exception:" + ex);
		}
		return "fail";
	}
}