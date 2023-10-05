package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.SightService;
import com.kh.board.model.vo.Sight;
import com.kh.board.model.vo.Uploadfile;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SightReadController
 */
@WebServlet("/read.si")
public class SightReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightReadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = 0;
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		//조회수 증가
		int result = new SightService().increaseCount(boardNo);
		if(result>0) {
			if(request.getSession().getAttribute("loginMember") != null) {
				userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
				request.setAttribute("userNo", userNo);
				int likeResult = new SightService().checkLike(boardNo, userNo);
				request.setAttribute("likeResult", likeResult);
				int reportResult = new SightService().checkReport(boardNo, userNo);
				request.setAttribute("reportResult", reportResult);
			}
			
			
			
			
			
			
			Sight s = new SightService().selectSight(boardNo);
			ArrayList<Uploadfile> list = new SightService().selectUploadfileList(boardNo);
			
			request.setAttribute("s", s);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/sights/sightsRead.jsp").forward(request, response);
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
