/**
 * Boidea Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.common.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.excelutils.ExcelUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boidea.app.common.service.GyCalendarEventService;
import com.boidea.framework.core.id.util.IDHelper;
import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.BizController;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;

/**
 * 日历事件管理管理Action
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-10
 * @see BizAction
 */
@Controller
@RequestMapping(value = "/common/gycalendarevent")
public class GyCalendarEventAction extends BizController{
	
	private GyCalendarEventService gycalendareventService = (GyCalendarEventService)super.getService("gycalendareventService");
	
	/**
	 * 日历首页
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "calendarMain")
	public ModelAndView calendarMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return new ModelAndView("system/admin/calendarPage");
	}
	
	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "init")
	public ModelAndView init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String menuid = request.getParameter("menuid4Log");
		request.setAttribute("menuid", menuid);
		return new ModelAndView("system/admin/mngGyCalendarEvent");
	}
	
	/**
	 * 查询日历事件管理列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "queryForManage")
	public ModelAndView queryForManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		List retList = new ArrayList();
		
		//公共日历事件
		//思路是这样的：系统中存在各类起止时间的配置，在这里应该有一个统一的接口，整合所有的起止时间
		//来自于GY_PARAM
		//公共事件不能在日历界面中编辑，是通过其他的业务功能编辑的，在日历里不能修改，只能查看。
		//TODO
		
		//私有日历事件
		UserInfoVo userInfo = super.getSessionContainer(request).getUserInfo();
		dto.put("owneruserid", userInfo.getUserid());
		List pageList = bfReader.queryForList("GyCalendarEvent.queryGyCalendarEventsForManage", dto);
		retList.addAll(pageList);
		write(JsonHelper.encodeObject2Json(retList), response);
		return null;
	}
	
	/**
	 * 保存日历事件管理信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "saveItem")
	public ModelAndView saveItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		
		String eventStrData = inDto.getAsString("data");
		
		Dto eventDto = JsonHelper.parseSingleJson2Dto(eventStrData);
		
		UserInfoVo userInfo = super.getSessionContainer(request).getUserInfo();
		eventDto.put("owneruserid", userInfo.getUserid());
		eventDto.put("eventowner", "private");
		eventDto.put("scrq", BFUtils.getCurrentTime());
		String eId = IDHelper.uuid();
		eventDto.put("EventId", eId);
		gycalendareventService.saveGyCalendarEventItem(eventDto);
		
		write(new BaseDto(BFConstants.TRUE, eId).toJson(), response);
		return null;
	}
	
	/**
	 * 删除日历事件管理信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "deleteItems")
	public ModelAndView deleteItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		gycalendareventService.deleteGyCalendarEventItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
		return null;
	}
	
	/**
	 * 修改日历事件管理信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "updateItem")
	public ModelAndView updateItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		String eventStrData = inDto.getAsString("data");
		Dto eventDto = JsonHelper.parseSingleJson2Dto(eventStrData);
		gycalendareventService.updateGyCalendarEventItem(eventDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
		return null;
	}
	
	/**
	 * 导出日历事件管理列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "exportItem")
	public void exportItem(@RequestParam(value="oper",required=false) String oper, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if("subcolumn".equals(oper)) {
            setExportColumn(request, "QUERYGYCALENDAREVENT4EXPORT_COND");
            setOkTipMsg("", response);
        }
        else {
            Dto inDto = (BaseDto) super.getSessionAttribute(request, "QUERYGYCALENDAREVENT4EXPORT_COND");
            inDto.put("start", "0");inDto.put("limit", "65535");
            List<BaseDto> dataList = bfReader.queryForList("GyCalendarEvent.queryGyCalendarEventsForManage", inDto);
            ExcelUtils.addValue("columnNames", getExportColumnNames(request, "QUERYGYCALENDAREVENT4EXPORT_COND"));
            ExcelUtils.addValue("columnKeys", getExportColumnKeys(request, "QUERYGYCALENDAREVENT4EXPORT_COND"));
            ExcelUtils.addValue("dataList", dataList);
            String tplpath = "/report/excel/common_export_template.xls";
            response.reset();
            response.addHeader("Content-Type", "application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment;filename=export_"+BFUtils.getCurrentTimeAsNumber()+".xls");
            ExcelUtils.export(request.getSession().getServletContext(), tplpath, response.getOutputStream());
        }
	}
	
}
