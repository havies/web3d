/**
 * Management Information System Platform
 * CopyRight 2014
 */

package ${packageName}.web;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.excelutils.ExcelUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.web.BizController;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;
import ${packageName}.service.${zTable.className}Service;

/**
 * ${zTable.comment}管理Action
 * 
 * @author 
 * @since ${todayDate("yyyy-MM-dd")}
 * @see BizAction
 */
@Controller
@RequestMapping(value = "/${subModule}/${zTable.className?lower_case}")
public class ${zTable.className}Action extends BizController{
	
	private ${zTable.className}Service ${zTable.className?lower_case}Service = (${zTable.className}Service)super.getService("${zTable.className?lower_case}Service");
	
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
		return new ModelAndView("app/${subModule}/mng${zTable.className}");
	}
	
	/**
	 * 查询${zTable.comment}列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "queryForManage")
	public ModelAndView queryForManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		//将查询条件保存用于导出
		super.setSessionAttribute(request, "QUERY${zTable.className?upper_case}4EXPORT_COND", dto);
		List pageList = bfReader.queryForPage("${zTable.className}.query${zTable.className}sForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("${zTable.className}.query${zTable.className}sCountForManage", dto);
		String jsonString = JsonHelper.encodeList2PageJson(pageList, pageCount, null);
		write(jsonString, response);
        return null;
	}
	
	/**
	 * 保存${zTable.comment}信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "saveItem")
	public ModelAndView saveItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		${zTable.className?lower_case}Service.save${zTable.className}Item(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 删除${zTable.comment}信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "deleteItems")
	public ModelAndView deleteItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		${zTable.className?lower_case}Service.delete${zTable.className}Item(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 修改${zTable.comment}信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "updateItem")
	public ModelAndView updateItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		${zTable.className?lower_case}Service.update${zTable.className}Item(inDto);
        write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 导出${zTable.comment}列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "exportItem")
	public void exportItem(@RequestParam(value="oper",required=false) String oper, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if("subcolumn".equals(oper)) {
            setExportColumn(request, "QUERY${zTable.className?upper_case}4EXPORT_COND");
            setOkTipMsg("", response);
        }
        else {
            Dto inDto = (BaseDto) super.getSessionAttribute(request, "QUERY${zTable.className?upper_case}4EXPORT_COND");
            inDto.put("start", "0");inDto.put("limit", "65535");
            List<BaseDto> dataList = bfReader.queryForList("${zTable.className}.query${zTable.className}sForManage", inDto);
            ExcelUtils.addValue("columnNames", getExportColumnNames(request, "QUERY${zTable.className?upper_case}4EXPORT_COND"));
            ExcelUtils.addValue("columnKeys", getExportColumnKeys(request, "QUERY${zTable.className?upper_case}4EXPORT_COND"));
            ExcelUtils.addValue("dataList", dataList);
            String tplpath = "/report/excel/common_export_template.xls";
            response.reset();
            response.addHeader("Content-Type", "application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment;filename=export_"+BFUtils.getCurrentTimeAsNumber()+".xls");
            ExcelUtils.export(request.getSession().getServletContext(), tplpath, response.getOutputStream());
        }
	}
	
}
