/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.households.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * households管理业务接口
 * @author 
 * @since 2016-04-14
 */
public interface householdsService extends BizService{

	/**
	 * 保存households
	 */
	public Dto savehouseholdsItem(Dto pDto);

	/**
	 * 删除households
	 * 
	 * @param pDto
	 */
	public Dto deletehouseholdsItem(Dto pDto);

	/**
	 * 修改households
	 * 
	 * @param pDto
	 */
	public Dto updatehouseholdsItem(Dto pDto);
}
