package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminSearchMember
 */
@WebServlet("/search.ad")
public class AdminSearchMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("searchById");
		int listCount; //현재 총 게시글 갯수
		int currentPage; //현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; //현재 페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩)
		int boardLimit; //한 페이지내에 보여질 게시글 최대 개수(몇개 단위씩)
		
		int maxPage; //가장 마지막페이지 (총 페이지 수)
		int startPage; //페이징바의 시작수
		int endPage; //페이징바의 끝수
		
		listCount = new AdminService().selectListCount(search);
		
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		
		pageLimit = 5;
		
	
		boardLimit = 5;
		
		
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		
		
		startPage = ((currentPage -1) /pageLimit) *pageLimit +1;
		
		
		
		endPage =  startPage + pageLimit -1;
		
		//startPage가 11이면 endPage는 20으로 됨 (근데 maxPage가 고작 13밖에 안되면??)
		if(endPage >maxPage) {
			endPage = maxPage;
		}
		
		//com.kh.common.model.vo.PageInfo
		//*페이징바를 만들 때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Member> list = new AdminService().selectList(pi, search);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/admin/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
