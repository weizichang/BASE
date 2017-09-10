//package fsit03_HitoBasebal;
//
//import java.io.File;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.util.ArrayList;
//import java.util.Enumeration;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.LinkedList;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.sound.sampled.LineListener;
//
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//import com.oreilly.servlet.MultipartRequest;
//
//@WebServlet("/AddPlayer")
//public class AddPlayer extends HttpServlet {
//	
//	private HttpServletRequest request;
//	private List<FileItem> items;
//	private LinkedList<PlayerModel> players;
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request, response);
//	}
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
//		request = req;
//		//System.out.println("hello");
//		players = doDo();
//		HashMap<String, String> player = players.get(0);
//		System.out.println(player.get("pos"));
//	}
//	
//	private LinkedList<PlayerModel> doDo() {
//		// Create a factory for disk-based file items
//		DiskFileItemFactory factory = new DiskFileItemFactory();
//
//		// Configure a repository (to ensure a secure temp location is used)
//		ServletContext servletContext = this.getServletConfig().getServletContext();
//		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
//		factory.setRepository(repository);
//
//		// Create a new file upload handler
//		ServletFileUpload upload = new ServletFileUpload(factory);
//
//		// Parse the request
//		try {
//			items = upload.parseRequest(request);
//		} catch (FileUploadException e) {
//			e.printStackTrace();
//		}
//		
//		// Process the uploaded items
//		Iterator<FileItem> iter = items.iterator();
//		int dataCount = 1;
//		
//		
//		LinkedList<PlayerModel> players = new LinkedList<>();
//		LinkedList<String> tmp = new LinkedList<>();
//		
//		while (iter.hasNext()) {
//		    FileItem item = iter.next();
//		    String fileName = item.getName();
//		    String value =item.getString();
//		    String key = item.getFieldName();
//		    System.out.println("n:"+dataCount+" fileName:"+fileName+" value:"+value+" key:" + key);
//		    
//		    tmp.add(value);
//		    if (value.equals("end")) {
//		    	LinkedList<String> player = new LinkedList<>();
//		    	for(int i = 0; i < tmp.size(); i ++) {
//		    		player.add(tmp.get(i));
//		    	}
//
//		    	tmp = new LinkedList<>();
//		    	players.add(player);
//		    	dataCount++;
//		    }
//		}
//		LinkedList<PlayerModel> ps = new LinkedList<>();
//		for(int i = 0; i < players.size(); i++) {
//			LinkedList<String> tmpPlayer = players.get(i);
//			HashMap<String, String> player = new HashMap<>();
//			for(int j = 0; j < tmpPlayer.size() - 1; j++) {
//				switch(j) {
//					case 0:
//						break;
//					case 1:
//						player.put("name", tmpPlayer.get(j));
//						break;
//					case 2:
//						player.put("number", tmpPlayer.get(j));
//						break;
//					case 3:
//						player.put("height", tmpPlayer.get(j));
//						break;
//					case 4:
//						player.put("weight", tmpPlayer.get(j));
//						break;
//					case 5:
//						player.put("birthday", tmpPlayer.get(j));
//						break;
//					case 6:
//						player.put("batting", tmpPlayer.get(j));
//						break;
//					case 7:
//						player.put("throw", tmpPlayer.get(j));
//						break;
//					case 8:
//						player.put("pos", tmpPlayer.get(j));
//						break;
//					default:
//						StringBuilder sb = new StringBuilder();
//						sb.append(player.get("pos")+"/"+tmpPlayer.get(j));
//						player.put("pos", sb.toString());
//				}
//				
//			}
//			ps.add(player);
//		}
//		
//		return ps;
//	}
//
//}
//
//
