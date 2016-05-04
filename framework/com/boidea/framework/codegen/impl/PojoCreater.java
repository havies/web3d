package com.boidea.framework.codegen.impl;

import java.util.HashMap;
import java.util.Map;

import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.boidea.framework.codegen.Creator;
import com.boidea.framework.codegen.MoleContext;
import com.boidea.framework.codegen.meta.ZTable;

public class PojoCreater implements Creator {

	private static final Log log = Logs.get();
	
	public void create(MoleContext context) {
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("packageName", context.getConfig().getProject().get("packageName"));
		datas.put("subModule", context.getConfig().getProject().get("subModule"));
		
		//VO
		String pathRoot = context.getConfig().getProject().get("srcFileRoot") + "dao/vo/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("VO{ClassName:%s,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + "Vo.java", "Vo.java.ftl", datas);
		}
		
		//StrutsAction
		/*
		pathRoot = context.getConfig().getProject().get("srcFileRoot") + "web/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("Action{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + "Action.java", "Action.java.ftl", datas);
		}
		*/
		
		//SpringAction
		pathRoot = context.getConfig().getProject().get("srcFileRoot") + "web/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("Action{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + "Action.java", "SpringAction.java.ftl", datas);
		}
		
		//Service
		pathRoot = context.getConfig().getProject().get("srcFileRoot") + "service/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("Service{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + "Service.java", "Service.java.ftl", datas);
		}
		//ServiceImpl
		pathRoot = context.getConfig().getProject().get("srcFileRoot") + "service/impl/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("ServiceImp{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + "ServiceImpl.java", "ServiceImpl.java.ftl", datas);
		}

		//ServiceImpl
		pathRoot = context.getConfig().getProject().get("srcFileRoot") + "service/impl/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("ServiceImp{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + "ServiceImpl.java", "ServiceImpl.java.ftl", datas);
		}
		//ServiceImpl
		pathRoot = context.getConfig().getProject().get("srcFileRoot") + "service/impl/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("ServiceImp{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + "ServiceImpl.java", "ServiceImpl.java.ftl", datas);
		}
		//sqlmap file
		pathRoot = context.getConfig().getProject().get("srcFileRoot") + "dao/sqlmap/biz/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("SQLMAP{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + ".sqlmap.xml", "sqlmap.xml.ftl", datas);
		}
		
		//sqlmap Container file
		pathRoot = context.getConfig().getProject().get("projectRoot") + "src/config/app/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("SQLMAP-Container{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + ".app.sqlmap.xml", "app.sqlmap.xml.ftl", datas);
		}
		//Service Container file
		pathRoot = context.getConfig().getProject().get("projectRoot") + "src/config/app/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("Service-Container{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + ".app.service.xml", "app.service.xml.ftl", datas);
		}
		
		//struts config file
		/*
		pathRoot = context.getConfig().getProject().get("projectRoot") + "WebRoot/WEB-INF/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("Struts-config{ClassName:%sModule,TableName:%s}", zTable.getClassName(),zTable.getTableName());
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + ".struts-config.xml", "struts-config.xml.ftl", datas);
		}
		*/
		
		//manage.jsp
		pathRoot = context.getConfig().getProject().get("projectRoot") + "WebRoot/app/"+context.getConfig().getProject().get("subModule")+"/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("manage_jsp{manage.jsp:%s}", zTable.getClassName());
			FreemarkerHelp.make(pathRoot + "mng"+zTable.getClassName()+".jsp", "manage.jsp.ftl", datas);
		}
		//struts-manage.js
		/*
		pathRoot = context.getConfig().getProject().get("projectRoot") + "WebRoot/app/"+context.getConfig().getProject().get("subModule")+"/js/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("manage_js{manage.js:%s}", zTable.getClassName());
			FreemarkerHelp.make(pathRoot + "mng"+zTable.getClassName()+".js", "manage.js.ftl", datas);
		}
		*/
		//spring-manage.js
		pathRoot = context.getConfig().getProject().get("projectRoot") + "WebRoot/app/"+context.getConfig().getProject().get("subModule")+"/js/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			log.errorf("manage_js{manage.js:%s}", zTable.getClassName());
			FreemarkerHelp.make(pathRoot + "mng"+zTable.getClassName()+".js", "spring-manage.js.ftl", datas);
		}
		//insertui.sql
		/*
		pathRoot = context.getConfig().getProject().get("projectRoot") + "db/";
		for (ZTable zTable : context.getTables()) {
			datas.put("zTable", zTable);
			FreemarkerHelp.make(pathRoot + zTable.getClassName() + ".insertui.sql", "insertui.sql.ftl", datas);
		}
		*/

		log.debug("代码生成操作完成.");
		
	}
}
