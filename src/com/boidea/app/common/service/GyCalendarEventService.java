/**
 * Boidea's Management Information System Platform
 * CopyRight 2013
 */

package com.boidea.app.common.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * 日历事件管理管理业务接口
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-10
 */
public interface GyCalendarEventService extends BizService{

	/**
	 * 保存日历事件管理
	 */
	public Dto saveGyCalendarEventItem(Dto pDto);

	/**
	 * 删除日历事件管理
	 * 
	 * @param pDto
	 */
	public Dto deleteGyCalendarEventItem(Dto pDto);

	/**
	 * 修改日历事件管理
	 * 
	 * @param pDto
	 */
	public Dto updateGyCalendarEventItem(Dto pDto);
}
