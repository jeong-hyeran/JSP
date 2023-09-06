package com.itbank.repositery;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import com.itbank.model.AlbumDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AlbumFileUtil {
	private static AlbumFileUtil instance = new AlbumFileUtil();

	public static AlbumFileUtil getInstance() {
		return instance;
	}
	
	private AlbumFileUtil() {
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	private String saveDirectory = "C:\\album_img";
	private int maxPostSize = 20 * 1024 * 1024;
	private String encoding = "UTF-8";
	private DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	
	public AlbumDTO getAlbumDTO(HttpServletRequest request) throws IOException {
		AlbumDTO dto = null;
		long ln =0; 
		
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy
		);
		
		String id = mpRequest.getParameter("id");
		String artist_id = mpRequest.getParameter("artist_id");
		String name = mpRequest.getParameter("name");
		String rdate = mpRequest.getParameter("rdate");
		String type = mpRequest.getParameter("type");
		String playtime = mpRequest.getParameter("playtime");
		File coverimg = mpRequest.getFile("coverimg");
		
		System.out.println(id);
		System.out.println(artist_id);
		System.out.println(name);
		System.out.println(rdate);
		System.out.println(type);
		System.out.println(playtime);
		System.out.println(coverimg);
		
		try {
			ln = sdf.parse(rdate).getTime();
		} catch (ParseException e) {}

		dto = new AlbumDTO();
		if(id != null) {
			dto.setId(Integer.parseInt(id));
		}
		dto.setArtist_id(artist_id);
		dto.setRdate(new Date(ln));
		dto.setName(name);
		dto.setType(type);
		if(coverimg != null) {
			dto.setCoverimg(coverimg.getName());
		}
		if(playtime != null) {
			dto.setPlaytime(Integer.parseInt(playtime));
		}
		
		return dto;
	}
	

}
