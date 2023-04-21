package com.myezen.myapp.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myezen.myapp.domain.BoardVo;
import com.myezen.myapp.domain.PageMaker;
import com.myezen.myapp.domain.SearchCriteria;
import com.myezen.myapp.service.BoardService;
import com.myezen.myapp.util.UploadFileUtiles;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService bs;
	
	@Autowired(required=false)
	PageMaker pm;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(SearchCriteria scri,  Model model) {		
		
		int totalCount = bs.boardTotal(scri);
		pm.setScri(scri);
		pm.setTotalCount(totalCount);
		
		ArrayList<BoardVo> blist = bs.boardSelectAll(scri);
		
		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);
		
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardContents.do")
	public String boardContents(@RequestParam("bidx") int bidxInt, Model model) {
		
		int value = bs.boardViewCnt(bidxInt);
		BoardVo bv = bs.boardSelectOne(bidxInt);
		
		model.addAttribute("bv", bv);
		
		return "board/boardContents";
	}
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite() {		
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/boardWriteAction.do")
	public String boardWriteAction(
			@RequestParam("subject") String subject,
			@RequestParam("contents") String contents,
			@RequestParam("writer") String writer,
			@RequestParam("pwd") String pwd,
			@RequestParam("filename") MultipartFile filename,
			HttpSession session
			) throws Exception {	
		
			MultipartFile file = filename;
			System.out.println("원본파일이름"+file.getOriginalFilename());
		
			String uploadedFileName="";
			if (!file.getOriginalFilename().equals("")) {
				uploadedFileName = UploadFileUtiles.uploadFile(
						uploadPath, 
						file.getOriginalFilename(), 
						file.getBytes());				
			}
			System.out.println("uploadedFileName"+uploadedFileName);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
						
			int midx=0;
			if (session.getAttribute("midx") != null) {
				midx = Integer.parseInt(session.getAttribute("midx").toString());
			}
		
			BoardVo bv = new BoardVo();
			bv.setSubject(subject);
			bv.setContents(contents);
			bv.setWriter(writer);
			bv.setIp(ip);
			bv.setMidx(midx);
			bv.setPwd(pwd);
			bv.setFilename(uploadedFileName);
			
			int value = bs.boardInsert(bv);			
			
		return "redirect:/board/boardList.do";
	}
	
	
	
	
	
}
