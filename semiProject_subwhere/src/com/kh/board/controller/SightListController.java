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
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class SightListController
 */
@WebServlet("/list.si")
public class SightListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SightListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//-----------------페이징 처리---------------
				//핵어려움 주의 + 원리를 파악 => 결국은 공식을 외우면 다 끝나는 문젬
				
				int listCount; //현재 총 게시글 갯수
				int currentPage; //현재 페이지(즉, 사용자가 요청한 페이지)
				int pageLimit; //현재 페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩)
				int boardLimit; //한 페이지내에 보여질 게시글 최대 개수(몇개 단위씩)
				
				//위의 4개를 가지고 아래 3개의 값을 구해낼꺼임
				int maxPage; //가장 마지막페이지 (총 페이지 수)
				int startPage; //페이징바의 시작수
				int endPage; //페이징바의 끝수
				
				//*listCount : 총 게시글 개수
				listCount = new SightService().selectListCount();
				//*currentPage : 현재 페이지 (즉, 사용자가 요청한 페이지)
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
				
				//*현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 boardLimit 수만큼 조회해가기
				
				ArrayList<Sight> list = new SightService().selectList(pi);
				
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("views/sights/sightList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
