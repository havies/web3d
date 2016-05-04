package com.boidea.framework.system.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.CommonActionForm;
import com.boidea.framework.core.web.SessionContainer;
import com.boidea.framework.core.web.SessionListener;
import com.boidea.framework.system.admin.service.MonitorService;
import com.boidea.framework.util.BFUtils;

/**
 * HTTP会话监控
 * 
 * @author zhaozh
 * @since 2010-09-03
 */
public class HttpSessionMonitorAction extends BizAction {

	private MonitorService monitorService = (MonitorService)getService("monitorService");

	/**
	 * 会话监控页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		return mapping.findForward("sessionMonitorView");
	}
	
	/**
	 * 获取当前活动的用户列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward getSessionList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		CommonActionForm cForm = (CommonActionForm)form;
		Dto dto = cForm.getParamAsDto(request);
		List sessionList = bfReader.queryForPage("Monitor.queryHttpSessions", dto);
		Integer pageCount = (Integer) bfReader.queryForObject("Monitor.queryHttpSessionsForPageCount", dto);
		String jsonString = encodeList2PageJson(sessionList, pageCount, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 踢出会话
	 * 
	 * @param
	 * @return
	 */
	public ActionForward killSession(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		String[] sessionid = strChecked.split(",");
		Dto delDto = new BaseDto();
		String msg = "选中的会话已踢出!";
		for (int i = 0; i < sessionid.length; i++) {
			String seid = sessionid[i];
			delDto.put("sessionid", seid);
			if(!seid.equalsIgnoreCase(request.getSession().getId())){
				monitorService.deleteHttpSession(delDto);
				HttpSession session = SessionListener.getSessionByID(seid);
				if(BFUtils.isNotEmpty(seid)){
					SessionContainer sessionContainer =  (SessionContainer)session.getAttribute("SessionContainer");
					sessionContainer.setUserInfo(null); //配合RequestFilter进行拦截
					sessionContainer.cleanUp();
				}
			}else {
				msg += " 提示：不能踢出当前用户!";
			}
		}
		setOkTipMsg(msg, response);
		return mapping.findForward(null);
	}
}
