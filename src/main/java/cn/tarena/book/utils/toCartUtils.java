package cn.tarena.book.utils;

import javax.servlet.http.HttpSession;

public class toCartUtils {
	
	
	public static int[] cart(HttpSession session,int line,String method){
		//当前页数
		int num;
		if(method.equals("last")){
			//上一页
			num = (int) session.getAttribute("num")-1;
		}else{
			//下一页
			num = (int) session.getAttribute("num")+1;
		}
		//获取图书总行数/4为+1为可以显示的页数
		int number = line / 4 + 1;
		//点击下一页小于1,原页面保持不变
		if (num < 1) {
			num+=1;
		}
		//下一页大于总页数,原页面保持不变
		if(num > number){
			num=num-1;
		}
		//获取limit对应的X,Y
		int[] column = getColumn(line,num,method);
		//将页数保存至session域
		session.setAttribute("num", num);
		//返回对应的X,Y
		return column;
		
	}
	public static int[] getColumn(int line, int i,String method) {
		int[] pages = new int[2];
		//判断是last还是next
		if(method=="last"){
			//获取上一页的开始行
			pages[0] = (i - 1) * 4;
			//如何下一页开始行小于0则查询从头开始
			if(pages[0]<0){
				pages[0]=0;
			}
			//获取上一页可以执行的行
			if (line - i * 4 + 4 >= 0) {
				pages[1] = 4;
			}else{
				pages[1] = line - pages[0];
			}
		}else{
			//获取下一页的开始行
			pages[0] = (i-1) * 4;
			//获取下一页可以执行的行
			if (line - ((i-1) * 4 + 4) > 0) {
				pages[1] = 4;
			} else {
				pages[1] = line + pages[0];
			}
		}
		//返回对应的X,Y
		return pages;
	}
	
}
