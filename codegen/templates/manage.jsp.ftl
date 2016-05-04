<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="${zTable.comment}管理" uxEnabled="true">
<bf:import src="/app/${subModule}/js/mng${zTable.className}.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var ${zTable.className}ColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
	<#list zTable.fields as zField>
	<#if zField.primaryKey?string("yes", "no") == "no">
        ['${zField.fieldName}', '${zField.comment}']<#if zField_has_next>,</#if>
     </#if>
	</#list>
    ]
});
var mainGridHeader = {};
for (var i = 0; i < ${zTable.className}ColumnStore.getCount(); i++) {
    mainGridHeader[${zTable.className}ColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+${zTable.className}ColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+${zTable.className}ColumnStore.getAt(i).get('value')] = ${zTable.className}ColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>