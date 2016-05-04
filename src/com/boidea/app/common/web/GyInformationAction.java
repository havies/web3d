/**
 * Boidea Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.common.web;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.excelutils.ExcelUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.boidea.app.common.service.GyInformationService;
import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.BizController;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * 信息发布管理管理Action
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-09
 * @see BizAction
 */
@Controller
@RequestMapping(value = "/common/gyinformation")
public class GyInformationAction extends BizController{
	
	private GyInformationService gyinformationService = (GyInformationService)super.getService("gyinformationService");
	
	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "init")
	public ModelAndView init(@RequestParam(value="module",required=true) String module, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String menuid = request.getParameter("menuid4Log");
		request.setAttribute("menuid", menuid);
		
		request.setAttribute("rootRoleid", "0");
		request.setAttribute("rootRolename", "角色树");
		request.setAttribute("module", module);
		
		return new ModelAndView("system/admin/mngGyInformation");
	}
	
	
	/**
	 * 查询信息发布管理列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "queryForManage")
	public ModelAndView queryForManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		if("ALL".equals(dto.getAsString("module"))) {
			dto.remove("module");
		}
		//将查询条件保存用于导出
		super.setSessionAttribute(request, "QUERYGYINFORMATION4EXPORT_COND", dto);
		List pageList = bfReader.queryForPage("GyInformation.queryGyInformationsForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("GyInformation.queryGyInformationsCountForManage", dto);
		String jsonString = JsonHelper.encodeList2PageJson(pageList, pageCount, null);
		write(jsonString, response);
		return null;
	}
	
	
	/**
	 * 保存信息发布管理信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "saveItem")
	public ModelAndView saveItem(@RequestParam(value = "attachment1", required = false) MultipartFile attachment, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		
		if(!BFUtils.isEmpty(attachment) && !BFUtils.isEmpty(attachment.getOriginalFilename())) {
			String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
			String attachmentFolder = WebUtils.getCodeDesc("VFS_ROOT_DIR", "VFS_INFOATTACHMENT", request);
			String fname = attachment.getOriginalFilename().substring(0,attachment.getOriginalFilename().indexOf(".")) + "_" + BFUtils.getCurrentTime("yyyyMMddHHmmss") + "." + attachment.getOriginalFilename().substring(attachment.getOriginalFilename().indexOf(".")+1);
			inDto.put("attachment", fname);
			String fPath = vfsroot + File.separator + attachmentFolder + File.separator + fname;
			File fileToCreate = new File(fPath);
			FileOutputStream os = new FileOutputStream(fileToCreate);
			os.write(attachment.getBytes());
			os.flush();
			os.close();
		}
		
		UserInfoVo userInfo = super.getSessionContainer(request).getUserInfo();
		inDto.put("readcount", 0);
		inDto.put("createuser", userInfo.getUsername()+"("+userInfo.getAccount()+")");
		inDto.put("createtime", BFUtils.getCurrentTime());
		inDto.put("updateuser", userInfo.getUsername()+"("+userInfo.getAccount()+")");
		inDto.put("updatetime", BFUtils.getCurrentTime());
		gyinformationService.saveGyInformationItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
		return null;
	}
	
	/**
	 * 删除信息发布管理信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "deleteItems")
	public ModelAndView deleteItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String strChecked = request.getParameter("strChecked");
		Dto inDto = new BaseDto();
		inDto.put("strChecked", strChecked);
		gyinformationService.deleteGyInformationItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
		return null;
	}
	
	/**
	 * 修改信息发布管理信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "updateItem")
	public ModelAndView updateItem(@RequestParam(value = "attachment1", required = false) MultipartFile attachment, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto inDto = getParamAsDto(request);
		
		if(!BFUtils.isEmpty(attachment) && !BFUtils.isEmpty(attachment.getOriginalFilename())) {
			String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
			String attachmentFolder = WebUtils.getCodeDesc("VFS_ROOT_DIR", "VFS_INFOATTACHMENT", request);
			String fname = attachment.getOriginalFilename().substring(0,attachment.getOriginalFilename().indexOf(".")) + "_" + BFUtils.getCurrentTime("yyyyMMddHHmmss") + "." + attachment.getOriginalFilename().substring(attachment.getOriginalFilename().indexOf(".")+1);
			inDto.put("attachment", fname);
			String fPath = vfsroot + File.separator + attachmentFolder + File.separator + fname;
			File fileToCreate = new File(fPath);
			FileOutputStream os = new FileOutputStream(fileToCreate);
			os.write(attachment.getBytes());
			os.flush();
			os.close();
		}
		
		UserInfoVo userInfo = super.getSessionContainer(request).getUserInfo();
		inDto.put("updateuser", userInfo.getUsername()+"("+userInfo.getAccount()+")");
		inDto.put("updatetime", BFUtils.getCurrentTime());
		gyinformationService.updateGyInformationItem(inDto);
		write(new BaseDto(BFConstants.TRUE, "").toJson(), response);
		return null;
	}
	
	/**
	 * 导出信息发布管理列表
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "exportItem")
	public void exportItem(@RequestParam(value="oper",required=false) String oper, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if("subcolumn".equals(oper)) {
            setExportColumn(request, "QUERYGYINFORMATION4EXPORT_COND");
            setOkTipMsg("", response);
        }
        else {
            Dto inDto = (BaseDto) super.getSessionAttribute(request, "QUERYGYINFORMATION4EXPORT_COND");
            inDto.put("start", "0");inDto.put("limit", "65535");
            List<BaseDto> dataList = bfReader.queryForList("GyInformation.queryGyInformationsForManage", inDto);
            ExcelUtils.addValue("columnNames", getExportColumnNames(request, "QUERYGYINFORMATION4EXPORT_COND"));
            ExcelUtils.addValue("columnKeys", getExportColumnKeys(request, "QUERYGYINFORMATION4EXPORT_COND"));
            ExcelUtils.addValue("dataList", dataList);
            String tplpath = "/report/excel/common_export_template.xls";
            response.reset();
            response.addHeader("Content-Type", "application/vnd.ms-excel");
            response.addHeader("Content-Disposition", "attachment;filename=export_"+BFUtils.getCurrentTimeAsNumber()+".xls");
            ExcelUtils.export(request.getSession().getServletContext(), tplpath, response.getOutputStream());
        }
	}
	
	
	/**
	 * 查看信息列表页面初始化
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "viewListInit")
	public ModelAndView viewListInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String menuid = request.getParameter("menuid4Log");
		request.setAttribute("menuid", menuid);
		request.setAttribute("module", "ALL");
		return new ModelAndView("system/admin/mngGyInformationView");
	}
	
	/**
	 * 查看信息列表（有根据指定角色的查看权限过滤）
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "queryForView")
	public ModelAndView queryForView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		if("ALL".equals(dto.getAsString("module"))) {
			dto.remove("module");
		}
		List pageList = bfReader.queryForPage("GyInformation.queryGyInformationsForManage", dto);
		Integer pageCount = (Integer)bfReader.queryForObject("GyInformation.queryGyInformationsCountForManage", dto);
		write(JsonHelper.encodeList2PageJson(pageList, pageCount, null), response);
		return null;
	}
	
	/**
	 * 查看信息
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "view")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Dto dto = getParamAsDto(request);
		Dto infoDto = (BaseDto)bfReader.queryForObject("GyInformation.queryGyInformationsForManage", dto);
		
		request.setAttribute("info", infoDto);
		
		String attachmentFolder = WebUtils.getCodeDesc("VFS_ROOT_DIR", "VFS_INFOATTACHMENT", request);
		request.setAttribute("attachmentFolder", attachmentFolder);
		
		Dto uDto = new BaseDto();
		uDto.put("readcount", infoDto.getAsInteger("readcount")+1);
		uDto.put("informationid", dto.getAsString("informationid"));
		gyinformationService.updateGyInformationItem(uDto);
		return new ModelAndView("system/admin/viewGyInformation");
	}
}
