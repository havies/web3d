/**
 * CopyRight 2013
 */
package com.boidea.framework.system.admin.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * 数据规则托管及授权的服务接口
 *
 * @author zhaozehui
 * @since 2013-12-2
 */
public interface DataRuleService extends BizService {
	
	/**
	 * 保存数据规则
	 * @param pDto
	 * @return
	 */
	public Dto saveRuleItem(Dto pDto);
	
	/**
	 * 删除数据规则
	 * @param pDto
	 * @return
	 */
	public Dto deleteRuleItems(Dto pDto);
	
	/**
	 * 修改数据规则
	 * @param pDto
	 * @return
	 */
	public Dto updateRuleItem(Dto pDto);
	
	/**
	 * 保存数据规则角色授权信息
	 * @param pDto
	 * @return
	 */
	public Dto saveRuleRoleGrant(Dto pDto);
	
	/**
	 * 保存数据规则用户授权信息
	 * @param pDto
	 * @return
	 */
	public Dto saveRuleUserGrant(Dto pDto);

}
