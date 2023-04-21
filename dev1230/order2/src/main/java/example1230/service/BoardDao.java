package example1230.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import example1230.dbconn.Dbconn;
import example1230.domain.BoardVo;
import example1230.domain.Criteria;
import example1230.domain.SearchCriteria;

public class BoardDao {
	
	Connection conn;
	
	public BoardDao() {		
		Dbconn dbconn = new Dbconn();
		conn = dbconn.getConnection();
	}
	
	public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri){
		ArrayList<BoardVo> blist = new ArrayList<BoardVo>();
		System.out.println("searchType:"+scri.getSearchType());
		
		String str = "";
		if (scri.getSearchType().equals("subject")) {
			str ="and subject like ?";
		}else if (scri.getSearchType().equals("writer")) {
			str ="and writer like ?";
		}
		
	 String sql="SELECT * FROM("
	 		+ "	SELECT ROWNUM AS rnum, A.* FROM ("
	 		+ "		SELECT * FROM board1230  WHERE delyn='N' "+str+" ORDER BY originbidx desc, depth asc) A "
	 		+ "		)B WHERE B.rnum BETWEEN ? AND ?";
	
	 System.out.println("sql"+sql);	
	 
	 		int snum = (scri.getPage()-1)* scri.getPerPageNum()+1;
	 		int dnum = scri.getPage()*scri.getPerPageNum();
	 		
		PreparedStatement pstmt= null;
		ResultSet rs =null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%" );
			pstmt.setInt(2,snum);
			pstmt.setInt(3,dnum);
			rs = pstmt.executeQuery();
			System.out.println("rs"+rs);
			while(rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setOriginbidx(rs.getInt("originbidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriter(rs.getString("writer"));
				bv.setWriteday(rs.getString("writeday"));	
				blist.add(bv);
			}				
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			//	conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}			
		System.out.println("DAO blist"+blist);
		return blist;
	}
	
	public int boardInsert(BoardVo bv) {
		int value=0;
		String sql="INSERT INTO board1230(bidx,originbidx,depth,level_, subject, contents,writer,ip, midx,pwd,filename) VALUES(bidx_seq.nextval,bidx_seq.nextval,0,0,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bv.getSubject());
			pstmt.setString(2, bv.getContents());
			pstmt.setString(3, bv.getWriter());
			pstmt.setString(4, bv.getIp());
			pstmt.setInt(5, bv.getMidx());
			pstmt.setString(6, bv.getPwd());
			pstmt.setString(7, bv.getFilename());
			value = pstmt.executeUpdate();			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {				
				e.printStackTrace();
			}			
		}				
		return value;
	}
	
	public BoardVo boardSelectOne(int bidx) {
		BoardVo bv =null;
		String sql="select * from board1230 where bidx=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContents(rs.getString("contents"));
				bv.setWriter(rs.getString("writer"));
				bv.setViewcnt(rs.getString("viewcnt"));
				bv.setOriginbidx(rs.getInt("originbidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setFilename(rs.getString("filename"));
			}		
			
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {				
				e.printStackTrace();
			}			
		}			
		return bv;
	} 
	
	public int boardViewCnt(int bidx) {
		System.out.println("bidx:"+bidx);
		int value=0;		
		String sql = "update board1230 set viewcnt =  NVL(viewcnt,0)+1 where bidx = ? ";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				pstmt.close();
			//	conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}			
		return value;
	}
	
		public int boardModify(BoardVo bv) {
			//System.out.println("비밀번호는?"+bv.getPwd());
			int value=0;
			String sql="update board1230 set subject=?, contents=?, writer=? where bidx=? and pwd=?";
			PreparedStatement pstmt= null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bv.getSubject());
				pstmt.setString(2, bv.getContents());
				pstmt.setString(3, bv.getWriter());
				pstmt.setInt(4,bv.getBidx());
				pstmt.setString(5, bv.getPwd());
				value = pstmt.executeUpdate();
			} catch (SQLException e) {				
				e.printStackTrace();
			} finally{
				try {
					pstmt.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}				
			
			return value;
		}
	
	public int boardDelete(BoardVo bv) {
		int value=0;
		
		String sql="update board1230 set delyn='Y' where bidx=? and pwd=?";
		PreparedStatement pstmt= null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bv.getBidx());
			pstmt.setString(2, bv.getPwd());			
			value = pstmt.executeUpdate();
		} catch (SQLException e) {				
			e.printStackTrace();
		} finally{
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}			
		return value;
	}
	

	public int boardReply(BoardVo bv) {		
		
		int value=0;
		int value2= 0;
				
		String sql="update board1230 set depth =depth+1 where originbidx = ? and depth >?";
		String sql2="insert into board1230 (bidx, originbidx,depth,level_,subject,contents,writer,ip,midx,pwd)"
		                 +" values(bidx_seq.nextval,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bv.getOriginbidx());
			pstmt.setInt(2, bv.getDepth());
			value = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,bv.getOriginbidx());
			pstmt.setInt(2, bv.getDepth()+1);
			pstmt.setInt(3, bv.getLevel_()+1);
			pstmt.setString(4, bv.getSubject());
			pstmt.setString(5, bv.getContents());
			pstmt.setString(6, bv.getWriter());
			pstmt.setString(7, bv.getIp());
			pstmt.setInt(8, bv.getMidx());
			pstmt.setString(9,bv.getPwd());
			value2 = pstmt.executeUpdate();
			
			conn.commit();			
			
			
		} catch (Exception e) {	
			try {
				conn.rollback();
			} catch (SQLException e1) {			
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {			
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}			
		}		
		return value2;
	}
	
	public int boardTotal(SearchCriteria scri) {

		String str = "";
		if (scri.getSearchType().equals("subject")) {
			str ="and subject like ?";
		}else if (scri.getSearchType().equals("writer")) {
			str ="and writer like ?";
		}
		
		String sql="select count(*) as cnt from board1230 where delyn='N' "+str;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();			
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}						
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {			
				e.printStackTrace();
			}
		}			
		return cnt;
	}	

}
