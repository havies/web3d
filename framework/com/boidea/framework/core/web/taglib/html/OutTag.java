package com.boidea.framework.core.web.taglib.html;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * Out标签<br>
 * 输出request,session,application作用域的变量值
 * @author zhaozh
 * @since 2010-02-30
 */
public class OutTag extends TagSupport {
	
	private static Log log = LogFactory.getLog(OutTag.class);
	private String scope;
	private String key;
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		scope = BFUtils.isEmpty(scope) ? "request" : scope;
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		String valueString = "";
		if(scope.equalsIgnoreCase("request")){
			valueString = (String)request.getAttribute(key);
		}else if(scope.equalsIgnoreCase("session")){
			valueString = (String)WebUtils.getSessionAttribute(request, key);
		}else if (scope.equalsIgnoreCase("application")) {
			valueString = (String)request.getSession().getServletContext().getAttribute(key);
		}
		if(BFUtils.isEmpty(valueString)) {
			valueString = "";
		}
		try {
			pageContext.getOut().write(valueString);
		} catch (IOException e) {
			log.error(BFConstants.Exception_Head + e.getMessage());
			e.printStackTrace();
		}
		return super.SKIP_BODY;
	}
	
	/**
	 * 标签结束
	 */
	public int doEndTag() throws JspException{
		return super.EVAL_PAGE;
	}
	
	/**
	 * 释放资源
	 */
	public void release(){
		scope = null;
		key = null;
		super.release();
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
