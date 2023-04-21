package example1230.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import example1230.dbconn.Dbconn;
import example1230.domain.TicketVo;

public class TicketDao {
    Connection conn;
    public TicketDao() {
    
    	Dbconn dbconn = new Dbconn();
		conn = dbconn.getConnection();
    }
    
    public TicketVo TicketList(TicketVo tv) {
        int result = 0;
                
        String sql = "INSERT INTO TICKET7 (name, tel, list, count) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = null;
		ResultSet rs = null;
		
        try {
        	
            pstmt = conn.prepareStatement(sql);  // pstmt 초기화
            pstmt.setString(1, tv.getName());
            pstmt.setString(2, tv.getTel());
            pstmt.setString(3, tv.getList());
            pstmt.setInt(4, tv.getCount());



            
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return tv;
    }
    
    public int ticketDel(TicketVo tv) {
        int value = 0;
        
        String sql = "DELETE FROM TICKET7 WHERE name=? AND tel=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tv.getName());
            pstmt.setString(2, tv.getTel());         
            value = pstmt.executeUpdate();
        } catch (SQLException e) {              
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }           
        return value;
    }
    
    public int ticketCheck(TicketVo tv) {
        int value = 0;
        
        String sql = "SELECT * FROM TICKET7 where name=? and tel=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tv.getName());
            pstmt.setString(2, tv.getTel());         
            value = pstmt.executeUpdate();
        } catch (SQLException e) {              
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }           
        return value;
    }
    
    public ResultSet boardPro(TicketVo tv) {
        ResultSet rs = null;
        String sql = "SELECT list, SUM(count), lpad('▒', SUM(COUNT)/10,'▒') AS 예매율 FROM TICKET7 GROUP BY list ORDER BY list ASC";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

	public int TicketLink(TicketVo tv) {
		 int value = 0;
	        
	        String sql = "SELECT * FROM TICKET7 where name=? and tel=?";
	        PreparedStatement pstmt = null;
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, tv.getName());
	            pstmt.setString(2, tv.getTel());         
	            value = pstmt.executeUpdate();
	        } catch (SQLException e) {              
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	}
}
	        return value;
}
}
