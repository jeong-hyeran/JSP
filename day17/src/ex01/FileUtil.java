package ex01;

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
		
		private FileUtil(){}
		
		// 프로젝트 내부 폴더가 아니라 특정위치에 파일을 업로드 하도록 지정한ㄷ.
		
		private String savaDirectory = "C:\\upload";
		private int maxPostSize = 10* 1024 *1024;
		private String encoding = "UTF-8";
		private DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		public String getFileName(HttpServletRequest request) throws IOException {
			String fileName = null;
			
			File dir = new File(savaDirectory);
			if(dir.exists() == false) {
				dir.mkdir();
			}
			
			MultipartRequest mpRequest = new MultipartRequest(
					request, savaDirectory, maxPostSize, encoding, policy
			);
			
			File f = mpRequest.getFile("uploadFile");
			fileName = f.getName(); // 업로드된 파일의 이름
//			fileName =  f.getAbsolutePath();	// 업로드된 파일의 절대 경로
			
			System.out.println(f.getName());
			System.out.println(f.getAbsolutePath());
			
			return fileName;
		}
	
}
