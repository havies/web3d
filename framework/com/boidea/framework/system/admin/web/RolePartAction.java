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
import com.boidea.framework.system.admin.service.OrganizationService;
import com.boidea.framework.system.admin.service.PartService;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.util.BFUtils;

/**
 * UI组件角色授权
 * 
 * @author zhaozh
 * @since 2011-06-03
 * @see BizAction
 */
public class RolePartAction extends BizAction {
	
	private PartService partService = (PartService) getService("partService");
	
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
	 * 查询UI组件列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryParts(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm cForm = (CommonActionForm)form;
		Dto dto = cForm.getParamAsDto(request);
		List list = bfReader.queryForPage("Part.queryParts", dto);
		Integer countInteger = (Integer) bfReader.queryForObject("Part.queryPartsForPageCount", dto);
		for (int i = 0; i < list.size(); i++) {
			Dto partDto = (BaseDto)list.get(i);
			dto.put("partid", partDto.getAsString("partid"));
			Dto outDto = (BaseDto)bfReader.queryForObject("Part.queryPart4RoleGrant", dto);
			if (BFUtils.isEmpty(outDto)) {
				partDto.put("partauthtype", SystemConstants.PARTAUTHTYPE_NOGRANT);
			}else {
				partDto.putAll(outDto);
			}
		}
		String jsonString = encodeList2PageJson(list, countInteger, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存UI人员授权数据
	 * 
	 * @param
	 * @return
	 */
	public ActionForward savePartUserGrantDatas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		List list  = aForm.getGridDirtyData(request);
		Dto inDto = new BaseDto();
		inDto.setDefaultAList(list);
		partService.savePartRoleGrantDatas(inDto);
		setOkTipMsg("授权数据保存成功", response);
		return mapping.findForward(null);
	}
}
