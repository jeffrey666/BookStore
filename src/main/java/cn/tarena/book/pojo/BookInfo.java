package cn.tarena.book.pojo;

import java.util.Date;

public class BookInfo {
	private String bookInfoId;
	private String author;//图书作者
	private Date createTime;//图书出版日期
	private Date borrowDate;//图书借出日期
	private Date returnDate;//图书归还日期
	private String style;//图书分类
	private String bookPub;//图书出版社
	private String pub_date;//出版日期
	
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getBookPub() {
		return bookPub;
	}


	public void setBookPub(String bookPub) {
		this.bookPub = bookPub;
	}

	public String getPub_date() {
		return pub_date;
	}

	public void setPub_date(String pub_date) {
		this.pub_date = pub_date;
	}

	@Override
	public String toString() {
		return "BookInfo [bookInfoId=" + bookInfoId + ", author=" + author + ", createTime=" + createTime
				+ ", borrowDate=" + borrowDate + ", returnDate=" + returnDate + ", style=" + style + ", bookPub="
				+ bookPub + ", pub_date=" + pub_date + "]";
	}
	
	
}
