package cn.tarena.book.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;

import org.springframework.stereotype.Component;

public class VerifyCode {
	private static int width = 100;
	private static int height = 22;
	//字符个数
	private static int len = 4;
	private String code = "";
	//验证码随机
	private static String str = "23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
	//设置字体格式
	private static String[] fontNames = {"宋体", "华文楷体", "黑体", "微软雅黑",  "楷体_GB2312" };
	public static int getRandom(int start,int end ){
		Random rand = new Random();
		return rand.nextInt(end-start)+start;		
	}
	public  void getDraw(OutputStream out){
		//1.创建图片缓冲区对象，并设置宽高和图片类型
		BufferedImage bi = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		//2.得到画笔
		Graphics2D p = (Graphics2D) bi.getGraphics();
		//3.画图
		  //设置背景颜色
		  p.setColor(new Color(134,221,219));
		  p.fillRect(0, 0, width, height);		 		  
		  //写一个字符串
		  for(int i=0;i<len;i++){
		    String st = str.charAt(getRandom(0,str.length()))+"";
		    code = code + st;
		    //旋转图片
		    int theta = getRandom(-45,45);
		    p.rotate(theta*Math.PI/180, i*20+8, height-3);
		    //设置字体颜色
			p.setColor(new Color(getRandom(0,150),getRandom(0,150),getRandom(0,150)));
			//设置字体样式和大小
			p.setFont(new Font(fontNames[getRandom(0,fontNames.length)], Font.BOLD, 16));
		    p.drawString(st, i*20+8, height-8);
		    //图片旋转回来
		    p.rotate(-theta*Math.PI/180,i*20+8, height-3);
		  }
		  //画干扰线
		  for(int i=0;i<len+2;i++){
			  p.setColor(new Color(getRandom(0,150),getRandom(0,150),getRandom(0,150)));
			  p.drawLine(getRandom(0,120),getRandom(0,30),getRandom(0,120), getRandom(0,30));
		  }
		//4.保存图片到指定的位置
		try {
			ImageIO.write(bi, "JPEG", out);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//5.释放资源
		p.dispose();
	}
	public String  getCode(){
		return code;
	}
	
}
