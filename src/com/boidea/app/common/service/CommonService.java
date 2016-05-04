/**
 * CopyRight 2013
 */
package com.boidea.app.common.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * 系统公用基础服务接口 
 *
 * @author zhaozehui
 * @since 2013-12-3
 */
public interface CommonService extends BizService {
	
	/**
	 * 根据用户所属部门ID查询系统部门对象
	 * 用于需要从用户得到部门信息
	 */
	public Dto getDepartmentByUserDeptid(String deptid);


}
