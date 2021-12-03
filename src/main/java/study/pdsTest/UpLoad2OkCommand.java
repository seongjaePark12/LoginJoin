package study.pdsTest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study.StudyInterface;

public class UpLoad2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName="";
		String fileSystemName= null;
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();
			originalFileName = multipartRequest.getOriginalFileName(file);
			fileSystemName = multipartRequest.getFilesystemName(file);
			
		}
		
		if(fileSystemName != null) {
			request.setAttribute("msg", "upLoad1Ok");
		}
		else {
			request.setAttribute("msg", "upLoad1No");
		}
		request.setAttribute("url", request.getContextPath()+"/pdsTest2.st");
	}

}
