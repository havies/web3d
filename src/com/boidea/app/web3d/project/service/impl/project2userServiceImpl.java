/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.project.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.project.service.project2userService;

/**
 * project2user数据访问实现
 * 
 * project2user管理业务接口
 * @author 
 * @since 2016-04-14
 */
public class project2userServiceImpl extends BizServiceImpl implements project2userService{

	/**
	 * 保存project2user
	 */
	public Dto saveproject2userItem(Dto pDto){
		pDto.put("uuid", IDHelper.uuid());
		bfDao.insert("project2user.saveproject2userItem", pDto);
		return null;
	}

	/**
	 * 删除project2user
	 * 
	 * @param pDto
	 */
	public Dto deleteproject2userItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("uuid", arrChecked[i]);
			bfDao.delete("project2user.deleteproject2userItem", dto);
		}
		return null;
	}

	/**
	 * 修改project2user
	 * 
	 * @param pDto
	 */
	public Dto updateproject2userItem(Dto pDto){
		bfDao.update("project2user.updateproject2userItem", pDto);
		return null;
	}

}
