package com.boidea.framework.core.web.taglib.ext;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.tplengine.DefaultTemplate;
import com.boidea.framework.core.tplengine.FileTemplate;
import com.boidea.framework.core.tplengine.TemplateEngine;
import com.boidea.framework.core.tplengine.TemplateEngineFactory;
import com.boidea.framework.core.tplengine.TemplateType;
import com.boidea.framework.core.web.taglib.util.TagHelper;
import com.boidea.framework.util.BFConstants;

/**
 * MyUx标签<br>
 * 导入Ext扩展组件的CSS、JS资源
 * @author zhaozh
 * @since 2010-01-30
 */
public class MyUxTag extends TagSupport{
	
	private static Log log = LogFactory.getLog(MyUxTag.class);
	
	private String uxType;
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		Dto dto = new BaseDto();
		dto.put("contextPath", request.getContextPath());
		dto.put("uxType", uxType.toLowerCase());
		TemplateEngine engine = TemplateEngineFactory.getTemplateEngine(TemplateType.VELOCITY);
		DefaultTemplate template = new FileTemplate();
		template.setTemplateResource(TagHelper.getTemplatePath(getClass().getName()));
		StringWriter writer = engine.mergeTemplate(template, dto);
		try {
			pageContext.getOut().write(writer.toString());
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
		uxType = null;
		super.release();
	}

	public void setUxType(String uxType) {
		this.uxType = uxType;
	}

}
