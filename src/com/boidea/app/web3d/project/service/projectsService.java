/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.project.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * projects管理业务接口
 * @author 
 * @since 2016-04-14
 */
public interface projectsService extends BizService{

	/**
	 * 保存projects
	 */
	public Dto saveprojectsItem(Dto pDto);

	/**
	 * 删除projects
	 * 
	 * @param pDto
	 */
	public Dto deleteprojectsItem(Dto pDto);

	/**
	 * 修改projects
	 * 
	 * @param pDto
	 */
	public Dto updateprojectsItem(Dto pDto);
}
