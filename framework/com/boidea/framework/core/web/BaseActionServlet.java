package com.boidea.framework.core.web;

import javax.servlet.ServletException;

import com.boidea.framework.core.mvc.xstruts.action.ActionServlet;

/**
 * ActionServlet基类
 * @author zhaozh
 * @since 2009-09-03
 * @see ActionServlet
 */
public class BaseActionServlet extends ActionServlet{
	public BaseActionServlet(){}
	
	/**
     * @param 
     * @return void
	 */
	public void init() throws ServletException{
		super.init();
	}
}
