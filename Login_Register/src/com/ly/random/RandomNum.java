package com.ly.random;

/**
 * 产生随机数
 * @author asus
 *
 */
public class RandomNum {
	private String random=(int)((Math.random()*9+1)*100000)+"";
	public static String num;
	public String getRandom(){
		return random;
	}
}
