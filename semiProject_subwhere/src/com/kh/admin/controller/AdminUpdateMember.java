package com.kh.admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminUpdateMember
 */
@WebServlet("/update.ad")
public class AdminUpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("memberNo"));
		Member m = new Member();
		
		
		m.setMemberNo(num);
		m.setMemberName(request.getParameter("memberName["+num+"]"));
		m.setMemberId(request.getParameter("id["+num+"]"));
		m.setMemberPwd(request.getParameter("pwd["+num+"]"));
		m.setMemberName(request.getParameter("name["+num+"]"));
		m.setEmail(request.getParameter("email["+num+"]"));
		m.setPhone(request.getParameter("phone["+num+"]"));
		
		m.setStatus(request.getParameter("status["+num+"]"));
		m.setNickname(request.getParameter("nn["+num+"]"));
							
		
		int result = new AdminService().updateMember(m);
		 if(result > 0) {
	            
	            request.getSession().setAttribute("alertMsg", "성공적으로 수정되었습니다.");
	            response.sendRedirect(request.getContextPath()+ "/manage.ad?cpage=1"); 
	         } else {
	            // 실패
	            request.setAttribute("errorMsg", "수정에 실패했습니다.");
	            RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
	            view.forward(request, response);

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
