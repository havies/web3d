/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.category.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.category.service.categorysService;

/**
 * categorys数据访问实现
 * 
 * categorys管理业务接口
 * @author 
 * @since 2016-04-13
 */
public class categorysServiceImpl extends BizServiceImpl implements categorysService{

	/**
	 * 保存categorys
	 */
	public Dto savecategorysItem(Dto pDto){
		pDto.put("categoryid", IDHelper.uuid());
		bfDao.insert("categorys.savecategorysItem", pDto);
		return null;
	}

	/**
	 * 删除categorys
	 * 
	 * @param pDto
	 */
	public Dto deletecategorysItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("categoryid", arrChecked[i]);
			bfDao.delete("categorys.deletecategorysItem", dto);
		}
		return null;
	}

	/**
	 * 修改categorys
	 * 
	 * @param pDto
	 */
	public Dto updatecategorysItem(Dto pDto){
		bfDao.update("categorys.updatecategorysItem", pDto);
		return null;
	}

}
