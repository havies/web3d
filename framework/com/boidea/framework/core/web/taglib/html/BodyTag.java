package com.boidea.framework.core.web.taglib.html;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.tplengine.DefaultTemplate;
import com.boidea.framework.core.tplengine.StringTemplate;
import com.boidea.framework.core.tplengine.TemplateEngine;
import com.boidea.framework.core.tplengine.TemplateEngineFactory;
import com.boidea.framework.core.tplengine.TemplateType;
import com.boidea.framework.core.web.taglib.util.TagHelper;
import com.boidea.framework.util.BFConstants;

/**
 * Body标签
 * @author zhaozh
 * @since 2010-01-30
 */
public class BodyTag extends TagSupport{
	
	private static Log log = LogFactory.getLog(BodyTag.class);
	private String onload;
	private String any;
	private String cls;
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		Dto dto = new BaseDto();
		dto.put("onload", TagHelper.checkEmpty(onload));
		dto.put("any", TagHelper.checkEmpty(any));
		dto.put("cls", TagHelper.checkEmpty(cls));
		String tpl = "<body #if(${cls}!=*off*)class=*${cls}*#end #if(${onload}!=*off*)onload=*${onload}*#end #if(${any}!=*off*)${any}#end>";
		TemplateEngine engine = TemplateEngineFactory.getTemplateEngine(TemplateType.VELOCITY);
		DefaultTemplate template = new StringTemplate(TagHelper.replaceStringTemplate(tpl));
		StringWriter writer = engine.mergeTemplate(template, dto);
		try {
			pageContext.getOut().write(writer.toString());
		} catch (IOException e) {
			log.error(BFConstants.Exception_Head + e.getMessage());
			e.printStackTrace();
		}
		return super.EVAL_BODY_INCLUDE;
	}
	
	/**
	 * 标签结束
	 * @param onload
	 */
	public int doEndTag() throws JspException{
		try {
			pageContext.getOut().write("</body>");
		} catch (IOException e) {
			log.error(BFConstants.Exception_Head + e.getMessage());
			e.printStackTrace();
		}
		return super.EVAL_PAGE;
	}
	
	/**
	 * 释放资源
	 */
	public void release(){
		any = null;
		cls = null;
		onload = null;
		super.release();
	}
	
	public void setOnload(String onload) {
		this.onload = onload;
	}
	public void setAny(String any) {
		this.any = any;
	}

	public void setCls(String cls) {
		this.cls = cls;
	} 

}
