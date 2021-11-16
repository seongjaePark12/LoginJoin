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
			command = new MemLoginCommand();  // 로그인시 저장된 아이디가 있는지를 쿠키로 처리하기위해 커맨드객체생성처리
			command.execute(request, response);
			viewPage = "/WEB-INF/member/memLogin.jsp";
		}
		else if(com.equals("/memLoginOk")) {
			command = new MemLoginOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if(com.equals("/memLogOut")) {
			command = new MemLogOutCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if(com.equals("/memJoin")) {
			viewPage = "/WEB-INF/member/memJoin.jsp";
		}
		else if(com.equals("/memJoinOk")) {
			command = new MemJoinOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
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
		else if(com.equals("/memMain")) {
			command = new MemMainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/member/memMain.jsp";
		}
		else if(com.equals("/memUpdate")) {
//			command = new MemUpdateCommand();
//			command.execute(request, response);
			viewPage = "/WEB-INF/member/memUpdate.jsp";
		}
		else if(com.equals("/memUpdateOk")) {
			command = new MemUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
