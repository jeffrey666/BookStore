package cn.tarena.book.utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;

public class PageBean<T> {
	// 当前页
	private Integer currentPage = 1;
	// 每页显示的总条数
	private Integer pageSize = 5;
	// 总条数
	private Integer totalNum;
	// 是否有下一页
	private Integer isMore;
	// 总页数
	private Integer totalPage;
	// 开始索引
	private Integer startIndex;
	// 分页结果
	private List<T> items;

	public PageBean() {
		super();
	}

	public PageBean(Integer currentPage, Integer pageSize, Integer totalNum) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalNum = totalNum;
		this.totalPage = (this.totalNum + this.pageSize - 1) / this.pageSize;
		this.startIndex = (this.currentPage - 1) * this.pageSize;
		this.isMore = this.currentPage >= this.totalPage ? 0 : 1;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		if(currentPage==null||currentPage<=0){
			this.currentPage=1;
		}else{
			this.currentPage = currentPage;
		}
	}

	public Integer getPageSize() {
		
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		if(pageSize==null||pageSize<=0){
			this.pageSize=5;
		}
		this.pageSize = pageSize;
	}

	public Integer getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(Integer totalNum) {
		this.totalNum = totalNum;
	}

	public Integer getIsMore() {
		return isMore;
	}

	public void setIsMore(Integer isMore) {
		this.isMore = isMore;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public List<T> getItems() {
		return items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "PageBean [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalNum=" + totalNum
				+ ", isMore=" + isMore + ", totalPage=" + totalPage + ", startIndex=" + startIndex + ", items=" + items
				+ "]";
	}

	public void download(ByteArrayOutputStream os, HttpServletResponse response, String path) throws IOException {
		response.setHeader("Content-Disposition","attachment;filename="+path);
		response.setContentType("text/html;charset=gbk");
		response.getOutputStream().write(os.toByteArray());
		
	}
}
