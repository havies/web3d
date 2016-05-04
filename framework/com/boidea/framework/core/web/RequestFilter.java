package com.boidea.framework.core.web;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.SpringBeanLoader;
import com.boidea.framework.core.model.dao.Dao;
import com.boidea.framework.core.properties.PropertiesFactory;
import com.boidea.framework.core.properties.PropertiesFile;
import com.boidea.framework.core.properties.PropertiesHelper;
import com.boidea.framework.system.admin.service.MonitorService;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * 请求拦截过滤器
 * 
 * @author zhaozh
 * @since 2010-04-13
 */
public class RequestFilter implements Filter {

	private Log log = LogFactory.getLog(RequestFilter.class);
	protected FilterConfig filterConfig;
	protected boolean enabled;

	/**
	 * 构造
	 */
	public RequestFilter() {
		filterConfig = null;
		enabled = true;
	}

	/**
	 * 初始化
	 */
	public void init(FilterConfig pFilterConfig) throws ServletException {
		this.filterConfig = pFilterConfig;
		String value = filterConfig.getInitParameter("enabled");
		if (BFUtils.isEmpty(value)) {
			this.enabled = true;
		} else if (value.equalsIgnoreCase("true")) {
			this.enabled = true;
		} else {
			this.enabled = false;
		}
	}

	/**
	 * 过滤处理
	 */
	public void doFilter(ServletRequest pRequest, ServletResponse pResponse, FilterChain fc) throws IOException,
			ServletException {
		HttpServletRequest request = (HttpServletRequest) pRequest;
		HttpServletResponse response = (HttpServletResponse) pResponse;
		String ctxPath = request.getContextPath();
		String requestUri = request.getRequestURI();
		String uri = requestUri.substring(ctxPath.length());
		UserInfoVo userInfo = WebUtils.getSessionContainer(request).getUserInfo();
		BigDecimal costTime = null;
		PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.BF);
		String eventMonitorEnabel = pHelper.getValue("requestMonitor", "1");
		String isAjax = request.getHeader("x-requested-with");
		if (BFUtils.isEmpty(userInfo) && !uri.equals("/login.do") && enabled) {
			if (BFUtils.isEmpty(isAjax)) {
				response.getWriter().write(
						"<script type=\"text/javascript\">parent.location.href='" + ctxPath
								+ "/login.do?reqCode=init'</script>");
				response.getWriter().flush();
				response.getWriter().close();
			} else {
				response.sendError(BFConstants.Ajax_Timeout);
			}
			log.warn("警告:非法的URL请求已被成功拦截,请求已被强制重定向到了登录页面.访问来源IP:" + request.getRemoteAddr() + " 试图访问的URL:"
					+ request.getRequestURL().toString() + "?reqCode=" + request.getParameter("reqCode"));
			return;
		}
		if (BFUtils.isNotEmpty(isAjax) && !uri.equals("/login.do") && uri.indexOf("/service/") == 0 && uri.indexOf("/rest/") == 0) {
			String loginuserid = request.getParameter("loginuserid");
			if (BFUtils.isEmpty(loginuserid)) {
				response.sendError(BFConstants.Ajax_Unknow);
				log.error("请求非法,[loginuserid]参数缺失");
				return;
			}
			if (!loginuserid.equals(userInfo.getUserid())) {
				response.sendError(BFConstants.Ajax_Session_Unavaliable);
				log.error("当前会话和登录用户会话不一致,请求被重定向到了登录页面");
				return;
			}
		}
		// if(){.... return;}
		long start = System.currentTimeMillis();
		fc.doFilter(request, response);
		if (eventMonitorEnabel.equalsIgnoreCase(SystemConstants.EVENTMONITOR_ENABLE_Y)
				&& BFUtils.isNotEmpty(userInfo)
				&& !userInfo.getAccount().equalsIgnoreCase(WebUtils.getParamValue("DEFAULT_DEVELOP_ACCOUNT", request))//开发人员不加审计
				) {
			costTime = new BigDecimal(System.currentTimeMillis() - start);
			saveEvent(request, costTime);
		}
	}

	/**
	 * 写操作员事件表
	 * 
	 * @param request
	 */
	private void saveEvent(HttpServletRequest request, BigDecimal costTime) {
		UserInfoVo userInfo = WebUtils.getSessionContainer(request).getUserInfo();
		if (BFUtils.isEmpty(userInfo)) {
			return;
		}
		String menuid = request.getParameter("menuid4Log");
		Dto dto = new BaseDto();
		dto.put("account", userInfo.getAccount());
		dto.put("activetime", BFUtils.getCurrentTimeAsNumber());
		dto.put("userid", userInfo.getUserid());
		dto.put("username", userInfo.getUsername());
		dto.put("requestpath", request.getRequestURI());
		dto.put("methodname", request.getParameter("reqCode"));
//		dto.put("eventid", IDHelper.getEventID());
		dto.put("costtime", costTime);
		if (BFUtils.isNotEmpty(menuid)) {
			Dao bfDao = (Dao) SpringBeanLoader.getSpringBean("bfDao");
			String menuname = ((BaseDto) bfDao.queryForObject("Resource.queryEamenuByMenuID", menuid)).getAsString("menuname");
			String msg = userInfo.getUsername() + "[" + userInfo.getAccount() + "]打开了菜单[" + menuname + "]";
			dto.put("description", msg);
			log.info(msg);
		} else {
			String msg = userInfo.getUsername() + "[" + userInfo.getAccount() + "]调用了Action方法["
					+ request.getParameter("reqCode") + "]";
			dto.put("description", msg);
			log.info(msg + ";请求路径[" + request.getRequestURI() + "]");
		}
		MonitorService monitorService = (MonitorService) SpringBeanLoader.getSpringBean("monitorService");
		monitorService.saveEvent(dto);

	}

	/**
	 * 销毁
	 */
	public void destroy() {
		filterConfig = null;
	}

}
