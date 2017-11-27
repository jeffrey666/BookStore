package cn.tarena.book.pojo;

public class Book {
	private String bookId;
	private String bookName;//图书名字
	private Integer state;//图书状态,1代表被借出,0代表未借出
	private BookInfo bookInfo;
	
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public BookInfo getBookInfo() {
		return bookInfo;
	}
	public void setBookInfo(BookInfo bookInfo) {
		this.bookInfo = bookInfo;
	}
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", state=" + state + ", bookInfo=" + bookInfo
				+ "]";
	}
	
	
}
