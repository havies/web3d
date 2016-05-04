package com.boidea.framework.system.admin.web;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.Assert;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.CommonActionForm;
import com.boidea.framework.core.web.HttpRequestDeviceUtils;
import com.boidea.framework.core.web.SessionListener;
import com.boidea.framework.system.admin.service.MonitorService;
import com.boidea.framework.system.admin.service.OrganizationService;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * 登录页面Action
 * 
 * @author zhaozh
 * @since 2010-01-13
 * @see BizAction
 */
public class LoginAction extends BizAction {

	private static Log log = LogFactory.getLog(LoginAction.class);

	private OrganizationService organizationService = (OrganizationService) super.getService("organizationService");

	private MonitorService monitorService = (MonitorService) super.getService("monitorService");
	
//	private IdentityService identityService = (IdentityService) super.getService("identityService");

	/**
	 * 登陆页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String bannerPath = getParamValue("LOGIN_WINDOW_BANNER", request);
		bannerPath = request.getContextPath() + bannerPath;
		request.setAttribute("bannerPath", bannerPath);
		request.setAttribute("sysTitle", getParamValue("SYS_TITLE", request));
//		request.setAttribute("sysIntroduce", getParamValue("SYS_INTRODUCE", request));
		
		if(HttpRequestDeviceUtils.isMobileDevice(request)) {
			response.getWriter().write(
					"<script type=\"text/javascript\">parent.location.href='" + request.getContextPath()
							+ "/weixin/unbinding.action'</script>");
			response.getWriter().flush();
			response.getWriter().close();
			return null;
		}
		
		return mapping.findForward("loginView");
	}

	/**
	 * 登陆身份验证
	 * 
	 * @param
	 * @return
	 */
	public ActionForward login(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		password = BFUtils.encryptBasedDes(password);
		//log.info("帐户[" + account + "]正尝试登陆系统...");
		Dto dto = new BaseDto();
		dto.put("account", account);
		Dto outDto = organizationService.getUserInfo(dto);
		UserInfoVo userInfo = (UserInfoVo) outDto.get("userInfo");
		Dto jsonDto = new BaseDto();
		if (BFUtils.isEmpty(userInfo)) {
			jsonDto.put("success", new Boolean(false));
			jsonDto.put("msg", "帐号输入错误,请重新输入!");
			jsonDto.put("errorType", "1");
			log.warn("帐户[" + account + "]登陆失败.(失败原因：不存在此帐户)");
			write(jsonDto.toJson(), response);
			return mapping.findForward("");
		}
		if (!password.equals(userInfo.getPassword())) {
			jsonDto.put("success", new Boolean(false));
			jsonDto.put("msg", "密码输入错误,请重新输入!");
			jsonDto.put("errorType", "2");
			log.warn(userInfo.getUsername() + "[" + userInfo.getAccount() + "]" + "登录系统失败(失败原因：密码输入错误)");
			write(jsonDto.toJson(), response);
			return mapping.findForward("");
		}
		String multiSession = WebUtils.getParamValue("MULTI_SESSION", request);
		if ("0".equals(multiSession)) {
			Integer sessions = (Integer) bfReader.queryForObject("Organization.countHttpSessions", account);
			if (sessions.intValue() > 0) {
				jsonDto.put("success", new Boolean(false));
				jsonDto.put("msg", "此用户已经登录,系统不允许建立多个会话连接!");
				jsonDto.put("errorType", "3");
				log.warn(userInfo.getUsername() + "[" + userInfo.getAccount() + "]"
						+ "登录系统失败(失败原因：此用户已经登录,系统参数配置为不允许一个用户建立多个连接)");
				write(jsonDto.toJson(), response);
				return mapping.findForward("");
			}
		}
		userInfo.setSessionID(request.getSession().getId());
		userInfo.setSessionCreatedTime(BFUtils.getCurrentTime());
//		userInfo.setLoginIP(request.getRemoteAddr());
//		userInfo.setExplorer(BFUtils.getClientExplorerType(request));
		if (!checkMultiUser(userInfo, request)) {
			jsonDto.put("success", new Boolean(false));
			jsonDto.put("msg", "不允许在同一客户端上同时以不同帐户登录系统,是否要退出之前登录的帐户？");
			jsonDto.put("errorType", "4");
			log.warn("帐户[" + account + "]登陆失败.(失败原因：不允许在同一客户端上同时以不同帐户登录系统,是否要退出之前登录的帐户？)");
			write(jsonDto.toJson(), response);
			return mapping.findForward("");
		}
		
		//内置用户不判断
		if (!account.equalsIgnoreCase(WebUtils.getParamValue("DEFAULT_DEVELOP_ACCOUNT", request)) 
				&& !account.equalsIgnoreCase(WebUtils.getParamValue("DEFAULT_ADMIN_ACCOUNT", request))) {
			//检查是否包含多个角色身份
			List userRolespecsList = bfReader.queryForList("Role.queryUserRolespecs", new BaseDto("userid", userInfo.getUserid()));
			Assert.notEmpty(userRolespecsList, "用户拥有的角色身份最少要有一个");
			if(userRolespecsList.size() == 1) {
				//只有一类角色身份，正常登录
				userInfo.setManyRolespec(false);
				BaseDto urDto = (BaseDto)userRolespecsList.get(0);
				userInfo.setRolespec(urDto.getAsString("rolespec"));
				userInfo.setRolespecName(urDto.getAsString("rolespecname"));
			}
			//多重角色身份，要进行选择后再登录到主窗口，选择之前不算完全登录
			if(userRolespecsList.size() > 1) {
				userInfo.setManyRolespec(true);
			}
		}
		else {
			userInfo.setRolespec("00");//默认为第一级管理员
			userInfo.setRolespecName("系统内置级");
		}
		
		/**
		 * activiti的用户初始化
		 */
//		User user = identityService.createUserQuery().userId(account).singleResult();
//        UserUtil.saveUserToSession(request.getSession(), user);
		
        
        //成功登录系统
		log.info(userInfo.getUsername() + "[" + userInfo.getAccount() + "]" + "成功登录系统!创建了一个有效Session连接,会话ID:["
				+ request.getSession().getId() + "]" + BFUtils.getCurrentTime());
		SessionListener.addSession(request.getSession(), userInfo); // 保存有效Session
		if (bfPHelper.getValue("requestMonitor", "0").equals("1")) {
			saveLoginEvent(userInfo, request);
		}
		
		super.getSessionContainer(request).setUserInfo(userInfo);
		jsonDto.put("success", new Boolean(true));
		jsonDto.put("userid", userInfo.getUserid());
		jsonDto.put("manyrolespec", userInfo.getManyRolespec().toString());
		write(jsonDto.toJson(), response);
		return mapping.findForward("");
	}
	
	/**
	 * 如果拥有多重角色身份，则需要进行选择。<br>
	 * （登录时选择或者进入主窗口后选择）
	 * @param userInfoVo
	 * @param request
	 */
	public ActionForward selectRolespec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);

		UserInfoVo userInfo = super.getSessionContainer(request).getUserInfo();
		if(BFUtils.isEmpty(dto.getAsString("rolespec"))) {
			List userRolespecsList = bfReader.queryForList("Role.queryUserRolespecs", new BaseDto("userid", userInfo.getUserid()));
			
			String jsonString = JsonHelper.encodeList2PageJson(userRolespecsList, userRolespecsList.size(), null);
			write(jsonString, response);
		}
		else {//选择某一个角色
			userInfo.setRolespec(dto.getAsString("rolespec"));
			userInfo.setRolespecName(dto.getAsString("rolespecname"));
			
			//成功登录系统
			log.info(userInfo.getUsername() + "[" + userInfo.getAccount() + "]" + "成功登录系统!创建了一个有效Session连接,会话ID:["
					+ request.getSession().getId() + "]" + BFUtils.getCurrentTime());
			SessionListener.addSession(request.getSession(), userInfo); // 保存有效Session
			if (bfPHelper.getValue("requestMonitor", "0").equals("1")) {
				saveLoginEvent(userInfo, request);
			}
			Dto jsonDto = new BaseDto();
			super.getSessionContainer(request).setUserInfo(userInfo);
			jsonDto.put("success", new Boolean(true));
			jsonDto.put("userid", userInfo.getUserid());
			jsonDto.put("manyrolespec", userInfo.getManyRolespec().toString());
			write(jsonDto.toJson(), response);
		}
		
		return mapping.findForward("");
	}
	
	
	/**
	 * 回写Cookie
	 * @param userInfoVo
	 * @param request
	 */
	private void writeCookie2Client(UserInfoVo userInfoVo, HttpServletRequest request){
		
	}

	/**
	 * 不允许在同一客户端上不同帐户同时以同种浏览器登录系统<br>
	 * 规避同一客户端同时以不同账户使用同种浏览器登录系统窜账户的情况
	 * 
	 * @return
	 */
	private Boolean checkMultiUser(UserInfoVo userInfoVo, HttpServletRequest request) {
		boolean allowLogin = true;
		String cookieUserid = WebUtils.getCookieValue(request.getCookies(), "bf.login.userid", "");
		String sessionid = request.getSession().getId();
		HttpSession httpSession = SessionListener.getSessionByID(sessionid);
		if (BFUtils.isNotEmpty(httpSession)) {
			//UserInfoVo oldUserInfoVo = WebUtils.getSessionContainer(httpSession).getUserInfo();
			if (!cookieUserid.equals(userInfoVo.getUserid())) {
				allowLogin = false;
			}
		}
		return new Boolean(allowLogin);
	}

	/**
	 * 退出登录
	 * 
	 * @param
	 * @return
	 */
	public ActionForward logout(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserInfoVo userInfo = super.getSessionContainer(request).getUserInfo();
		if (BFUtils.isNotEmpty(userInfo)) {
			if (bfPHelper.getValue("requestMonitor", "0").equals("1")) {
				saveLogoutEvent(userInfo, request);
			}
			log.info(userInfo.getUsername() + "退出了系统!");
			super.getSessionContainer(request).setUserInfo(null);
		}
		if (BFUtils.isNotEmpty(request.getSession())) {
			request.getSession().invalidate();
		}
		//remove cookie
		Cookie[] cookies=request.getCookies(); 
		try { 
			for(int i=0; i<cookies.length; i++) { 
				Cookie cookie = new Cookie(cookies[i].getName(),"null"); 
				cookie.setMaxAge(0); 
				cookie.setPath("/");
				response.addCookie(cookie); 
			}
		}
		catch (Exception e) {
			
		}
		
		return init(mapping, form, request, response);
//		return mapping.findForward("loginView");
	}

	/**
	 * 保存登录事件
	 * 
	 * @param userInfo
	 */
	protected void saveLoginEvent(UserInfoVo userInfo, HttpServletRequest request) {
		Dto dto = new BaseDto();
		dto.put("account", userInfo.getAccount());
		dto.put("activetime", BFUtils.getCurrentTimeAsNumber());
		dto.put("userid", userInfo.getUserid());
		dto.put("username", userInfo.getUsername());
		dto.put("description", "登录系统");
		dto.put("requestpath", request.getRequestURI());
		dto.put("methodname", request.getParameter("reqCode"));
//		dto.put("eventid", IDHelper.getEventID());
		monitorService.saveEvent(dto);
	}

	/**
	 * 保存退出事件
	 * 
	 * @param userInfo
	 */
	protected void saveLogoutEvent(UserInfoVo userInfo, HttpServletRequest request) {
		Dto dto = new BaseDto();
		dto.put("account", userInfo.getAccount());
		dto.put("activetime", BFUtils.getCurrentTimeAsNumber());
		dto.put("userid", userInfo.getUserid());
		dto.put("username", userInfo.getUsername());
		dto.put("description", "退出系统");
		dto.put("requestpath", request.getRequestURI());
		dto.put("methodname", request.getParameter("reqCode"));
//		dto.put("eventid", IDHelper.getEventID());
		monitorService.saveEvent(dto);
	}

}
