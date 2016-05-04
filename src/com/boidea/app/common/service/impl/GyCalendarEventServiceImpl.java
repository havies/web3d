/**
 * Boidea's Management Information System Platform
 * CopyRight 2013
 */

package com.boidea.app.common.service.impl;

import com.boidea.app.common.service.GyCalendarEventService;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;


/**
 * 日历事件管理数据访问实现
 * 
 * 日历事件管理管理业务接口
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-10
 */
public class GyCalendarEventServiceImpl extends BizServiceImpl implements GyCalendarEventService{

	/**
	 * 保存日历事件管理
	 */
	public Dto saveGyCalendarEventItem(Dto pDto){
//		pDto.put("EventId", IDHelper.uuid());
		bfDao.insert("GyCalendarEvent.saveGyCalendarEventItem", pDto);
		return null;
	}

	/**
	 * 删除日历事件管理
	 * 
	 * @param pDto
	 */
	public Dto deleteGyCalendarEventItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("EventId", arrChecked[i]);
			bfDao.delete("GyCalendarEvent.deleteGyCalendarEventItem", dto);
		}
		return null;
	}

	/**
	 * 修改日历事件管理
	 * 
	 * @param pDto
	 */
	public Dto updateGyCalendarEventItem(Dto pDto){
		bfDao.update("GyCalendarEvent.updateGyCalendarEventItem", pDto);
		return null;
	}

}
