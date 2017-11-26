package cn.tarena.book.service;



import java.util.List;

import cn.tarena.book.pojo.BookInfo;
import cn.tarena.book.pojo.UserInfo;

public interface BookInfoService {

	public void saveBookUpload(BookInfo bookInfo);
	
	public List<UserInfo> tocart(String userId);

}
