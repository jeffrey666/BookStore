package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BookInfoMapper;

import cn.tarena.book.pojo.BookInfo;

@Service
public class BookInfoServiceImpl  implements BookInfoService{

	@Autowired
	private BookInfoMapper bookInfoMapper;
	@Override

	public void saveBookUpload(BookInfo bookInfo) {
		bookInfoMapper.saveBookUpload(bookInfo);
  }
}