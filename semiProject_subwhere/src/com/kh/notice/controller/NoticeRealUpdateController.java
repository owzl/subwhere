package com.kh.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeRealUpdateController
 */
@WebServlet("/updateSemi.no")
public class NoticeRealUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeRealUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 
		request.setCharacterEncoding("UTF-8");
		
		int upNo = Integer.parseInt(request.getParameter("upNo"));
		
		String noticeTitle = request.getParameter("noticeTItle");
		
		String noticeContent = request.getParameter("noticeContent");
		
		
		int result = new NoticeService().updateNotice(upNo,noticeTitle,noticeContent);
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "공지사항 수정을 성공했습니다.");
			response.sendRedirect(request.getContextPath() + "/detailsemi.no?ujBno=" + upNo);
			
			
			
		}else {
			session.setAttribute("alertMsg", "공지사항 수정을 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "detailsemi.no?ujBno=" + upNo);
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
