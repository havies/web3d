package com.boidea.framework.system.admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.SpringBeanLoader;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.CommonActionForm;
import com.boidea.framework.system.admin.service.OrganizationService;
import com.boidea.framework.system.admin.service.UserService;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;

/**
 * 首页Action
 * 
 * @author zhaozh
 * @since 2010-01-13
 * @see BizAction
 */
public class IndexAction extends BizAction {
	
	private OrganizationService organizationService = (OrganizationService)SpringBeanLoader.getSpringBean("organizationService");

	/**
	 * 首页初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward indexInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("sysTitle", getParamValue("SYS_TITLE", request));
		request.setAttribute("westTitle", getParamValue("WEST_NAVIGATE_TITLE", request));
		String viewString = "indexView";
		String appLayout = getParamValue("APP_LAYOUT", request);
		if (appLayout.equals(BFConstants.APP_LAYOUT_DESKTOP)) {
			viewString = "desktopView";
		}
        String userLayout = getSessionContainer(request).getUserInfo().getLayout();
        if (BFUtils.isNotEmpty(userLayout)) {
    		if (userLayout.equals(BFConstants.APP_LAYOUT_DESKTOP)) {
    			viewString = "desktopView";
    		}else {
    			viewString = "indexView";
    		}
		}
		return mapping.findForward(viewString);
	}

	/**
	 * 欢迎页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward preferencesInit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("sysIntroduce", getParamValue("SYS_INTRODUCE", request));
		return mapping.findForward("welcomeView");
	}
	
	/**
	 * 保存用户自定义皮肤
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUserTheme(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String theme = request.getParameter("theme");
		dto.put("userid", super.getSessionContainer(request).getUserInfo().getUserid());
		dto.put("theme", theme);
		Dto outDto = organizationService.saveUserTheme(dto);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存用户自定义布局
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUserLayout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String layout = request.getParameter("layout");
		dto.put("userid", super.getSessionContainer(request).getUserInfo().getUserid());
		dto.put("layout", layout);
		Dto outDto = organizationService.saveUserLayout(dto);
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		userInfoVo.setLayout(layout);
		getSessionContainer(request).setUserInfo(userInfoVo);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存用户自定义桌面背景
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveUserBackground(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String background = request.getParameter("background");
		dto.put("userid", super.getSessionContainer(request).getUserInfo().getUserid());
		dto.put("background", background);
		Dto outDto = organizationService.saveUserBackground(dto);
		String jsonString = JsonHelper.encodeObject2Json(outDto);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 加载当前登录用户信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward loadUserInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		Dto inDto = new BaseDto();
		BFUtils.copyPropFromBean2Dto(userInfoVo, inDto);
		Dto outDto = (BaseDto)bfReader.queryForObject("User.getUserInfoByKey", inDto);
		outDto.remove("password");
		String jsonString = JsonHelper.encodeDto2FormLoadJson(outDto, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 修改当前登录用户信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateUserInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		CommonActionForm cForm = (CommonActionForm)form;
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		UserService service = (UserService)getService("userService");
		Dto indDto = cForm.getParamAsDto(request);
		Dto outDto = new BaseDto(BFConstants.TRUE);
		outDto.put("flag", BFConstants.SUCCESS);
		String password = BFUtils.encryptBasedDes(indDto.getAsString("password2")); 
		if (password.equals(userInfoVo.getPassword())) {
			service.updateUserItem4IndexPage(indDto);
			outDto.put("flag", BFConstants.SUCCESS);
			userInfoVo.setPassword(BFUtils.encryptBasedDes(indDto.getAsString("password1")));
			getSessionContainer(request).setUserInfo(userInfoVo);
		}else {
			outDto.setSuccess(BFConstants.FALSE);
			outDto.put("flag", BFConstants.FAILURE);
		}
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 解锁系统
	 * 
	 * @param
	 * @return
	 */
	public ActionForward unlockSystem(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		CommonActionForm cForm = (CommonActionForm)form;
		UserInfoVo userInfoVo = getSessionContainer(request).getUserInfo();
		Dto indDto = cForm.getParamAsDto(request);
		String password = BFUtils.encryptBasedDes(indDto.getAsString("password"));
		Dto outDto = new BaseDto(BFConstants.TRUE);
		if (password.equals(userInfoVo.getPassword())) {
			outDto.put("flag", BFConstants.SUCCESS);
		}else {
			outDto.put("flag", BFConstants.FAILURE);
		}
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}

}
