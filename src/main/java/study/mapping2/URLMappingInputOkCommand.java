package study.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URLMappingInputOkCommand implements URLInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 20 : Integer.parseInt(request.getParameter("age"));
		
		userDAO dao = new userDAO();
		userVO vo = new userVO();
		
		vo.setName(name);
		vo.setAge(age);
		
		int res = dao.setUserInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "userInputOk");
		}
		else {
			request.setAttribute("msg", "userInputNo");
		}
		request.setAttribute("url", request.getContextPath()+"/urlMappingList.um");
	}

}
