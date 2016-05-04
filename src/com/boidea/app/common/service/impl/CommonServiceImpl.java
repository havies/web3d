/**
 * CopyRight 2013
 */
package com.boidea.app.common.service.impl;


import com.boidea.app.common.service.CommonService;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;

/**
 * 公用基础服务实现
 *
 * @author zhaozehui
 * @since 2013-12-3
 */
public class CommonServiceImpl extends BizServiceImpl implements
		CommonService {
	
	
	/**
	 * 根据用户所属部门ID查询系统部门对象
	 * 用于需要从用户得到部门信息
	 */
	public Dto getDepartmentByUserDeptid(String deptid) {
		return (BaseDto) bfDao.queryForObject("Department.queryDeptinfoByUserDeptid", new BaseDto("deptid",  deptid));
	}

}
