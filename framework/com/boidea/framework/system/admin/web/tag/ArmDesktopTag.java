package com.boidea.framework.system.admin.web.tag;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.SpringBeanLoader;
import com.boidea.framework.core.properties.PropertiesFactory;
import com.boidea.framework.core.properties.PropertiesFile;
import com.boidea.framework.core.properties.PropertiesHelper;
import com.boidea.framework.core.tplengine.DefaultTemplate;
import com.boidea.framework.core.tplengine.FileTemplate;
import com.boidea.framework.core.tplengine.TemplateEngine;
import com.boidea.framework.core.tplengine.TemplateEngineFactory;
import com.boidea.framework.core.tplengine.TemplateType;
import com.boidea.framework.core.web.taglib.html.HtmlTag;
import com.boidea.framework.core.web.taglib.util.TagConstant;
import com.boidea.framework.core.web.taglib.util.TagHelper;
import com.boidea.framework.system.admin.service.TagSupportService;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * Desktop桌面布局标签:BoideaFramework_ARM专用
 * 
 * @author zhaozh
 * @since 2012-12-22
 */
public class ArmDesktopTag extends TagSupport{
	
	private TagSupportService armTagSupportService = (TagSupportService)SpringBeanLoader.getSpringBean("armTagSupportService");
	
	private static Log log = LogFactory.getLog(HtmlTag.class);
	
	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException{
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		UserInfoVo userInfo = WebUtils.getSessionContainer(request).getUserInfo();
		String contextPath = request.getContextPath();
		request.setAttribute("webContext", contextPath);
		Dto dto = new BaseDto();
		PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.BF);
		dto.put("title", WebUtils.getParamValue("SYS_TITLE", request));
		dto.put("contextPath", contextPath);
		String titleIcon = WebUtils.getParamValue("TITLE_ICON", request);
		dto.put("titleIcon", BFUtils.isEmpty(titleIcon) ? "BoideaFramework.ico" : titleIcon);
		Dto themeDto = new BaseDto();
		Dto resultDto = new BaseDto();
		if(BFUtils.isNotEmpty(userInfo)){
			themeDto.put("userid", userInfo.getUserid());
			resultDto = armTagSupportService.getEauserSubInfo(themeDto);
		}
		String theme = null;
		if(BFUtils.isNotEmpty(resultDto))
			theme = resultDto.getAsString("theme");
		String defaultTheme = WebUtils.getParamValue("SYS_DEFAULT_THEME", request);
		theme = BFUtils.isEmpty(theme) ? defaultTheme : theme;
		dto.put("theme", theme);
		String layout = null;
		if(BFUtils.isNotEmpty(resultDto))
			layout = resultDto.getAsString("layout");
		String defaultLayout = WebUtils.getParamValue("APP_LAYOUT", request);
		layout = BFUtils.isEmpty(layout) ? defaultLayout : layout;
		dto.put("layout", layout);
		String background = null;
		if(BFUtils.isNotEmpty(resultDto))
			background = resultDto.getAsString("background");
		String defaultBackfround = WebUtils.getParamValue("DESKTOP_BACKGROUND", request);
		background = BFUtils.isEmpty(background) ? defaultBackfround : background;
		dto.put("background", background);
		PropertiesHelper p = PropertiesFactory.getPropertiesHelper(PropertiesFile.BF);
		dto.put("extMode", p.getValue("extMode", TagConstant.Ext_Mode_Run));
		dto.put("runMode", p.getValue("runMode", TagConstant.RUN_MODE_NORMAL));
		dto.put("ajaxErrCode", BFConstants.Ajax_Timeout);
		String micolor = pHelper.getValue("micolor", "blue");
		dto.put("username", WebUtils.getSessionContainer(request).getUserInfo().getUsername());
		dto.put("account", WebUtils.getSessionContainer(request).getUserInfo().getAccount());
		dto.put("rolespec", WebUtils.getSessionContainer(request).getUserInfo().getRolespec());
		dto.put("rolespecName", WebUtils.getSessionContainer(request).getUserInfo().getRolespecName());
		dto.put("manyRolespec", WebUtils.getSessionContainer(request).getUserInfo().getManyRolespec());
		Dto qDto = new BaseDto();
		qDto.put("deptid", WebUtils.getSessionContainer(request).getUserInfo().getDeptid());
		dto.put("deptname", armTagSupportService.getDepartmentInfo(qDto).getAsString("deptname"));
		dto.put("userInfo", userInfo);
		List menuList = getMenuList(WebUtils.getSessionContainer(request).getUserInfo().getRolespec());
		dto.put("menuList", menuList);
		dto.put("paramList", WebUtils.getParamList(request));
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
	 * 获取权限内的功能菜单
	 * 
	 * @return
	 */
	private List getMenuList(String rolespec){
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		String account = WebUtils.getSessionContainer(request).getUserInfo().getAccount();
		account = account == null ? "" : account;
		String accountType = SystemConstants.ACCOUNTTYPE_NORMAL;
		if (account.equalsIgnoreCase(WebUtils.getParamValue("DEFAULT_ADMIN_ACCOUNT", request))) {
			accountType = SystemConstants.ACCOUNTTYPE_SUPER;
		} else if (account.equalsIgnoreCase(WebUtils.getParamValue("DEFAULT_DEVELOP_ACCOUNT", request))) {
			accountType = SystemConstants.ACCOUNTTYPE_DEVELOPER;
		}
		Dto qDto = new BaseDto();
		qDto.put("accountType", accountType);
		qDto.put("rolespec", rolespec);
		qDto.put("userid", WebUtils.getSessionContainer(request).getUserInfo().getUserid());
		List menuList = armTagSupportService.getMenuList4Desktop(qDto).getDefaultAList();
		return menuList;
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
