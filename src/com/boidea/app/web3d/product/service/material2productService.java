/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * material2product管理业务接口
 * @author 
 * @since 2016-04-14
 */
public interface material2productService extends BizService{

	/**
	 * 保存material2product
	 */
	public Dto savematerial2productItem(Dto pDto);

	/**
	 * 删除material2product
	 * 
	 * @param pDto
	 */
	public Dto deletematerial2productItem(Dto pDto);

	/**
	 * 修改material2product
	 * 
	 * @param pDto
	 */
	public Dto updatematerial2productItem(Dto pDto);
}
