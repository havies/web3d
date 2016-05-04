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
import com.boidea.framework.system.admin.service.ParamService;

/**
 * 全局参数表管理Action
 * 
 * @author zhaozh
 * @since 2010-05-05
 * @see BizAction
 */
public class ParamAction extends BizAction{
	
	private ParamService paramService = (ParamService)super.getService("paramService");
	
	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return mapping.findForward("manageParamView");
	}
	
	/**
	 * 查询参数列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryParamsForManage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		List paramList = bfReader.queryForPage("Param.queryParamsForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("Param.queryParamsForManageForPageCount", dto);
		String jsonString = JsonHelper.encodeList2PageJson(paramList, pageCount, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存参数信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveParamItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		paramService.saveParamItem(inDto);
		setOkTipMsg("参数数据新增成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 删除参数信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteParamItems(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		paramService.deleteParamItem(inDto);
		setOkTipMsg("参数数据删除成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 修改参数信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateParamItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		paramService.updateParamItem(inDto);
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("msg", "参数数据修改成功!");
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 内存同步
	 * 
	 * @param
	 * @return
	 */
	public ActionForward synMemory(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
	    List paramList = bfReader.queryForList("Resource.getParamList");
	    getServlet().getServletContext().removeAttribute("EAPARAMLIST");
	    getServlet().getServletContext().setAttribute("EAPARAMLIST", paramList);
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		write(JsonHelper.encodeObject2Json(outDto), response);
		return mapping.findForward(null);
	}
}
