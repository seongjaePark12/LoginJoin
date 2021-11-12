package study.mapping2;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URLMappingListCommand implements URLInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userDAO dao = new userDAO();
		
		List<userVO> vos = dao.getUserList();
		
		request.setAttribute("vos", vos);
	}

}
