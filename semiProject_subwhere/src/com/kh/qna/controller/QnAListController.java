package com.kh.qna.controller;

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
import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAListController
 */
@WebServlet("/list.faq")
public class QnAListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징바는 우선 넘기고 그냥 조회만 해오자 
		
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
		
		ArrayList<QnA> list = new QnAService().selectQna(pi);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list,response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
