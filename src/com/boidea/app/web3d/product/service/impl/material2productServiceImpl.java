/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.product.service.material2productService;

/**
 * material2product数据访问实现
 * 
 * material2product管理业务接口
 * @author 
 * @since 2016-04-14
 */
public class material2productServiceImpl extends BizServiceImpl implements material2productService{

	/**
	 * 保存material2product
	 */
	public Dto savematerial2productItem(Dto pDto){
		pDto.put("uuid", IDHelper.uuid());
		bfDao.insert("material2product.savematerial2productItem", pDto);
		return null;
	}

	/**
	 * 删除material2product
	 * 
	 * @param pDto
	 */
	public Dto deletematerial2productItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("uuid", arrChecked[i]);
			bfDao.delete("material2product.deletematerial2productItem", dto);
		}
		return null;
	}

	/**
	 * 修改material2product
	 * 
	 * @param pDto
	 */
	public Dto updatematerial2productItem(Dto pDto){
		bfDao.update("material2product.updatematerial2productItem", pDto);
		return null;
	}

}
