/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.project.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.project.service.projectsService;

/**
 * projects数据访问实现
 * 
 * projects管理业务接口
 * @author 
 * @since 2016-04-14
 */
public class projectsServiceImpl extends BizServiceImpl implements projectsService{

	/**
	 * 保存projects
	 */
	public Dto saveprojectsItem(Dto pDto){
		pDto.put("projectid", IDHelper.uuid());
		bfDao.insert("projects.saveprojectsItem", pDto);
		return null;
	}

	/**
	 * 删除projects
	 * 
	 * @param pDto
	 */
	public Dto deleteprojectsItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("projectid", arrChecked[i]);
			bfDao.delete("projects.deleteprojectsItem", dto);
		}
		return null;
	}

	/**
	 * 修改projects
	 * 
	 * @param pDto
	 */
	public Dto updateprojectsItem(Dto pDto){
		bfDao.update("projects.updateprojectsItem", pDto);
		return null;
	}

}
