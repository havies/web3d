/**
 * CopyRight 2014
 */
package com.boidea.framework.core.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.util.BFUtils;
import com.boidea.framework.util.WebUtils;

/**
 * 转换成spring mvc的过渡类，后续不再集成BizAction
 *
 * @author zhaozehui
 * @since 2014-5-19
 */
public class BizController extends BizAction {

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


}
