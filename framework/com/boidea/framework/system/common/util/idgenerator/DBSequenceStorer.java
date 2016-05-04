package com.boidea.framework.system.common.util.idgenerator;

import com.boidea.framework.core.id.SequenceStorer;
import com.boidea.framework.core.id.StoreSequenceException;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.SpringBeanLoader;
import com.boidea.framework.core.model.dao.Dao;

/**
 * ID数据库逻辑存储器
 * @author zhaozh
 * @since 2010-03-21
 */
public class DBSequenceStorer implements SequenceStorer{
	
	private Dao bfDao = (Dao)SpringBeanLoader.getSpringBean("bfDao");
	
	/**
	 * 返回当前最大序列号
	 */
	public long load(String pIdColumnName) throws StoreSequenceException {
		Dto dto = new BaseDto();
		dto.put("fieldname", pIdColumnName);
		dto = (BaseDto)bfDao.queryForObject("IdGenerator.getEaSequenceByFieldName", dto);
		Long maxvalue = dto.getAsLong("maxid");
		return maxvalue.longValue();
	}
	
	/**
	 * 写入当前生成的最大序列号值
	 */
	public void  updateMaxValueByFieldName(long pMaxId, String pIdColumnName) throws StoreSequenceException {
		Dto dto = new BaseDto();
		dto.put("maxid", String.valueOf(pMaxId));
		dto.put("fieldname", pIdColumnName);
		bfDao.update("IdGenerator.updateMaxValueByFieldName", dto);
	}
}
