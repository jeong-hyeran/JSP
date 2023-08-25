package ex02;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	
	private static FileUtil instance = new FileUtil();

	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {}
	
	private String saveDirectory = null;
	private int maxPostSize = 10 * 1024 * 1024;
	private String encoding = "UTF-8";
	private FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public Ex02DTO getDTO(HttpServletRequest request) throws IOException {
		
		Ex02DTO dto  = new Ex02DTO();
		
		if(saveDirectory == null) { /// 폴더를 만들어줌
			ServletContext application = request.getServletContext();
			saveDirectory = application.getRealPath("/upload");
			File dir = new File(saveDirectory);
			dir.mkdirs();
		}
		
		
		MultipartRequest mpreRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		); /// 파일이 만들어진다.
		
		// 일반 문자열 파라미터도 mpRequest에서 가져와야한다.
		
		String title = mpreRequest.getParameter("title");
		File f = mpreRequest.getFile("profileImage");
		String filePath	 = "upload/" + f.getName();
		
		dto.setTitle(title);
		dto.setFilePath(filePath);
		// DB에 파일을 직접 저장하지 않는다. (파일의 이름 및 경로만 저장하면 된다.)
		
		return dto;
		
	}
	
	public String[] getFileNameList() {
		if(saveDirectory != null) {
			File dir = new File(saveDirectory);

			if(dir.exists()) {
				return dir.list();
			}
		}
		return null;
	}

}
