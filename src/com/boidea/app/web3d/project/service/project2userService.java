/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.project.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * project2user管理业务接口
 * @author 
 * @since 2016-04-14
 */
public interface project2userService extends BizService{

	/**
	 * 保存project2user
	 */
	public Dto saveproject2userItem(Dto pDto);

	/**
	 * 删除project2user
	 * 
	 * @param pDto
	 */
	public Dto deleteproject2userItem(Dto pDto);

	/**
	 * 修改project2user
	 * 
	 * @param pDto
	 */
	public Dto updateproject2userItem(Dto pDto);
}
