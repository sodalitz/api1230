package example1230.controller;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example1230.domain.BoardVo;
import example1230.domain.TicketVo;
import example1230.service.BoardDao;
import example1230.service.TicketDao;

@WebServlet("/ticketController")
public class TicketController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TicketDao td;

    String str;
    public TicketController() {
    }
    public TicketController(String path) {
        this.str = path;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        if (str.equals("/board/ticketList.do")) {


			RequestDispatcher rd = request.getRequestDispatcher("/board/ticketList.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/ticketCheck.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/ticketCheck.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/ticketDel.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/board/ticketDel.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/ticketLink.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/board/ticketLink.jsp");
			rd.forward(request, response);
		
        	



}
        
		else if (str.equals("/board/ticketDelAction.do")) {
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			
			TicketVo tv = new TicketVo();
			tv.setName(name);
			tv.setTel(tel);
			
			TicketDao td = new TicketDao();
			int value = td.ticketDel(tv);
			
			if (value==1) {
				response.sendRedirect(request.getContextPath()+"/board/boardPro.do");
			}else {
				response.sendRedirect(request.getContextPath()+"/board/ticketDel.do");	
			}
    }
        
		else if (str.equals("/board/ticketListAction.do")) {
		    String name = request.getParameter("name");
		    String tel = request.getParameter("tel");
		    String list = request.getParameter("list");
		    String countStr = request.getParameter("count");
		    int count = Integer.parseInt(countStr);
		    
		    TicketVo tv = new TicketVo();
		    tv.setName(name);
		    tv.setTel(tel);
		    tv.setList(list);
		    tv.setCount(count);
		    
		    TicketVo result = td.TicketList(tv);
		    int value = Integer.parseInt(result.getList());
		    
		    if (value==1) {
		        response.sendRedirect(request.getContextPath()+"/board/boardPro.do");
		    } else {
		        response.sendRedirect(request.getContextPath()+"/board/ticketList.do");    
		    }
		}
        
		else if (str.equals("/board/ticketCheckAction.do")) {
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			
			TicketVo tv = new TicketVo();
			tv.setName(name);
			tv.setTel(tel);
			
			TicketDao td = new TicketDao();
			int value = td.ticketCheck(tv);
			
			if (value==1) {
				response.sendRedirect(request.getContextPath()+"/board/boardPro.do");
			}else {
				response.sendRedirect(request.getContextPath()+"/board/ticketCheck.do");	
			}
}
        
		else if (str.equals("/board/boardProAction.do")) {
			String list = request.getParameter("list");
		    String countStr = request.getParameter("count");
		    int count = Integer.parseInt(countStr);

			TicketVo tv = new TicketVo();
			tv.setList(list);
		    tv.setCount(count);
			    
			    TicketVo result = td.TicketList(tv);
			    int value = Integer.parseInt(result.getList());
			    
			    if (value==1) {
			        response.sendRedirect(request.getContextPath()+"/board/boardPro.do");
			    } else {
			        response.sendRedirect(request.getContextPath()+"/board/boardPro.do");   
}}
    }
}