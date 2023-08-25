package ex03;



import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil {
	
	private static FileUtil instance = new FileUtil();

	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {}
	
	
	
	private String saveDirectory = null;
	private int maxPostSize = 50 * 1024 * 1024;
	private String encoding = "UTF-8";
	private DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public Ex03DTO getDTO(HttpServletRequest request) throws IOException {
		Ex03DTO dto = null;
		
		if(saveDirectory == null) {
			ServletContext application = request.getServletContext();
			saveDirectory = application.getRealPath("upload");
			File dir = new File(saveDirectory);
			dir.mkdirs();
		}
		
		MultipartRequest mpRequest = 
				new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		String title = mpRequest.getParameter("title");
		File image = mpRequest.getFile("image");
		String filePath = image != null ? image.getName() : null;
		String contentType = mpRequest.getContentType("image");
		
		boolean flag1 = title.equals("") == false;
		boolean flag2 = image != null;
		boolean flag3 = flag2 && contentType.startsWith("image");
		
		
		if(flag1 && flag2 && flag3) {
			/// title은 꼭 이써야 하고, 첨부파일이 있어야 하고, 반드시 이미지 파일이여야 한다.
			dto = new Ex03DTO();
			dto.setTitle(title);
			dto.setFilePath("upload/" + filePath);
		}
		else if(image != null) {// 조건에 만족하지 못하면
			image.delete();		// 이미 생성된 파일을 삭제한다.
		}
			
		return dto;
	}

}
