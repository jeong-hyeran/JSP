package test2;

import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) throws Exception{
		
		Socket so = new Socket("localhost",8080);
		PrintWriter out = new PrintWriter(so.getOutputStream());
		Scanner in = new Scanner(so.getInputStream(), "UTF-8");
		Scanner sc = new Scanner(System.in);
		
//		String message = "";
//		message += "GET/test/index.jsp HTTP/1.1\r\n";
//		message += "HOST: 192.168.112.7:8080\r\n";
		
		//요청
//		GET /test/index.jsp HTTP/1.1
	//메서드.. 뭐..뭐...뭐...500 서버 오류 400클라이언트 오류라구!?
//		HOST: 192.168.112.7:8080 
		//host내용과 get내용을 붙여서 브라우저에 넣으면 실행된다.
		
		String input = null;
		System.out.println("=== request===\n");
		while("".equals(input) == false) {
			input = sc.nextLine();
			out.write(input + "\r\n");
		}
		out.flush();
		System.out.println("=======================\n");
		System.out.println();
		
		
		System.out.println("===response===\n");
		while(in.hasNextLine()) {
			System.out.println(in.nextLine());
		}
		System.out.println("========================\n");
		System.out.println();
		
		out.close();
		sc.close();
		in.close();
		so.close();
		
		
	}

}
