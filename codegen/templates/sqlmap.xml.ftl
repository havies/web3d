<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE sqlMap PUBLIC "-//iBATIS.com//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<!-- ${zTable.comment}管理手工映射SQL语句 -->
<sqlMap namespace="${zTable.className}">
	<typeAlias alias="dto" type="com.boidea.framework.core.metatype.impl.BaseDto"/>
	
	<!-- ${zTable.comment}-查询列表 -->
	<select id="query${zTable.className}sForManage" parameterClass="map" resultClass="dto">
		SELECT   
		<#list zTable.fields as zField>
		a.${zField.dbFieldName} as ${zField.fieldName}<#if zField_has_next>,</#if>
		</#list>
		    FROM ${zTable.tableName} a
		   WHERE 1 = 1
		   	<isNotEmpty prepend="AND" property="${zTable.pkFieldName}"> 
				 a.${zTable.pkColumnName} = #${zTable.pkFieldName}#
			</isNotEmpty>
			<#list zTable.fields as zField>
			<#if zField.primaryKey?string("yes", "no") == "no">
			<isNotEmpty prepend="AND" property="${zField.fieldName}"> 
				 a.${zField.dbFieldName} like '%$${zField.fieldName}$%'
			</isNotEmpty>
			</#if>
			</#list>
			<isNotEmpty prepend="AND" property="ruleCond"> 
				 $ruleCond$
			</isNotEmpty>
			
			<!-- 列的快速查询 begin-->
			<dynamic prepend="and" open=" (" close=")">
				<#list zTable.fields as zField>
				<#if zField.primaryKey?string("yes", "no") == "no">
				<isNotEmpty prepend="OR" property="or_${zField.fieldName}"> 
					 a.${zField.dbFieldName} like '%$or_${zField.fieldName}$%'
				</isNotEmpty>
				</#if>
				</#list>
			</dynamic>
			<!-- 列的快速查询 end-->
	</select>
	
	<select id="query${zTable.className}sCountForManage" parameterClass="map" resultClass="java.lang.Integer">
		SELECT count(1) as count
		  FROM ${zTable.tableName} a 
		 WHERE 1 = 1
			<isNotEmpty prepend="AND" property="${zTable.pkFieldName}"> 
				 a.${zTable.pkColumnName} = #${zTable.pkFieldName}#
			</isNotEmpty>
			<#list zTable.fields as zField>
			<#if zField.primaryKey?string("yes", "no") == "no">
			<isNotEmpty prepend="AND" property="${zField.fieldName}"> 
				 a.${zField.dbFieldName} like '%$${zField.fieldName}$%'
			</isNotEmpty>
			</#if>
			</#list>
			<isNotEmpty prepend="AND" property="ruleCond"> 
				 $ruleCond$
			</isNotEmpty>
			
			<!-- 列的快速查询 begin-->
			<dynamic prepend="and" open=" (" close=")">
				<#list zTable.fields as zField>
				<#if zField.primaryKey?string("yes", "no") == "no">
				<isNotEmpty prepend="OR" property="or_${zField.fieldName}"> 
					 a.${zField.dbFieldName} like '%$or_${zField.fieldName}$%'
				</isNotEmpty>
				</#if>
				</#list>
			</dynamic>
			<!-- 列的快速查询 end-->
	</select>
	
	<!-- 插入一条${zTable.comment}表记录 -->
	<insert id="save${zTable.className}Item" parameterClass="dto">
		INSERT INTO ${zTable.tableName} (
		   <#list zTable.fields as zField>
			${zField.dbFieldName}<#if zField_has_next>,</#if>
			</#list>
		   ) 
		VALUES (
		<#list zTable.fields as zField>
			#${zField.fieldName}#<#if zField_has_next>,</#if>
		</#list>
		)
	</insert>
	
	<!-- 根据主键删除${zTable.comment}表  -->
	<delete id="delete${zTable.className}Item" parameterClass="map" >
		DELETE FROM ${zTable.tableName}
		WHERE
			${zTable.pkColumnName} = #${zTable.pkFieldName}#
	</delete>
	
	<!-- 根据主键更新${zTable.comment}表 -->
	<update id="update${zTable.className}Item" parameterClass="dto">
         UPDATE ${zTable.tableName}
		<dynamic prepend="SET"> 
			<#list zTable.fields as zField>
			<#if zField.classTypeName = "Integer" || zField.classTypeName = "Double" || zField.classTypeName = "Long" || zField.classTypeName = "Float">
			<isNotEmpty prepend="," property="${zField.fieldName}">
			${zField.dbFieldName} = #${zField.fieldName}#
			</isNotEmpty>
			<#else>
            <isNotNull prepend="," property="${zField.fieldName}">
            ${zField.dbFieldName} = #${zField.fieldName}#
            </isNotNull>
            </#if>
			</#list>
		</dynamic> 
	        WHERE 
				${zTable.pkColumnName} = #${zTable.pkFieldName}#
	</update>
	
</sqlMap>