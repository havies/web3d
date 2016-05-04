package com.boidea.framework.core.web.taglib.ext;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.SpringBeanLoader;
import com.boidea.framework.core.model.dao.Dao;
import com.boidea.framework.core.tplengine.DefaultTemplate;
import com.boidea.framework.core.tplengine.FileTemplate;
import com.boidea.framework.core.tplengine.TemplateEngine;
import com.boidea.framework.core.tplengine.TemplateEngineFactory;
import com.boidea.framework.core.tplengine.TemplateType;
import com.boidea.framework.core.web.taglib.util.TagHelper;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * 
 * UiGrant标签<br>
 * 实现UI元素授权
 * 
 * @author zhaozh
 * @since 2011-09-30
 */
public class UiGrantTag extends TagSupport{
	
	private static Log log = LogFactory.getLog(UiGrantTag.class);
	
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		Dao bfDao = (Dao) SpringBeanLoader.getSpringBean("bfDao");
		Dto qDto = new BaseDto();
		UserInfoVo userInfoVo = WebUtils.getSessionContainer(request).getUserInfo();
		qDto.put("userid", userInfoVo.getUserid());
		qDto.put("menuid", request.getParameter("menuid4Log"));
		List roleGrantList = bfDao.queryForList("ArmTagSupport.getUiRoleGrantInfo", qDto);
		List userGrantList = bfDao.queryForList("ArmTagSupport.getUiUserGrantInfo", qDto);
		List grantList = new ArrayList();
		if (BFUtils.isNotEmpty(roleGrantList)) {
			grantList.addAll(roleGrantList);
		}
		if (BFUtils.isNotEmpty(userGrantList)) {
			grantList.addAll(userGrantList);
		}
		Dto dto = new BaseDto();
		dto.put("grantList", grantList);
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
		super.release();
	}
}
