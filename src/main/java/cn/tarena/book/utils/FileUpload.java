package cn.tarena.book.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.UUID;

public class FileUpload {
	
	public static void main(String[] args) {
		filePhoto();
	}
	public static String filePhoto(){
		String hc = Integer.toHexString(UUID.randomUUID().hashCode());
		// 为了保证一定能够产生一个八级深的目录结构
		int i = 8 - hc.length();
		for (int j = 0; j < i; j++) {
			hc = "0" + hc;
		}
		// 切块存放的总文件
		String path ="";
		// 产生一个八级深的目录
		for (char c : hc.toCharArray()) {
			path = path + "\\" + c;
		}
		//生成目录
		File dir =new  File(path);
		dir.mkdirs();
		
		return path;
	}

	/*public static void uploadFile(byte[] file, String filePath, String fileName) throws Exception {
		File targetFile = new File(filePath); 
	    if(!targetFile.exists()){  
	      targetFile.mkdirs();  
	    }    
	    FileOutputStream out = new FileOutputStream(filePath+fileName);
	    out.write(file);
	    out.flush();
	    out.close();
		
	}*/

}
