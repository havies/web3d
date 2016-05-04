/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.category.web;

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
import com.boidea.app.web3d.category.service.categorysService;

/**
 * categorys管理Action
 * 
 * @author 
 * @since 2016-04-13
 * @see BizAction
 */
@Controller
@RequestMapping(value = "/category/categorys")
public class categorysAction extends BizController{
	
	private categorysService categorysService = (categorysService)super.getService("categorysService");
	
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
		
		String sessionId=request.getSession().getId();
		System.out.println(sessionId);
		//log.info(sessionId);
		return new ModelAndView("app/category/mngcategorys");
	}
	
	/**
	 * 查询categorys列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "queryForManage")
	public ModelAndView queryForManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		//将查询条件保存用于导出
		super.setSessionAttribute(request, "QUERYCATEGORYS4EXPORT_COND", dto);
		List pageList = bfReader.queryForPage("categorys.querycategoryssForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("categorys.querycategoryssCountForManage", dto);
		String jsonString = JsonHelper.encodeList2PageJson(pageList, pageCount, null);
		write(jsonString, response);
        return null;
	}
	
	/**
	 * 保存categorys信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "saveItem")
	public ModelAndView saveItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		categorysService.savecategorysItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 删除categorys信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "deleteItems")
	public ModelAndView deleteItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		categorysService.deletecategorysItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 修改categorys信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "updateItem")
	public ModelAndView updateItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		categorysService.updatecategorysItem(inDto);
        write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 导出categorys列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "exportItem")
	public void exportItem(@RequestParam(value="oper",required=false) String oper, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if("subcolumn".equals(oper)) {
            setExportColumn(request, "QUERYCATEGORYS4EXPORT_COND");
            setOkTipMsg("", response);
        }
        else {
            Dto inDto = (BaseDto) super.getSessionAttribute(request, "QUERYCATEGORYS4EXPORT_COND");
            inDto.put("start", "0");inDto.put("limit", "65535");
            List<BaseDto> dataList = bfReader.queryForList("categorys.querycategoryssForManage", inDto);
            ExcelUtils.addValue("columnNames", getExportColumnNames(request, "QUERYCATEGORYS4EXPORT_COND"));
            ExcelUtils.addValue("columnKeys", getExportColumnKeys(request, "QUERYCATEGORYS4EXPORT_COND"));
            ExcelUtils.addValue("dataList", dataList);
            String tplpath = "/report/excel/common_export_template.xls";
            response.reset();
            response.addHeader("Content-Type", "application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment;filename=export_"+BFUtils.getCurrentTimeAsNumber()+".xls");
            ExcelUtils.export(request.getSession().getServletContext(), tplpath, response.getOutputStream());
        }
	}
	
}
