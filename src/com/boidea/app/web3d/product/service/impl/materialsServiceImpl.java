/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.product.service.materialsService;

/**
 * materials数据访问实现
 * 
 * materials管理业务接口
 * @author 
 * @since 2016-04-14
 */
public class materialsServiceImpl extends BizServiceImpl implements materialsService{

	/**
	 * 保存materials
	 */
	public Dto savematerialsItem(Dto pDto){
		pDto.put("materialid", IDHelper.uuid());
		bfDao.insert("materials.savematerialsItem", pDto);
		return null;
	}

	/**
	 * 删除materials
	 * 
	 * @param pDto
	 */
	public Dto deletematerialsItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("materialid", arrChecked[i]);
			bfDao.delete("materials.deletematerialsItem", dto);
		}
		return null;
	}

	/**
	 * 修改materials
	 * 
	 * @param pDto
	 */
	public Dto updatematerialsItem(Dto pDto){
		bfDao.update("materials.updatematerialsItem", pDto);
		return null;
	}

}
