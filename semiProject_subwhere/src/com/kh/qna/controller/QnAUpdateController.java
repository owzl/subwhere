package com.kh.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.qna.model.service.QnAService;
import com.kh.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAUpdateController
 */
@WebServlet("/faqUpdate.qa")
public class QnAUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		       // 포스트 방식
				request.setCharacterEncoding("utf-8");
				
				
				int qno = Integer.parseInt(request.getParameter("qno"));
				String question = request.getParameter("fqaTitle");
				String answer = request.getParameter("faqContent");
						
				// 여기도 모두 다 잘 넘어옴...뭐가 문제지..?
				
				int result = new QnAService().updateQnA(qno,question, answer);
				
				HttpSession session = request.getSession();
				
				if(result>0) {
				  	
					session.setAttribute("alertMsg", "자주 묻는 질문 수정을 성공했습니다.");
					
				  	response.sendRedirect(request.getContextPath() + "/detailsemi.qa?ujQno=" +qno);
				  	
				  	
				  	
				}else {
					session.setAttribute("alertMsg", "자주 묻는 질문 수정을 실패했습니다.");
					response.sendRedirect(request.getContextPath() + "/detailsemi.qa?ujQno=" +qno );
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
