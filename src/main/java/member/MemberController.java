package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/memLogin")) {
			viewPage = "/WEB-INF/member/memLogin.jsp";
		}
		else if(com.equals("/memJoin")) {
			viewPage = "/WEB-INF/member/memJoin.jsp";
		}
		else if(com.equals("/idCheck")) {
			command = new IdCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/member/idCheck.jsp";
		}
		else if(com.equals("/nickCheck")) {
			command = new NickCheckCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/member/nickCheck.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
