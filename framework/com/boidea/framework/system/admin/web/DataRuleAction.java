/**
 * CopyRight 2013
 */
package com.boidea.framework.system.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.CommonActionForm;
import com.boidea.framework.system.admin.service.DataRuleService;
import com.boidea.framework.util.BFUtils;

/**
 * 数据规则托管管理
 *
 * @author zhaozehui
 * @since 2013-12-2
 */
public class DataRuleAction extends BizAction {
	
	private DataRuleService ruleService = (DataRuleService)super.getService("dataRuleService");
	
	
	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("manageDataRuleView");
	}
	
	/**
	 * 查询数据规则列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryRulesForManage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List ruleList = bfReader.queryForPage("DataRule.queryDataRulesForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("DataRule.queryDataRulesForManageForPageCount", dto);
		String jsonString = JsonHelper.encodeList2PageJson(ruleList, pageCount, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存数据规则
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveRuleItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		if(!BFUtils.validateSQLInjection(inDto.getAsString("datacond"))) {
			setErrTipMsg("数据范围条件语句不符合要求", response);
			return mapping.findForward(null);
		}
		ruleService.saveRuleItem(inDto);
		setOkTipMsg("数据规则新增成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 删除数据规则
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteRuleItems(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		ruleService.deleteRuleItems(inDto);
		setOkTipMsg("数据规则删除成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 修改数据规则
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateRuleItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		if(!BFUtils.validateSQLInjection(inDto.getAsString("datacond"))) {
			setErrTipMsg("数据规则的数据范围条件语句不符合要求", response);
			return mapping.findForward(null);
		}
		ruleService.updateRuleItem(inDto);
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("msg", "数据规则修改成功!");
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
	
}
