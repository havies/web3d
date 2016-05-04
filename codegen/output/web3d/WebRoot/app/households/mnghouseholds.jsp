<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="households管理" uxEnabled="true">
<bf:import src="/app/households/js/mnghouseholds.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var householdsColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['styleid', '风格编号'],
        ['roomtype', '户型类型'],
        ['square', '面积'],
        ['assetbundlename', ''],
        ['assetname', '']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < householdsColumnStore.getCount(); i++) {
    mainGridHeader[householdsColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+householdsColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+householdsColumnStore.getAt(i).get('value')] = householdsColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>