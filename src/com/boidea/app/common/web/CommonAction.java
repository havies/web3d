/**
 * CopyRight 2013
 */
package com.boidea.app.common.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boidea.app.common.service.CommonService;
import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.web.BizController;
import com.boidea.framework.core.web.CommonActionForm;

/**
 * 系统公共操作方法
 *
 * @author zhaozehui
 * @since 2013-12-3
 */
public class CommonAction extends BizController {
	
	private CommonService yjsCommonService = (CommonService)super.getService("yjsCommonService");
	
	
	/**
	 * 根据角色身份得到两层角色树列表［角色身份－》角色］
	 * 用于选择面向指定角色的情况
	 * @param fatherid
	 */
	public ActionForward getRolesOrderbySpec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		String nodeid = request.getParameter("node");
		String multicheck = request.getParameter("multicheck");
		
		dto.put("fatherid", nodeid);
		List treeList = bfReader.queryForList("Role.queryRolesOrderBySpec", dto);
		Dto treeDto = new BaseDto();
		for (int i = 0; i < treeList.size(); i++) {
			treeDto = (BaseDto) treeList.get(i);
			if("true".equals(multicheck)) {
				treeDto.put("checked", new Boolean(false));
			}
			treeDto.put("leaf", new Boolean(false));
			treeDto.put("expanded", new Boolean(true));
		}
		write(JsonHelper.encodeObject2Json(treeList), response);
		return mapping.findForward(null);
	}
}
