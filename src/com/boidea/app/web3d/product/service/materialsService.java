/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * materials管理业务接口
 * @author 
 * @since 2016-04-14
 */
public interface materialsService extends BizService{

	/**
	 * 保存materials
	 */
	public Dto savematerialsItem(Dto pDto);

	/**
	 * 删除materials
	 * 
	 * @param pDto
	 */
	public Dto deletematerialsItem(Dto pDto);

	/**
	 * 修改materials
	 * 
	 * @param pDto
	 */
	public Dto updatematerialsItem(Dto pDto);
}
