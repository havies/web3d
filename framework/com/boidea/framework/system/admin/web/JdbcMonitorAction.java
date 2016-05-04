package com.boidea.framework.system.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.CommonActionForm;
import com.boidea.framework.system.admin.service.MonitorService;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;

/**
 * JDBC监控
 * 
 * @author zhaozh
 * @since 2010-09-03
 * @see BizAction
 */
public class JdbcMonitorAction extends BizAction {

	private MonitorService monitorService = (MonitorService) super.getService("monitorService");

	/**
	 * JDBC实时监控页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward jdbcInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		return mapping.findForward("jdbcInitView");
	}

	/**
	 * 查询监控信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryMonitorData(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		dto.put("ksrq", BFUtils.Date2String(dto.getAsDate("ksrq"), "yyyyMMdd000000"));
		dto.put("jsrq", BFUtils.Date2String(dto.getAsDate("jsrq"), "yyyyMMdd235959"));
		List eventList = bfReader.queryForPage("Monitor.queryJdbcMonitorRecordsByDto", dto);
		for (int i = 0; i < eventList.size(); i++) {
			Dto dto2 = (BaseDto)eventList.get(i);
			dto2.put("starttime", BFUtils.stringToDate(dto2.getAsString("starttime"), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss"));
			dto2.put("effectrows", dto2.getAsString("effectrows").equals("-1") ? "-" : dto2.getAsString("effectrows"));
		}
		Integer totalCount = (Integer) bfReader.queryForObject("Monitor.queryJdbcMonitorRecordsByDtoForPageCount", dto);
		String jsonString = encodeList2PageJson(eventList, totalCount, BFConstants.FORMAT_DateTime);
		write(jsonString, response);
		return mapping.findForward(null);
	}

	/**
	 * 删除监控信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteMonitorDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		monitorService.deleteJDBCMonitorData(dto);
		if (dto.getAsString("type").equalsIgnoreCase("reset"))
			setOkTipMsg("执行成功,所有监控记录已被清除!", response);
		else 
			setOkTipMsg("数据删除成功!", response);
		return mapping.findForward(null);
	}

}
