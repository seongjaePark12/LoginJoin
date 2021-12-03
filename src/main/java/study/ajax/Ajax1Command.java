package study.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.StudyInterface;
import study.mapping2.userDAO;
import study.mapping2.userVO;

public class Ajax1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userDAO dao = new userDAO();
		List<userVO> vos = dao.getUserList();
		
		request.setAttribute("vos", vos);
		
	}

}
