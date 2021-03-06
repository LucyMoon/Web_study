package com.example.freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class TableManager {
    public void pluscount(int idx) throws Exception{

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("UPDATE board SET count=(select count from ((select count from board where idx=? )) A)+1 WHERE idx=?");
            pstmt.setInt(1, idx);
            pstmt.setInt(2, idx);

            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public boolean overlapcheck(String username) throws Exception{

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("select * from member where username=?");
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if(rs.next()){
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }

        return true;
    }

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

    public Member doselectmemberinfo(int idx) throws Exception{
        Member member = new Member();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("select * from member where id=?");
            pstmt.setInt(1, idx);
            rs = pstmt.executeQuery();
            if(rs.next()){
                member.setIdx(rs.getInt("id"));
                member.setPassword(rs.getString("password"));
                member.setId(rs.getString("username"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }

        return member;
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
            pstmt = con.prepareStatement("select ceil(count(id)/5) as cnt from member");
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

    public void dodeletemember(Integer idx) throws Exception{
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("delete from member where id=?");
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
            pstmt = con.prepareStatement("UPDATE board SET title=?, content=? WHERE idx=?");
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getIdx());
            pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt);
        }
    }

    public void doupdatemember(Member member) throws Exception{
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement("UPDATE member SET username=?, password=? WHERE id=?");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setInt(3, member.getIdx());
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
