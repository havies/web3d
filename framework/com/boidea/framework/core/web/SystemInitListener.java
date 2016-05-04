package com.boidea.framework.core.web;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;

import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.SpringBeanLoader;
import com.boidea.framework.core.model.dao.Dao;
import com.boidea.framework.core.model.dao.Reader;
import com.boidea.framework.core.properties.PropertiesFactory;
import com.boidea.framework.core.properties.PropertiesFile;
import com.boidea.framework.core.properties.PropertiesHelper;
import com.boidea.framework.system.admin.service.MonitorService;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;

/**
 * 系统启动监听器
 * 
 * @author zhaozh
 * @since 2010-04-13
 */
public class SystemInitListener implements ServletContextListener {
	private static Log log = LogFactory.getLog(SystemInitListener.class);
	private boolean success = true;
	private ApplicationContext wac = null;

	public void contextDestroyed(ServletContextEvent sce) {

	}

	public void contextInitialized(ServletContextEvent sce) {
		systemStartup(sce.getServletContext());
	}

	/**
	 * 应用平台启动
	 */
	private void systemStartup(ServletContext servletContext) {
		PropertiesHelper pHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.BF);
		String forceLoad = pHelper.getValue("forceLoad", SystemConstants.FORCELOAD_N);
		long start = System.currentTimeMillis();
//		if (forceLoad.equalsIgnoreCase(SystemConstants.FORCELOAD_N)) {
			//log.info("*******************************************************");
			//log.info("系统平台开始启动...");
			//log.info("*******************************************************");
//		}
		try {
			wac = SpringBeanLoader.instance(servletContext).getApplicationContext();
		} catch (Exception e) {
			success = false;
			e.printStackTrace();
		}
		if (success) {
			MonitorService monitorService = (MonitorService) SpringBeanLoader.getSpringBean("monitorService");
			monitorService.deleteHttpSession(new BaseDto());
			try {
				initDbType();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (success) {
			//log.info("系统开始启动字典装载程序...");
			//log.info("开始加载字典...");
			Reader bfReader = (Reader) SpringBeanLoader.getSpringBean("bfReader");
			List codeList = null;
			try {
				codeList = bfReader.queryForList("Resource.getCodeViewList");
				//log.info("字典加载成功!");
			} catch (Exception e) {
				success = false;
				log.error("字典加载失败!");
				e.printStackTrace();
			}
			servletContext.setAttribute("EACODELIST", codeList);
		}
		if (success) {
			//log.info("系统开始启动全局参数表装载程序...");
			//log.info("开始加载全局参数表...");
			List paramList = null;
			try {
				Reader bfReader = (Reader) SpringBeanLoader.getSpringBean("bfReader");
				paramList = bfReader.queryForList("Resource.getParamList");
				//log.info("全局参数表加载成功!");
			} catch (Exception e) {
				success = false;
				log.error("全局参数表加载失败!");
				e.printStackTrace();
			}
			servletContext.setAttribute("EAPARAMLIST", paramList);
		}
		long timeSec = (System.currentTimeMillis() - start) / 1000;
		//log.info("********************************************");
		if (success) {
			//log.info("系统平台启动成功[" + BFUtils.getCurrentTime() + "]");
			//log.info("启动总耗时: " + timeSec / 60 + "分 " + timeSec % 60 + "秒 ");
		} else {
			//log.error("系统平台启动失败[" + BFUtils.getCurrentTime() + "]");
			//log.error("启动总耗时: " + timeSec / 60 + "分" + timeSec % 60 + "秒");
		}
		//log.info("********************************************");
	}

	/**
	 * 识别缺省的JDBC驱动类型(bfDao)
	 * 
	 * @throws SQLException
	 */
	private void initDbType() throws SQLException {
		Dao bfDao = (Dao) SpringBeanLoader.getSpringBean("bfDao");
		Connection connection = bfDao.getConnection();
		String dbString = connection.getMetaData().getDatabaseProductName().toLowerCase();
		try {
			connection.close();
		} catch (Exception e) {
			log.error(BFConstants.Exception_Head + "未正常关闭数据库连接");
			e.printStackTrace();
		}
		if (dbString.indexOf("ora") > -1) {
			System.setProperty("bfDao.db", "oracle");
		} else if (dbString.indexOf("mysql") > -1) {
			System.setProperty("bfDao.db", "mysql");
		}else if (dbString.indexOf("microsoft") > -1) {
			System.setProperty("bfDao.db", "sqlserver");
		} else {
			if (log.isErrorEnabled()) {
				log.error(BFConstants.Exception_Head + "系统平台目前还不支持你使用的数据库产品.如需获得支持,请和我们联系!");
			}
			System.exit(0);
		}
	}
}
