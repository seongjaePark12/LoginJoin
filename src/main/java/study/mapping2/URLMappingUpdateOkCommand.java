package study.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URLMappingUpdateOkCommand implements URLInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 20 : Integer.parseInt(request.getParameter("age"));
		int idx = Integer.parseInt(request.getParameter("idx"));
	
		userDAO dao = new userDAO();
		userVO vo = new userVO();
		
		vo.setName(name);
		vo.setAge(age);
		vo.setIdx(idx);
		
		int res = dao.setUserUpdateOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "userUpdateOk");
		}
		else {
			request.setAttribute("msg", "userUpdateNo");
		}
		request.setAttribute("url", request.getContextPath()+"/urlMappingList.um");
	}

}
