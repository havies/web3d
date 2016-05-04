package com.boidea.framework.core.model.service.impl;

import com.boidea.framework.core.model.dao.Dao;
import com.boidea.framework.core.model.service.BizService;
import com.boidea.framework.core.properties.PropertiesFactory;
import com.boidea.framework.core.properties.PropertiesFile;
import com.boidea.framework.core.properties.PropertiesHelper;

/**
 * 业务模型实现基类<br>
 * 
 * @author zhaozh
 * @since 2009-07-21
 */
public class BizServiceImpl implements BizService {

	/**
	 * 基类中给子类暴露的一个DAO接口<br>
	 * 连接平台数据库
	 */
	protected Dao bfDao;

	protected static PropertiesHelper bfPHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.BF);
	
	protected static PropertiesHelper appPHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.APP);
    
	public void setBfDao(Dao bfDao) {
		this.bfDao = bfDao;
	}
}
