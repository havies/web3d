/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.housestyle.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.housestyle.service.housestyleService;

/**
 * housestyle数据访问实现
 * 
 * housestyle管理业务接口
 * @author 
 * @since 2016-04-14
 */
public class housestyleServiceImpl extends BizServiceImpl implements housestyleService{

	/**
	 * 保存housestyle
	 */
	public Dto savehousestyleItem(Dto pDto){
		pDto.put("styleid", IDHelper.uuid());
		bfDao.insert("housestyle.savehousestyleItem", pDto);
		return null;
	}

	/**
	 * 删除housestyle
	 * 
	 * @param pDto
	 */
	public Dto deletehousestyleItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("styleid", arrChecked[i]);
			bfDao.delete("housestyle.deletehousestyleItem", dto);
		}
		return null;
	}

	/**
	 * 修改housestyle
	 * 
	 * @param pDto
	 */
	public Dto updatehousestyleItem(Dto pDto){
		bfDao.update("housestyle.updatehousestyleItem", pDto);
		return null;
	}

}
