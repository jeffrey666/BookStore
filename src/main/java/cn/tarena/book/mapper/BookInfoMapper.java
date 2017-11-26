package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.tarena.book.pojo.BookInfo;
import cn.tarena.book.pojo.UserInfo;

public interface BookInfoMapper {

	void saveBookUpload(BookInfo bookInfo);
	
	@Select("SELECT b.book_info_id,b.author,b.category,b.imgurl,b.pub_date FROM book_info b,user_book_borrower u WHERE u.user_id=#{userId} AND u.book_id=b.book_info_id;")
	List<UserInfo> tocart(String userId);

}