/**
 * Boidea's Management Information System Platform
 * CopyRight 2013
 */

package com.boidea.app.common.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * 信息发布管理管理业务接口
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-09
 */
public interface GyInformationService extends BizService{

	/**
	 * 保存信息发布管理
	 */
	public Dto saveGyInformationItem(Dto pDto);

	/**
	 * 删除信息发布管理
	 * 
	 * @param pDto
	 */
	public Dto deleteGyInformationItem(Dto pDto);

	/**
	 * 修改信息发布管理
	 * 
	 * @param pDto
	 */
	public Dto updateGyInformationItem(Dto pDto);
}
