package com.boidea.framework.system.admin.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;

/**
 * 系统监控业务接口
 * @author zhaozh
 * @since 2010-05-13
 */
public interface MonitorService extends BizService{
	
	/**
	 * 保存一个HTTP会话
	 * @param userInfo
	 */
	public void saveHttpSession(UserInfoVo userInfo);
	
	/**
	 * 删除一个托管的会话连接
	 * @param pSessionID
	 */
	public void deleteHttpSession(Dto dto);
	
	/**
	 * 创建一个事件
	 * @param inDto
	 */
	public void saveEvent(Dto dto);
	
	/**
	 * 删除事件
	 * @param inDto
	 */
	public Dto deleteEvent(Dto inDto);

	/**
	 * 删除SpringBean监控记录
	 * 
	 * @param inDto
	 */
	public Dto deleteMonitorData(Dto inDto);
	
	/**
	 * 删除JDBC监控记录
	 * 
	 * @param inDto
	 */
	public Dto deleteJDBCMonitorData(Dto inDto);
}
