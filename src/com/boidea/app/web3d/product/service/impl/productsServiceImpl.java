/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import com.boidea.app.web3d.product.service.productsService;

/**
 * products数据访问实现
 * 
 * products管理业务接口
 * @author 
 * @since 2016-04-14
 */
public class productsServiceImpl extends BizServiceImpl implements productsService{

	/**
	 * 保存products
	 */
	public Dto saveproductsItem(Dto pDto){
		pDto.put("productid", IDHelper.uuid());
		bfDao.insert("products.saveproductsItem", pDto);
		return null;
	}

	/**
	 * 删除products
	 * 
	 * @param pDto
	 */
	public Dto deleteproductsItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("productid", arrChecked[i]);
			bfDao.delete("products.deleteproductsItem", dto);
		}
		return null;
	}

	/**
	 * 修改products
	 * 
	 * @param pDto
	 */
	public Dto updateproductsItem(Dto pDto){
		bfDao.update("products.updateproductsItem", pDto);
		return null;
	}

}
