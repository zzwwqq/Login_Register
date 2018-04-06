package com.ly.random;

/**
 * 测试类:验证是否成功产生验证码
 *
 */
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RandomNum od=new RandomNum();
		String num=od.getRandom();
		System.out.println(num);
	}

}
