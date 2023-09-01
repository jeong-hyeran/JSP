package board2;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUtil {
	
	private static FileUtil instance = new FileUtil();

	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {}
	
	private String saveDirectory = "C:\\upload2";
	private int maxPostSize = 10* 1024 * 1024;
	private String encoding = "UTF-8";
	private DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public BoardDTO getDTO(HttpServletRequest request) throws IOException {
		BoardDTO dto = new BoardDTO();
		
		File dir = new File(saveDirectory);
			if(dir.exists() == false) {
				dir.mkdir();
			}
			
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
				);
		
		String title = mpRequest.getParameter("title");
		String writer = mpRequest.getParameter("writer");
		String content = mpRequest.getParameter("content");
		File image = mpRequest.getFile("image");
		String uploadFile = image != null ? image.getName() : null;
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setUploadFile(uploadFile);
		
		return dto;
	}
}
