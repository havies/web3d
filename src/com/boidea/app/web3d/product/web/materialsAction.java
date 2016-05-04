/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.web;

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
import com.boidea.app.web3d.product.service.materialsService;

/**
 * materials管理Action
 * 
 * @author 
 * @since 2016-04-14
 * @see BizAction
 */
@Controller
@RequestMapping(value = "/product/materials")
public class materialsAction extends BizController{
	
	private materialsService materialsService = (materialsService)super.getService("materialsService");
	
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
		return new ModelAndView("app/product/mngmaterials");
	}
	
	/**
	 * 查询materials列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "queryForManage")
	public ModelAndView queryForManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		//将查询条件保存用于导出
		super.setSessionAttribute(request, "QUERYMATERIALS4EXPORT_COND", dto);
		List pageList = bfReader.queryForPage("materials.querymaterialssForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("materials.querymaterialssCountForManage", dto);
		String jsonString = JsonHelper.encodeList2PageJson(pageList, pageCount, null);
		write(jsonString, response);
        return null;
	}
	
	/**
	 * 保存materials信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "saveItem")
	public ModelAndView saveItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		materialsService.savematerialsItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 删除materials信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "deleteItems")
	public ModelAndView deleteItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		materialsService.deletematerialsItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 修改materials信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "updateItem")
	public ModelAndView updateItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		materialsService.updatematerialsItem(inDto);
        write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 导出materials列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "exportItem")
	public void exportItem(@RequestParam(value="oper",required=false) String oper, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if("subcolumn".equals(oper)) {
            setExportColumn(request, "QUERYMATERIALS4EXPORT_COND");
            setOkTipMsg("", response);
        }
        else {
            Dto inDto = (BaseDto) super.getSessionAttribute(request, "QUERYMATERIALS4EXPORT_COND");
            inDto.put("start", "0");inDto.put("limit", "65535");
            List<BaseDto> dataList = bfReader.queryForList("materials.querymaterialssForManage", inDto);
            ExcelUtils.addValue("columnNames", getExportColumnNames(request, "QUERYMATERIALS4EXPORT_COND"));
            ExcelUtils.addValue("columnKeys", getExportColumnKeys(request, "QUERYMATERIALS4EXPORT_COND"));
            ExcelUtils.addValue("dataList", dataList);
            String tplpath = "/report/excel/common_export_template.xls";
            response.reset();
            response.addHeader("Content-Type", "application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment;filename=export_"+BFUtils.getCurrentTimeAsNumber()+".xls");
            ExcelUtils.export(request.getSession().getServletContext(), tplpath, response.getOutputStream());
        }
	}
	
}
