package com.boidea.framework.system.admin.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.MonitorService;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;

/**
 * 系统监控业务接口
 * 
 * @author zhaozh
 * @since 2010-09-13
 */
public class MonitorServiceImpl extends BizServiceImpl implements MonitorService {

	/**
	 * 保存一个HTTP会话
	 * 
	 * @param userInfo
	 */
	public void saveHttpSession(UserInfoVo userInfo) {
		bfDao.insert("Monitor.saveHttpSession", userInfo);
	}

	/**
	 * 删除一个托管的会话连接
	 * 
	 * @param pSessionID
	 */
	public void deleteHttpSession(Dto dto) {
		bfDao.delete("Monitor.deleteHttpSession", dto);
	}

	/**
	 * 创建一个事件
	 * 
	 * @param inDto
	 */
	public void saveEvent(Dto dto) {
//		String eventid = IDHelper.getEventID();
//		dto.put("eventid", eventid);
		bfDao.insert("Monitor.saveEvent", dto);
	}

	/**
	 * 删除事件
	 * 
	 * @param inDto
	 */
	public Dto deleteEvent(Dto inDto) {
		if (inDto.getAsString("type").equalsIgnoreCase("reset")) {
			bfDao.delete("Monitor.deleteEvent");
		} else {
			String[] checked = inDto.getAsString("strChecked").split(",");
			Dto dto = new BaseDto();
			for (int i = 0; i < checked.length; i++) {
				dto.put("eventid", checked[i]);
				bfDao.delete("Monitor.deleteEvent", dto);
			}
		}
		return null;
	}

	/**
	 * 删除SpringBean监控记录
	 * 
	 * @param inDto
	 */
	public Dto deleteMonitorData(Dto inDto) {
		if (inDto.getAsString("type").equalsIgnoreCase("reset")) {
			bfDao.delete("Monitor.deleteExceptionRecord");
		} else {
			String[] checked = inDto.getAsString("strChecked").split(",");
			Dto dto = new BaseDto();
			for (int i = 0; i < checked.length; i++) {
				dto.put("exceptionid", checked[i]);
				bfDao.delete("Monitor.deleteExceptionRecord", dto);
			}
		}
		return null;
	}
	
	/**
	 * 删除JDBC监控记录
	 * 
	 * @param inDto
	 */
	public Dto deleteJDBCMonitorData(Dto inDto) {
		if (inDto.getAsString("type").equalsIgnoreCase("reset")) {
			bfDao.delete("Monitor.deleteJdbcMonitorData");
		} else {
			String[] checked = inDto.getAsString("strChecked").split(",");
			Dto dto = new BaseDto();
			for (int i = 0; i < checked.length; i++) {
				dto.put("monitorid", checked[i]);
				bfDao.delete("Monitor.deleteJdbcMonitorData", dto);
			}
		}
		return null;
	}

}
