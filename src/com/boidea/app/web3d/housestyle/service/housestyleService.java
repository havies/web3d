/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.housestyle.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * housestyle管理业务接口
 * @author 
 * @since 2016-04-14
 */
public interface housestyleService extends BizService{

	/**
	 * 保存housestyle
	 */
	public Dto savehousestyleItem(Dto pDto);

	/**
	 * 删除housestyle
	 * 
	 * @param pDto
	 */
	public Dto deletehousestyleItem(Dto pDto);

	/**
	 * 修改housestyle
	 * 
	 * @param pDto
	 */
	public Dto updatehousestyleItem(Dto pDto);
}
