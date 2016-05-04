/**
 * CopyRight 2014
 */
package com.boidea.app.common.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.vfs2.FileName;
import org.apache.commons.vfs2.FileObject;
import org.apache.tools.ant.util.StringUtils;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionForward;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.mvc.xstruts.upload.FormFile;
import com.boidea.framework.core.web.BizAction;
import com.boidea.framework.core.web.CommonActionForm;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.VFSFileUtils;
import com.boidea.framework.util.WebUtils;

/**
 * VFS文件管理
 *
 * @author zhaozehui
 * @since 2014-1-19
 */
public class VFSFileAction extends BizAction {

	/**
	 * 页面初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		
		if(BFUtils.isEmpty(vfsroot)) {
			write("没有设置VFS_ROOT_DIR", response);
			return mapping.findForward(null);
		}
		
		if(VFSFileUtils.getFile(vfsroot).exists()) {
			//生成系统配置的一些默认VFS目录
			List vfsList = WebUtils.getCodeListByField("VFS_ROOT_DIR", request);
			
//			List vfsList = bfReader.queryForList("GyParam.queryGyParamsForManage", new BaseDto("fatherkey", "VFS_ROOT_DIR"));
			for(int i = 0; i < vfsList.size(); i++) {
				String vfsFolderPath = vfsroot + "/" + ((BaseDto)vfsList.get(i)).getAsString("codedesc");
				if(!VFSFileUtils.getFile(vfsFolderPath).exists()) {
					VFSFileUtils.getFile(vfsFolderPath).createFolder();
				}
			}
			
			String subVFS = request.getParameter("vfs");
			if(BFUtils.isNotEmpty(subVFS)) {
				String subVfsDesc = WebUtils.getCodeDesc("VFS_ROOT_DIR", subVFS, request);
				request.setAttribute("vfsroot", "/" + subVfsDesc);
				request.setAttribute("vfsroot_name", subVfsDesc);
			}
			else {
				request.setAttribute("vfsroot", "/");
				request.setAttribute("vfsroot_name", "文件根");
			}
		}
		else {
			request.setAttribute("vfsroot", BFConstants.NOT_EXISTS_ID);
			request.setAttribute("vfsroot_name", "根文件夹不存在,请配置VFS_ROOT_DIR");
		}
		request.setAttribute("maxUploadFileSize", super.getParamValue("MAX_UPLOAD_FILE_SIZE", request));
		return mapping.findForward("manageVFSFileView");
	}
	
	
	/**
	 * VFS文件夹树初始化
	 * 
	 * @param
	 * @return
	 */
	public ActionForward fileFolderTreeInit(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Dto dto = new BaseDto();
		
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		
		String ffolder = vfsroot + request.getParameter("node");
		List folderList = new ArrayList();
		
		if(!BFConstants.NOT_EXISTS_ID.equals(ffolder)) {
			FileObject fFile = VFSFileUtils.getFile(ffolder);
			
			FileObject[] cFiles = fFile.getChildren();
			for(int i = 0; i < cFiles.length; i++) {
				FileName fn = cFiles[i].getName();
				if(VFSFileUtils.isDirectory(fn.getURI())) {
					BaseDto folderDto = new BaseDto();
					folderDto.put("id", StringUtils.replace(fn.getURI(), "file://"+vfsroot, ""));
					folderDto.put("text", fn.getBaseName());
					folderDto.put("leaf", new Boolean(false));
					folderDto.put("expanded", new Boolean(true));
					folderList.add(folderDto);
				}
			}
			
			Dto outDto = new BaseDto();
			outDto.put("jsonString", JsonHelper.encodeObject2Json(folderList));
			
			write(outDto.getAsString("jsonString"), response);
		}
		return mapping.findForward(null);
	}
	
	/**
	 * 查询文件列表
	 * 
	 * @param
	 * @return
	 */
	public ActionForward queryFilesForManage(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto dto = aForm.getParamAsDto(request);
		
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		String folderid = vfsroot + dto.getAsString("folderid");
		FileObject fFile = VFSFileUtils.getFile(folderid);
		List vfsFileList = new ArrayList();
		
		FileObject[] cFiles = fFile.getChildren();
		List allvfsFileList = new ArrayList();
		for(int i = 0; i < cFiles.length; i++) {
			String fUri = cFiles[i].getName().getURI();
			if(!VFSFileUtils.isDirectory(fUri)) {
				allvfsFileList.add(cFiles[i]);
			}
		}
		
		//翻页
		int pageSize = dto.getAsInteger("start")+dto.getAsInteger("limit");
		for(int i = dto.getAsInteger("start"); i < pageSize; i++) {
			if(i < allvfsFileList.size()) {
				FileObject cFile = (FileObject)allvfsFileList.get(i);
				String fUri = cFile.getName().getURI();
				if(!VFSFileUtils.isDirectory(fUri)) {
					String fName = cFile.getName().getBaseName();
					String queryParam = dto.getAsString("queryParam");
					BaseDto folderDto = new BaseDto();
					folderDto.put("vfsfilename", fName);
					folderDto.put("vfsfiletype", cFile.getName().getExtension());
					folderDto.put("vfsfilesize", cFile.getContent().getSize()/1024+"KB");
					folderDto.put("vfsfilepath", fUri.replaceAll("file://" + vfsroot, ""));
					folderDto.put("filecreatetime", BFUtils.Date2String(new Date(cFiles[i].getContent().getLastModifiedTime()), "yyyy-MM-dd HH:mm:ss"));
					if(BFUtils.isEmpty(queryParam)) {
						vfsFileList.add(folderDto);
					}
					else {
						if(fName.toLowerCase().indexOf(queryParam.toLowerCase()) != -1) {
							vfsFileList.add(folderDto);
						}
					}
				}
			}
		}
		
		String jsonString = JsonHelper.encodeList2PageJson(vfsFileList, allvfsFileList.size(), null);
		write(jsonString, response);
		return mapping.findForward(null);
	}
	
	/**
	 * 保存文件夹信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward saveFolderItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		
		String folderName = inDto.getAsString("foldername");
		String parentFolderId = vfsroot + inDto.getAsString("parentfolderid");
		
		VFSFileUtils.mkdirs(parentFolderId+"/"+folderName);
		
		setOkTipMsg("文件夹新增成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 删除文件夹信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward deleteFolderItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		String pFolderid = vfsroot + inDto.getAsString("pFolderid");
		String strChecked = inDto.getAsString("strChecked");
		
		if(BFUtils.isEmpty(strChecked)) {//文件夹
			VFSFileUtils.delete(pFolderid);
		}
		else {//文件
			String[] arrChecked = strChecked.split(",");
			for(int i = 0; i < arrChecked.length; i++){
				String delFilePath = vfsroot + "/" + arrChecked[i];
				VFSFileUtils.delete(delFilePath);
			}
		}
		
		setOkTipMsg("文件夹删除成功", response);
		return mapping.findForward(null);
	}
	
	/**
	 * 修改文件夹信息
	 * 
	 * @param
	 * @return
	 */
	public ActionForward updateFolderItem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		String folderName = inDto.getAsString("foldername");
		String parentFolderId = vfsroot + inDto.getAsString("parentfolderid");
		String folderNameOld = inDto.getAsString("foldername_old");
		String parentFolderIdOld = vfsroot + inDto.getAsString("parentfolderid_old");
		
		VFSFileUtils.moveFile(parentFolderId+"/"+folderNameOld, parentFolderId+"/"+folderName, false);
		
		Dto outDto = new BaseDto();
		outDto.put("success", new Boolean(true));
		outDto.put("msg", "文件夹修改成功!");
		write(outDto.toJson(), response);
		return mapping.findForward(null);
	}
	
	/**
	 * 下载文件
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward downloadFile(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);

		// 这里可稍做优化,根据文件类型动态设置此属性
		// response.setContentType("application/vnd.ms-excel");
		
		String fileName = URLDecoder.decode(inDto.getAsString("fname"), "UTF-8");
		String vfsFilePath = URLDecoder.decode(inDto.getAsString("fpath"), "UTF-8");
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		
		fileName = BFUtils.encodeChineseDownloadFileName(request, fileName);
		
		response.addHeader("Content-Type", "application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
		String path = vfsroot + vfsFilePath;
		
		BufferedInputStream in = new BufferedInputStream(VFSFileUtils.getInputStream(path));
		ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
		byte[] temp = new byte[1024];
		int size = 0;
		while ((size = in.read(temp)) != -1) {
			out.write(temp, 0, size);
		}
		in.close();
		ServletOutputStream os = response.getOutputStream();
		os.write(out.toByteArray());
		os.flush();
		os.close();
		return mapping.findForward(null);
	}
	
	/**
	 * Flash组件文件上传 如果是批量则客户端的SWF会循环来调用这个方法
	 * 
	 * @param
	 * @return
	 */
	public ActionForward doUploadFlash(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm cForm = (CommonActionForm) form;
		Dto inDto = cForm.getParamAsDto(request);
		FormFile myFile = cForm.getSwfUploadFile();
		
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		String selectedFolderId = URLDecoder.decode(inDto.getAsString("folderid"), "UTF-8");
		
		String filePath = vfsroot + selectedFolderId+"/"+myFile.getFileName();
		FileObject newFile = VFSFileUtils.getFile(filePath);
		if(newFile.exists()) {
			//覆盖
			VFSFileUtils.moveFile(filePath, filePath+".bak", true);
		}
		File fileToCreate = new File(filePath);
		FileOutputStream os = new FileOutputStream(fileToCreate);
		os.write(myFile.getFileData());
		os.flush();
		os.close();

		setOkTipMsg("文件上传成功", response);
		return mapping.findForward(null);
	}

	/**
	 * 查看图片文件
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward viewPicFile(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommonActionForm aForm = (CommonActionForm) form;
		Dto inDto = aForm.getParamAsDto(request);

		
		String fileName = URLDecoder.decode(inDto.getAsString("fname"), "UTF-8");
		String vfsFilePath = URLDecoder.decode(inDto.getAsString("fpath"), "UTF-8");
		String vfsroot = super.getParamValue("VFS_ROOT_DIR", request);
		String vfsfiletype = URLDecoder.decode(inDto.getAsString("ftype"), "UTF-8");
		
		fileName = BFUtils.encodeChineseDownloadFileName(request, fileName);
		response.setHeader("Content-Disposition", "inline;filename=" + fileName + ";");
		response.setHeader("Content-Type", "image/"+vfsfiletype);
		String path = vfsroot + vfsFilePath;
		BufferedInputStream in = new BufferedInputStream(VFSFileUtils.getInputStream(path));
		ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
		byte[] temp = new byte[1024];
		int size = 0;
		while ((size = in.read(temp)) != -1) {
			out.write(temp, 0, size);
		}
		in.close();
		ServletOutputStream os = response.getOutputStream();
		os.write(out.toByteArray());
		os.flush();
		os.close();
		return mapping.findForward(null);
	}
	
	

}
