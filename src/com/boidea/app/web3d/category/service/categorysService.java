/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.category.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * categorys管理业务接口
 * @author 
 * @since 2016-04-13
 */
public interface categorysService extends BizService{

	/**
	 * 保存categorys
	 */
	public Dto savecategorysItem(Dto pDto);

	/**
	 * 删除categorys
	 * 
	 * @param pDto
	 */
	public Dto deletecategorysItem(Dto pDto);

	/**
	 * 修改categorys
	 * 
	 * @param pDto
	 */
	public Dto updatecategorysItem(Dto pDto);
}
