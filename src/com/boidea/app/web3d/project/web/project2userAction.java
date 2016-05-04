/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.project.web;

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
import com.boidea.app.web3d.project.service.project2userService;

/**
 * project2user管理Action
 * 
 * @author 
 * @since 2016-04-14
 * @see BizAction
 */
@Controller
@RequestMapping(value = "/project/project2user")
public class project2userAction extends BizController{
	
	private project2userService project2userService = (project2userService)super.getService("project2userService");
	
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
		return new ModelAndView("app/project/mngproject2user");
	}
	
	/**
	 * 查询project2user列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "queryForManage")
	public ModelAndView queryForManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		//将查询条件保存用于导出
		super.setSessionAttribute(request, "QUERYPROJECT2USER4EXPORT_COND", dto);
		List pageList = bfReader.queryForPage("project2user.queryproject2usersForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("project2user.queryproject2usersCountForManage", dto);
		String jsonString = JsonHelper.encodeList2PageJson(pageList, pageCount, null);
		write(jsonString, response);
        return null;
	}
	
	/**
	 * 保存project2user信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "saveItem")
	public ModelAndView saveItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		project2userService.saveproject2userItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 删除project2user信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "deleteItems")
	public ModelAndView deleteItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		project2userService.deleteproject2userItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 修改project2user信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "updateItem")
	public ModelAndView updateItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		project2userService.updateproject2userItem(inDto);
        write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
        return null;
	}
	
	/**
	 * 导出project2user列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "exportItem")
	public void exportItem(@RequestParam(value="oper",required=false) String oper, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if("subcolumn".equals(oper)) {
            setExportColumn(request, "QUERYPROJECT2USER4EXPORT_COND");
            setOkTipMsg("", response);
        }
        else {
            Dto inDto = (BaseDto) super.getSessionAttribute(request, "QUERYPROJECT2USER4EXPORT_COND");
            inDto.put("start", "0");inDto.put("limit", "65535");
            List<BaseDto> dataList = bfReader.queryForList("project2user.queryproject2usersForManage", inDto);
            ExcelUtils.addValue("columnNames", getExportColumnNames(request, "QUERYPROJECT2USER4EXPORT_COND"));
            ExcelUtils.addValue("columnKeys", getExportColumnKeys(request, "QUERYPROJECT2USER4EXPORT_COND"));
            ExcelUtils.addValue("dataList", dataList);
            String tplpath = "/report/excel/common_export_template.xls";
            response.reset();
            response.addHeader("Content-Type", "application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment;filename=export_"+BFUtils.getCurrentTimeAsNumber()+".xls");
            ExcelUtils.export(request.getSession().getServletContext(), tplpath, response.getOutputStream());
        }
	}
	
}
