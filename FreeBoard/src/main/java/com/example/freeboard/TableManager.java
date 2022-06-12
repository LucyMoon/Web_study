package com.example.freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class TableManager {
    public Board doselectrow(int idx) throws Exception{
        Board board = new Board();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("select * from board where idx=?");
            pstmt.setInt(1, idx);
            rs = pstmt.executeQuery();
            if(rs.next()){
                board.setIdx(rs.getInt("idx"));
                board.setName(rs.getString("name"));
                board.setTitle(rs.getString("title"));
                board.setWdate(rs.getString("wdate"));
                board.setContent(rs.getString("content"));
                //board.setCount(rs.getInt("count"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }

        return board;
    }

    public List<Board> doselect(int pagenum) throws Exception{
        int startnum = (pagenum - 1) * 5;
        List<Board> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("select * from board order by idx desc limit "+startnum+", 5");
            rs = pstmt.executeQuery();
            while(rs.next()){
                Board board = new Board();
                board.setIdx(rs.getInt("idx"));
                board.setName(rs.getString("name"));
                board.setTitle(rs.getString("title"));
                board.setWdate(rs.getString("wdate"));
                board.setCount(rs.getInt("count"));
                list.add(board);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            DBManager.close(con,pstmt,rs);
        }

        return list;
    }

    public List<Member> MemberList(int pagenum) throws Exception{
        int startnum = (pagenum - 1) * 5;
        List<Member> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("select * from member order by id desc limit "+startnum+", 5");
            rs = pstmt.executeQuery();
            while(rs.next()){
                Member member = new Member();
                member.setIdx(rs.getInt("id"));
                member.setId(rs.getString("username"));
                member.setPassword(rs.getString("password"));
                list.add(member);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            DBManager.close(con,pstmt,rs);
        }

        return list;
    }

    public int getMemberCnt() throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("select ceil(count(idx)/5) as cnt from member");
            rs = pstmt.executeQuery();
            if(rs.next())
                return rs.getInt("cnt");
        }catch (Exception e){

        } finally {
            DBManager.close(con,pstmt,rs);
        }
        return 2;
    }

    public int getPageCnt() throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    try {
        con = DBManager.connect();
        pstmt = con.prepareStatement("select ceil(count(idx)/5) as cnt from board");
        rs = pstmt.executeQuery();
        if(rs.next())
            return rs.getInt("cnt");
    }catch (Exception e){

    } finally {
        DBManager.close(con,pstmt,rs);
    }
        return 2;
    }

    public void doinsert(Board board) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("insert into board (title, content, name, wdate) values (?,?,?,?)");
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getName());
            pstmt.setString(4, LocalDateTime.now().toString());
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt);
        }
    }

    public void doinsertmember(Member member) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("insert into `aaa`.`member` (username, password) values (?,?)");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt);
        }
    }

    public void dodelete(Integer idx) throws Exception{
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("delete from board where idx=?");
            pstmt.setInt(1, idx);
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt);
        }
    }

    public void doupdate(Board board) throws Exception{
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("UPDATE board SET title=?, content=?, name=? WHERE idx=?");
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getName());
            pstmt.setInt(4, board.getIdx());
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt);
        }
    }

    public boolean doselectmember(String id, String pw) throws Exception {

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("select * from member where username=? and password=? ");
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }

        return false;
    }
}
