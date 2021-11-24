package study.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.mapping2.userDAO;
import study.mapping2.userVO;

@WebServlet("/userUpdate")
public class UserUpdate extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		userDAO dao = new userDAO();
		
		userVO vo = dao.getSearch(idx);
		
		request.setAttribute("vo", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study/ajax/userUpdate.jsp");
		dispatcher.forward(request, response);
	}
}
