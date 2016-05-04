/**
 * Management Information System Platform
 * CopyRight 2014
 */

package ${packageName}.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.CommonActionForm;
import com.boidea.framework.core.web.report.xexcel.XExcelExporter;

import ${packageName}.service.${zTable.className}Service;

/**
 * ${zTable.comment}管理Action
 * 
 * @author 
 * @since ${todayDate("yyyy-MM-dd")}
 * @see BizAction
 */
public class ${zTable.className}Action extends BizAction{
	
	private ${zTable.className}Service ${zTable.className?lower_case}Service = (${zTable.className}Service)super.getService("${zTable.className?lower_case}Service");
	
	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String menuid = request.getParameter("menuid4Log");
		request.setAttribute("menuid", menuid);
		return mapping.findForward("mng${zTable.className}View");
	}
	
	/**
	 * 查询${zTable.comment}列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryForManage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		
		String menuid = dto.getAsString("menuid");
		
		/*
		UserInfoVo userInfo = super.getSessionContainer(request).getUserInfo();
		String ruleCond = super.getDataRule(menuid, userInfo, YJSConstants.);
		if(BFUtils.isEmpty(ruleCond)) {
			//如果没有授权数据规则，再判断用户的角色身份确定数据范围
			if(WebUtils.isRolespec(YJSConstants.ROLESPEC_YY, request)) {
			}
			else if(WebUtils.isRolespec(YJSConstants.ROLESPEC_YX, request)) {
				//dto.put("departmentid", yjsCommonService.getYJSDepartmentByUserDeptid(userInfo.getDeptid()).getAsString("departmentid"));
			}
			else {
				//dto.put("departmentid", YJSConstants.NOT_EXISTS_ID);
			}
		}
		else {
			dto.put("ruleCond", ruleCond);
		}
		*/
		
		//将查询条件保存用于导出
		super.setSessionAttribute(request, "QUERY${zTable.className?upper_case}4EXPORT_QUERYDTO", dto);
		List pageList = bfReader.queryForPage("${zTable.className}.query${zTable.className}sForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("${zTable.className}.query${zTable.className}sCountForManage", dto);
		String jsonString = JsonHelper.encodeList2PageJson(pageList, pageCount, null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存${zTable.comment}信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		${zTable.className?lower_case}Service.save${zTable.className}Item(inDto);
		setOkTipMsg("", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 删除${zTable.comment}信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteItems(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		${zTable.className?lower_case}Service.delete${zTable.className}Item(inDto);
		setOkTipMsg("", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 修改${zTable.comment}信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		${zTable.className?lower_case}Service.update${zTable.className}Item(inDto);
        setOkTipMsg("", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 导出${zTable.comment}列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward exportItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		XExcelExporter excelExporter = new XExcelExporter();
        // 定义模板的路径（office2007制作）
        excelExporter.setTemplatePath("/report/excel/app/departmentReport.xlsx", request);
        // 编辑parametersDto1
        Dto parametersDto1 = new BaseDto();
        parametersDto1.put("reportTitle", "${zTable.comment}列表");
        parametersDto1.put("dcr", super.getSessionContainer(request).getUserInfo().getUsername());
        parametersDto1.put("dcsj", BFUtils.getCurrentTime());
        // fieldsList1
        Dto inDto = (BaseDto) super.getSessionAttribute(request, "QUERY${zTable.className?upper_case}4EXPORT_QUERYDTO");
        List fieldsList1 = bfReader.queryForList("${zTable.className}.query${zTable.className}sForManage", inDto);
        parametersDto1.put("countNum", new Integer(fieldsList1.size()));// 合计条数
        
        excelExporter.createSheet(parametersDto1, fieldsList1,"Sheet1" ,"导出结果");
        // 把工作簿中的模板sheet页删除
        excelExporter.removeTemplate("Sheet1");
        excelExporter.removeTemplate("Sheet2");
        excelExporter.removeTemplate("Sheet3");
        // 设置输出excel文件名
        excelExporter.setFilename("${zTable.comment}表_导出.xlsx");
        // 输出excel
        excelExporter.outputWorkbook(request, response);
		
		return mapping.findForward(null);
	}
	
}
