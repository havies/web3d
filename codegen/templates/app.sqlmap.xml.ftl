<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMapConfig PUBLIC "-//iBATIS.com//DTD SQL Map Config 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-config-2.dtd">
<!-- 业务系统的SQL映射文件装载 -->
<sqlMapConfig>
	<settings useStatementNamespaces="true" />

	<sqlMap resource="${packageName?replace(".","/")}/dao/sqlmap/biz/${zTable.className}.sqlmap.xml" />
	
	
</sqlMapConfig>