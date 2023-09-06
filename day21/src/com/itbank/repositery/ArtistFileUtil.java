package com.itbank.repositery;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import com.itbank.model.ArtistDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ArtistFileUtil {
	private static ArtistFileUtil instance = new ArtistFileUtil();

	public static ArtistFileUtil getInstance() {
		return instance;
	}
	
	private ArtistFileUtil() {
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	private String saveDirectory = "C:\\artist_img";
	private int maxPostSize = 20 * 1024 * 1024;
	private String encoding = "UTF-8";
	private DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	public ArtistDTO getArtistDTO(HttpServletRequest request) throws IOException {
		ArtistDTO dto = null;
		long ln =0; 
		
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		String id = mpRequest.getParameter("id");
		String name = mpRequest.getParameter("name");
		String company = mpRequest.getParameter("company");
		String country = mpRequest.getParameter("country");
		String member = mpRequest.getParameter("member");
		String debut = mpRequest.getParameter("debut");
		String type = mpRequest.getParameter("type");
		File profileimg = mpRequest.getFile("profileimg");
		
		System.out.println(name);
		System.out.println(company);
		System.out.println(country);
		System.out.println(member);
		System.out.println(debut);
		System.out.println(type);
		System.out.println(profileimg);
		
		try {
			ln = sdf.parse(debut).getTime();
		} catch (ParseException e) {}

		dto = new ArtistDTO();
		if(id != null) {
			dto.setId(Integer.parseInt(id));
		}
		dto.setCompany(company);
		dto.setCountry(country);
		dto.setDebut(new Date(ln));
		dto.setMember(member);
		dto.setName(name);
		if(profileimg != null) {
			dto.setProfileimg(profileimg.getName());
		}
		dto.setType(type);
		
		return dto;
	}
	

}
