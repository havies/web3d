/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.households.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.households.service.householdsService;

/**
 * households数据访问实现
 * 
 * households管理业务接口
 * @author 
 * @since 2016-04-14
 */
public class householdsServiceImpl extends BizServiceImpl implements householdsService{

	/**
	 * 保存households
	 */
	public Dto savehouseholdsItem(Dto pDto){
		pDto.put("houseid", IDHelper.uuid());
		bfDao.insert("households.savehouseholdsItem", pDto);
		return null;
	}

	/**
	 * 删除households
	 * 
	 * @param pDto
	 */
	public Dto deletehouseholdsItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("houseid", arrChecked[i]);
			bfDao.delete("households.deletehouseholdsItem", dto);
		}
		return null;
	}

	/**
	 * 修改households
	 * 
	 * @param pDto
	 */
	public Dto updatehouseholdsItem(Dto pDto){
		bfDao.update("households.updatehouseholdsItem", pDto);
		return null;
	}

}
