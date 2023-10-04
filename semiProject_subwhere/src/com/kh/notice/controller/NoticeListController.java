package com.kh.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/list.no")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			// 공지사항 조회하기 
			// 페이징도 달기
		    
			int currentPage = Integer.parseInt(request.getParameter("cpage"));
			int noticeListCount = new NoticeService().selectAllNoticeCount();
			int boardLimit = 5;
			int pageLimit = 5;
			
			
			int startPage ;
			int endPage;
			int maxPage;
		    
		    
			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		    maxPage = (int)Math.ceil((double)noticeListCount / boardLimit);
		    endPage = startPage + pageLimit - 1;
		    
		    if(endPage > maxPage) {
		    	endPage = maxPage;
		    }
		
		    
		    PageInfo pi = new PageInfo(noticeListCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		    
		    ArrayList<Notice> list = new NoticeService().selectNotice(pi);
		    
		    String kind = request.getParameter("kind");
		    
		    if(kind != null) {  // 만약 헤더의 공지사항을 누른 뒤 공지사항 버튼을 눌렀을 경우 
		    	
		    	response.setContentType("application/json; charset=utf-8");
		    	new Gson().toJson(list,response.getWriter());
		    	
		    	
		    }else {  // 헤더의 공지사항을 눌렀을 경우 
		    	
		    	request.setAttribute("list", list);
		    	request.setAttribute("pi", pi);
		    	
		    	request.getRequestDispatcher("views/notice/noticeList.jsp").forward(request, response);
		    	
		    }
		    
		    
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
