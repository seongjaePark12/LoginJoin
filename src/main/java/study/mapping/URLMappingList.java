package study.mapping;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.mapping2.userDAO;
import study.mapping2.userVO;

@WebServlet("/URLMappingList")
public class URLMappingList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userDAO dao = new userDAO();
		
		List<userVO> vos = dao.getUserList();
		
		request.setAttribute("vos", vos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study/mapping/urlMappingList.jsp");
		dispatcher.forward(request, response);
	}

}
