/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * products管理业务接口
 * @author 
 * @since 2016-04-14
 */
public interface productsService extends BizService{

	/**
	 * 保存products
	 */
	public Dto saveproductsItem(Dto pDto);

	/**
	 * 删除products
	 * 
	 * @param pDto
	 */
	public Dto deleteproductsItem(Dto pDto);

	/**
	 * 修改products
	 * 
	 * @param pDto
	 */
	public Dto updateproductsItem(Dto pDto);
}
