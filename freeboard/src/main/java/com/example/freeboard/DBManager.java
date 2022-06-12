package com.example.freeboard;


import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBManager {
    private static String classname = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/aaa";
    private static String user = "root";
    private static String pw = "ehdrjf773";

    public static Connection connect() throws Exception {
        Class.forName(classname);
        Connection con = DriverManager.getConnection(url, user, pw);
        return con;
    }

    //select
    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws Exception {
        if(rs!=null){
            rs.close();
        }
        if(pstmt!=null){
            pstmt.close();
        }
        if(con!=null){
            con.close();
        }
    }

    public static void close(Connection con, PreparedStatement pstmt) throws Exception {
        if(pstmt!=null){
            pstmt.close();
        }
        if(con!=null){
            con.close();
        }
    }
}
