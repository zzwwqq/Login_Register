package com.ruanko;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RandomValidateCode {
	
	public static final String RANDOMCODEKEY="RANDOMCODEKEY";
	
	private Random random=new Random();
	
	private String randString ="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	private int width=80;
	private int height=26;
	
	private int lineSize=40;//干扰线数量
	private int stringNum=4;//随机产生字符串数量
	
	/**
	 * 获得字体
	 * @return
	 */
	private Font getFont(){
		return new Font("FIXEDsys", Font.CENTER_BASELINE, 18);
	}
	
	private Color getRandColor(int fc,int bc){
		if(fc>255){
			fc=255;
		}
		if(bc>255){
			bc=255;
		}
		int r=fc+random.nextInt(bc-fc-16);
		int g=fc+random.nextInt(bc-fc-14);
		int b=fc+random.nextInt(bc-fc-18);
		return new Color(r,g,b);
	}
	
	
	/**
	 * 生成随机图片
	 */
	public void getRandcode(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession  session=request.getSession();
		
		BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		Graphics g=image.getGraphics();//产生Image对象的Graphics对象，改对象可以在图片上进行各种绘制操作
		
		g.fillRect(0, 0, width, height);
		g.setFont(new Font("Times New Roman",Font.ROMAN_BASELINE,18));
		g.setColor(getRandColor(110, 133));
		
		//绘制干扰线
		for (int i = 0; i < lineSize; i++) {
			drowLine(g);
		}
		
		//绘制随机字符
		String randomString="";
		for (int i = 0; i < stringNum; i++) {
			randomString=drowString(g,randomString,i);
		}
		session.removeAttribute(RANDOMCODEKEY);//这里先移除上次的数据（重点）
		session.setAttribute(RANDOMCODEKEY, randomString);
		System.out.println(randomString);
		
		g.dispose();//清除一下
		
		try {
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//将内存中的图片通过流动形式输出到客户端
		
		
	}
	
	
	/*
     * 绘制字符串
     */
    private String drowString(Graphics g,String randomString,int i){
        g.setFont(getFont());
        g.setColor(new Color(random.nextInt(101),random.nextInt(111),random.nextInt(121)));
        String rand = String.valueOf(getRandomString(random.nextInt(randString.length())));
        randomString +=rand;
        g.translate(random.nextInt(3), random.nextInt(3));
        g.drawString(rand, 13*i, 16);
        return randomString;
    }
    /*
     * 绘制干扰线
     */
    private void drowLine(Graphics g){
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(13);
        int yl = random.nextInt(15);
        g.drawLine(x, y, x+xl, y+yl);
    }
    /*
     * 获取随机的字符
     */
    public String getRandomString(int num){
        return String.valueOf(randString.charAt(num));
    }
	
	
	

}
