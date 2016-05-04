package com.boidea.framework.core.web;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.PropertyConfigurator;

import com.boidea.framework.util.BFUtils;

/**
 * LobfJ初始化
 * 
 * @author zhaozh
 * @since 2011-04-26
 */
public class Log4jInitServlet extends HttpServlet {

	/**
	 * Servlet初始化
	 */
	public void init(ServletConfig config) throws ServletException {
		String root = config.getServletContext().getRealPath("/");
		String log4jLocation = BFUtils.getFullPathRelateClass("../../../../../log4j.properties", getClass());
		System.setProperty("webRoot", root);
		if (BFUtils.isNotEmpty(log4jLocation)) {
			PropertyConfigurator.configure(log4jLocation);
		}
	}
}
