package com.boidea.framework.core.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.mvc.xstruts.upload.FormFile;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * ActionForm公共类
 * 
 * @author zhaozh
 * @since 2009-09-03
 * @see ActionForm
 */
public class CommonActionForm extends BaseActionForm {

	public void CommonActionForm() {
	}

	/**
	 * 将请求参数封装为Dto
	 * 
	 * @param request
	 * @return
	 */
	public Dto getParamAsDto(HttpServletRequest request) {
		
		//增加列表的自定义查询列的条件组装方法（条件关系为AND）
		//每个默认列表（代码生成）附带有3个默认的查询条件分别如qColumn1 -> qColumn1Text，以此类推。
		//所以要判断这两个参数都不为空的情况下，组装查询语句，给queryParam属性，传到后台执行查询。
		Dto pDto = WebUtils.getParamAsDto(request);
		
		if(BFUtils.isNotEmpty(pDto.getAsString("qColumn1")) && BFUtils.isNotEmpty(pDto.getAsString("qColumn1Text"))) {
			pDto.put(pDto.getAsString("qColumn1"), pDto.getAsString("qColumn1Text"));
		}
		if(BFUtils.isNotEmpty(pDto.getAsString("qColumn2")) && BFUtils.isNotEmpty(pDto.getAsString("qColumn2Text"))) {
			pDto.put(pDto.getAsString("qColumn2"), pDto.getAsString("qColumn2Text"));
		}
		if(BFUtils.isNotEmpty(pDto.getAsString("qColumn3")) && BFUtils.isNotEmpty(pDto.getAsString("qColumn3Text"))) {
			pDto.put(pDto.getAsString("qColumn3"), pDto.getAsString("qColumn3Text"));
		}
		
		//按照列名的多选快速查询条件（条件关系为OR）
		//判断是否有searchColumnParam和searchColumnParamValue属性，如果有，则将searchColumnParam进行拆分成字段，然后放到列参数中
		if(BFUtils.isNotEmpty(pDto.getAsString("searchColumnParam")) && BFUtils.isNotEmpty(pDto.getAsString("searchColumnParamValue"))) {
			String[] searchColumnArr = pDto.getAsString("searchColumnParam").split("\\,");
			for(int i = 0; i < searchColumnArr.length; i++) {
				if(BFUtils.isNotEmpty(searchColumnArr[i]))
					pDto.put("or_"+searchColumnArr[i], pDto.getAsString("searchColumnParamValue"));
			}
		}
		
		return pDto;
	}

	/**
	 * 获取树形节点单击事件传到后台的节点唯一标识号 对应JS节点对象的ID属性,其Key值为:"node"
	 * 
	 * @param request
	 * @return
	 */
	public String getTreeNodeUID4Clicked(HttpServletRequest request) {
		return request.getParameter("node");
	}

	/**
	 * 获取Grid新增和编辑过的脏数据
	 * 
	 * @return
	 */
	public List getGridDirtyData(HttpServletRequest request) {
		List list = new ArrayList();
		String dirtyData = request.getParameter("dirtydata");
		if (BFUtils.isEmpty(dirtyData)) {
			return list;
		}
		dirtyData = dirtyData.substring(1, dirtyData.length() - 1);
		String[] dirtyDatas = dirtyData.split("},");
		for (int i = 0; i < dirtyDatas.length; i++) {
			if (i != dirtyDatas.length - 1) {
				dirtyDatas[i] += "}";
			}
			Dto dto = JsonHelper.parseSingleJson2Dto(dirtyDatas[i]);
			list.add(dto);
		}
		return list;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		super.reset(mapping, request);
	}

	private FormFile theFile;

	private FormFile file1;

	private FormFile file2;

	private FormFile file3;

	private FormFile file4;

	private FormFile file5;
	
	private FormFile swfUploadFile;
	

	public FormFile getTheFile() {
		return theFile;
	}

	public void setTheFile(FormFile theFile) {
		this.theFile = theFile;
	}

	public FormFile getFile1() {
		return file1;
	}

	public void setFile1(FormFile file1) {
		this.file1 = file1;
	}

	public FormFile getFile2() {
		return file2;
	}

	public void setFile2(FormFile file2) {
		this.file2 = file2;
	}

	public FormFile getFile3() {
		return file3;
	}

	public void setFile3(FormFile file3) {
		this.file3 = file3;
	}

	public FormFile getFile4() {
		return file4;
	}

	public void setFile4(FormFile file4) {
		this.file4 = file4;
	}

	public FormFile getFile5() {
		return file5;
	}

	public void setFile5(FormFile file5) {
		this.file5 = file5;
	}

	public FormFile getSwfUploadFile() {
		return swfUploadFile;
	}

	public void setSwfUploadFile(FormFile swfUploadFile) {
		this.swfUploadFile = swfUploadFile;
	}
}
