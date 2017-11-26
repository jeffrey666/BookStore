package cn.tarena.book.pojo;

import java.util.Date;

public class BookInfo {
	private String bookInfoId;
	private String author;//图书作者
	private Date updateTime;//图书上传日期
	private Date borrowDate;//图书借出日期
	private Date returnDate;//图书归还日期
	private String searchVolume;//图书搜索次数
	private String borrowCount;//图书借阅次数
	private	String bookPub;//图书出版社
	private String pubDate;//图书出版日期
	private String category;//图书分类

	private String imgurl;//图书存放地址
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getBookInfoId() {
		return bookInfoId;
	}
	public void setBookInfoId(String bookInfoId) {
		this.bookInfoId = bookInfoId;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getBorrowDate() {
		return borrowDate;
	}
	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public String getSearchVolume() {
		return searchVolume;
	}
	public void setSearchVolume(String searchVolume) {
		this.searchVolume = searchVolume;
	}
	public String getBorrowCount() {
		return borrowCount;
	}
	public void setBorrowCount(String borrowCount) {
		this.borrowCount = borrowCount;
	}
	public String getBookPub() {
		return bookPub;
	}
	public void setBookPub(String bookPub) {
		this.bookPub = bookPub;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "BookInfo [bookInfoId=" + bookInfoId + ", author=" + author + ", updateTime=" + updateTime
				+ ", borrowDate=" + borrowDate + ", returnDate=" + returnDate + ", searchVolume=" + searchVolume
				+ ", borrowCount=" + borrowCount + ", bookPub=" + bookPub + ", pubDate=" + pubDate + ", category="
				+ category + ", imgurl=" + imgurl + "]";
	}

	
	
	

}
