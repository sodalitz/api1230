package example1230.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import example1230.domain.BoardVo;
import example1230.domain.Criteria;
import example1230.domain.PageMaker;
import example1230.domain.SearchCriteria;
import example1230.service.BoardDao;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String str;
	public BoardController(String path) {
		this.str = path;
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		if (str.equals("/board/boardList.do")) {
		//	System.out.println("boardList.do 들어옴");
			
			//검색시 사용하는 값을 추가로 넘겨준다
			String searchType = request.getParameter("searchType");
			if (searchType == null) searchType= "subject";
			String keyword = request.getParameter("keyword");
			if (keyword ==null) keyword ="";
			
			
			String page = request.getParameter("page");
			if (page == null)  page ="1";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(Integer.parseInt(page));   //넘어온 page값을 cri에 담는다
			scri.setSearchType(searchType);
			scri.setKeyword(keyword);
			
			BoardDao bd = new BoardDao();
			ArrayList<BoardVo> blist = bd.boardSelectAll(scri);		
			System.out.println("blist:"+blist);
			int cnt = bd.boardTotal(scri);
		//	System.out.println("cnt :"+cnt);
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			request.setAttribute("blist", blist);
			request.setAttribute("pm", pm);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardList.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/boardWrite.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/boardMap.do")) {
			//보드맵 
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardMap.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/boardIntro.do")) {
			//소개
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardIntro.jsp");
			rd.forward(request, response);
		}else if(str.equals("/board/boardPro.do")) {
			//상품
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardPro.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/result.do")) {
			//결과
			RequestDispatcher rd = request.getRequestDispatcher("/board/result.jsp" );
			rd.forward(request, response);
			
		}else if(str.equals("/board/admin.do")) {
			//결과
			RequestDispatcher rd = request.getRequestDispatcher("/board/admin.jsp" );
			rd.forward(request, response);
			
		}else if (str.equals("/board/boardWriteAction.do")) {
			
			String fileEncoding = "UTF-8";
			int fileSize = 15*1024*1024; 
			String filePath = "D:\\dev1230\\Example1230\\src\\main\\webapp\\image";
			DefaultFileRenamePolicy renamePolicy = new DefaultFileRenamePolicy();
			
			MultipartRequest multiRequest = new MultipartRequest(request,filePath,fileSize,fileEncoding,renamePolicy);
						
			String subject 	= multiRequest.getParameter("subject");
			String contents 	= multiRequest.getParameter("contents");	
			String writer = multiRequest.getParameter("writer");	
			String pwd = multiRequest.getParameter("pwd");	
			String ip = InetAddress.getLocalHost().getHostAddress();
	
			//열거자에 넘어온 파일이름을 담는다
			Enumeration  files = multiRequest.getFileNames();
			//열거자에 담긴 다음 파일을 옮겨담는다
			String file = (String)files.nextElement();
			//저장되는 이름을 추출
			String fileName = multiRequest.getFilesystemName(file);
			
			String originFileName = multiRequest.getOriginalFileName(file);
			
			
			HttpSession session = request.getSession();	
			int midx=0;
			if (session.getAttribute("midx") != null) {
				midx = (int)session.getAttribute("midx");
			}
	//	int midx = 10;
		
		//처리하는부분
		BoardVo bv = new BoardVo();
		bv.setSubject(subject);
		bv.setContents(contents);
		bv.setWriter(writer);
		bv.setIp(ip);
		bv.setMidx(midx);
		bv.setPwd(pwd);
		bv.setFilename(fileName);
		
		BoardDao bd = new BoardDao();
		int value = bd.boardInsert(bv);		
		
		//이동하는 부분	
			if (value ==1) {
			 response.sendRedirect(request.getContextPath()+"/board/boardList.do");
			}else {
			response.sendRedirect(request.getContextPath()+"/board/boardWrite.do");	
			}
		}else if (str.equals("/board/boardContents.do")) {
			
			String bidx = request.getParameter("bidx");
			System.out.println("bidx:"+bidx);
			int bidxInt   = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();
			int value = bd.boardViewCnt(bidxInt);
			BoardVo bv = bd.boardSelectOne(bidxInt);
			
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardContents.jsp");
			rd.forward(request, response);			
		}else if (str.equals("/board/boardModify.do")) {
			System.out.println("boardModify.do 들어왔음");
			String bidx = request.getParameter("bidx");
			System.out.println("bidx:"+bidx);
			int bidxInt   = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();		
			BoardVo bv = bd.boardSelectOne(bidxInt);			
			
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardModify.jsp");
			rd.forward(request, response);		
			
		}else if (str.equals("/board/boardModifyAction.do")) {
			String bidx = request.getParameter("bidx");
			int bidxInt = Integer.parseInt(bidx);
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			
			//update 메소드 사용
			BoardVo bv = new BoardVo();
			bv.setBidx(bidxInt);
			bv.setSubject(subject);
			bv.setContents(contents);
			bv.setWriter(writer);	
			bv.setPwd(pwd);
			
			BoardDao bd = new BoardDao();
			int value = bd.boardModify(bv);			
			
				if (value==1) {
					response.sendRedirect(request.getContextPath()+"/board/boardContents.do?bidx="+bidx);			
				}else {
					response.sendRedirect(request.getContextPath()+"/board/boardModify.do?bidx="+bidx);		
				}
			}else if (str.equals("/board/boardDelete.do")) {
				String bidx = request.getParameter("bidx");
				int bidxInt = Integer.parseInt(bidx);
				
				BoardDao bd = new BoardDao();		
				BoardVo bv = bd.boardSelectOne(bidxInt);			
				
				request.setAttribute("bv", bv);				
				
				RequestDispatcher rd = request.getRequestDispatcher("/board/boardDelete.jsp");
				rd.forward(request, response);	
			}else if (str.equals("/board/boardDeleteAction.do")) {
				String bidx = request.getParameter("bidx");
				int bidxInt = Integer.parseInt(bidx);
				String pwd = request.getParameter("pwd");
				
				BoardVo bv = new BoardVo();
				bv.setBidx(bidxInt);
				bv.setPwd(pwd);
				
				BoardDao bd = new BoardDao();
				int value = bd.boardDelete(bv);
				
				if (value==1) {
					response.sendRedirect(request.getContextPath()+"/board/boardList.do");
				}else {
					response.sendRedirect(request.getContextPath()+"/board/boardDelete.do?bidx="+bidx);	
				}
			}else if (str.equals("/board/boardReply.do")) {
				String bidx = request.getParameter("bidx");
				System.out.println("bidx"+bidx);
				String originbidx  = request.getParameter("originbidx");		
				System.out.println("originbidx"+originbidx);
				String depth  = request.getParameter("depth");		
				System.out.println("depth"+depth);
				String level_  = request.getParameter("level_");
				System.out.println("level_"+level_);
				
				BoardVo bv = new BoardVo();
				bv.setBidx(Integer.parseInt(bidx));
				bv.setOriginbidx(Integer.parseInt(originbidx));
				bv.setDepth(Integer.parseInt(depth));
				bv.setLevel_(Integer.parseInt(level_));
				
				request.setAttribute("bv", bv);
				
				RequestDispatcher rd = request.getRequestDispatcher("/board/boardReply.jsp");
				rd.forward(request, response);		
				
			}else if (str.equals("/board/boardReplyAction.do")) {
				String bidx = request.getParameter("bidx");				
				String originbidx  = request.getParameter("originbidx");		
				String depth  = request.getParameter("depth");		
				String level_  = request.getParameter("level_");
				String subject =	request.getParameter("subject");
				String contents=	request.getParameter("contents");
				String writer =	request.getParameter("writer");
				String pwd =	request.getParameter("pwd");
				String ip = InetAddress.getLocalHost().getHostAddress();
				
				HttpSession session = request.getSession();	
				int midx=0;
				if (session.getAttribute("midx") != null) {
					midx = (int)session.getAttribute("midx");
				}
				
				BoardVo bv = new BoardVo();
			//	bv.setBidx(Integer.parseInt(bidx));
				bv.setOriginbidx(Integer.parseInt(originbidx));
				bv.setDepth(Integer.parseInt(depth));
				bv.setLevel_(Integer.parseInt(level_));
				bv.setSubject(subject);
				bv.setContents(contents);
				bv.setWriter(writer);
				bv.setIp(ip);
				bv.setPwd(pwd);
				bv.setMidx(midx);
				
				BoardDao bd = new BoardDao();
				int value = bd.boardReply(bv);	
				
				if (value ==1) {				
				response.sendRedirect(request.getContextPath()+"/board/boardList.do");
				}else {
				response.sendRedirect(request.getContextPath()+"/board/boardContents.do?bidx="+bidx);	
				}
			}else if  (str.equals("/board/fileDownload.do")) {
				
				String filename = request.getParameter("filename");
				String filePath = "D:\\dev1230\\Example1230\\src\\main\\webapp\\image";
				//전체경로
				String fullFilePath = filePath +"\\"+filename;
				//실제 물리적인 경로로 인식시키기 위해
				Path source = Paths.get(fullFilePath);
				//파일형식 추출
				String mimeType = Files.probeContentType(source);
				//헤더에 파일형식 담아서 가지고 간다
				//response.setContentType(mimeType);
				response.setContentType("application/octet-stream");
				//한글깨짐 방지
				String filenameEncoding = new String(filename.getBytes("UTF-8"));
				//인코딩한 파일이름을 첨부해서 헤더에 담아서 가져간다
				response.setHeader("Content-Disposition", "attachment;fileName="+filenameEncoding);
				
				FileInputStream fileInputStream = new FileInputStream(fullFilePath);
				
				ServletOutputStream so = response.getOutputStream();
				
				int read = 0;
				byte[] b = new byte[4096];
				while( (read = fileInputStream.read(b, 0, b.length)) != -1   ) {
					so.write(b, 0, read);						
				}
				so.flush();
				so.close();
				fileInputStream.close();				
			}		
				
		
	}
	
	
	////
	

	
	
	///
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
