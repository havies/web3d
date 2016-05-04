package com.boidea.framework.system.admin.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.ParamService;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;

/**
 * 全局参数数据访问实现
 * 
 * @author zhaozh
 * @since 2010-05-13
 * @see BizServiceImpl
 */
public class ParamServiceImpl extends BizServiceImpl implements ParamService{

	/**
	 * 保存参数信息表
	 */
	public Dto saveParamItem(Dto pDto){
		pDto.put("paramid", IDHelper.getParamID());
		bfDao.insert("Param.saveParamItem", pDto);
		return null;
	}

	/**
	 * 删除参数信息
	 * 
	 * @param pDto
	 */
	public Dto deleteParamItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("paramid", arrChecked[i]);
			bfDao.delete("Param.deletParamItem", dto);
		}
		return null;
	}

	/**
	 * 修改参数信息
	 * 
	 * @param pDto
	 */
	public Dto updateParamItem(Dto pDto){
		bfDao.update("Param.updateParamItem", pDto);
		return null;
	}

}
