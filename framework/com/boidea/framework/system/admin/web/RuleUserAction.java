/**
 * CopyRight 2013
 */
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
import com.boidea.framework.system.admin.service.DataRuleService;
import com.boidea.framework.system.admin.service.OrganizationService;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.util.BFUtils;

/**
 * 数据规则用户授权操作类
 *
 * @author zhaozehui
 * @since 2013-12-2
 */
public class RuleUserAction extends BizAction {

	private DataRuleService ruleService = (DataRuleService)super.getService("dataRuleService");
	
	private OrganizationService organizationService = (OrganizationService)getService("organizationService");
	
	
	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.removeSessionAttribute(request, "deptid");
		Dto inDto = new BaseDto();
		String deptid = super.getSessionContainer(request).getUserInfo().getDeptid();
		inDto.put("deptid", deptid);
		Dto outDto = organizationService.queryDeptinfoByDeptid(inDto);
		request.setAttribute("rootDeptid", outDto.getAsString("deptid"));
		request.setAttribute("rootDeptname", outDto.getAsString("deptname"));
		Dto dto = (Dto)bfReader.queryForObject("Resource.queryEamenuByMenuID", "01");
		request.setAttribute("rootMenuName", dto.getAsString("menuname"));
		return mapping.findForward("initView");
	}
	
	/**
	 * 部门管理树初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward departmentTreeInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		String nodeid = request.getParameter("node");
		dto.put("parentid", nodeid);
		Dto outDto = organizationService.queryDeptItems(dto);
		write(outDto.getAsString("jsonString"), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 查询数据规则列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryRuleList4Grant(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm cForm = (CommonActionForm)form;
		Dto dto = cForm.getParamAsDto(request);
		List list = bfReader.queryForPage("DataRule.queryUserRules", dto);
		
		String jsonString = encodeList2PageJson(list, list.size(), null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存数据规则人员授权数据
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveRuleUserGrantDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		ruleService.saveRuleUserGrant(inDto);
		setOkTipMsg("授权数据保存成功", response);
		return mapping.findForward(null);
	}
	
	
}
