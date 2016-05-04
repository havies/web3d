<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="housestyle管理" uxEnabled="true">
<bf:import src="/app/housestyle/js/mnghousestyle.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var housestyleColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['stylename', '风格名称']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < housestyleColumnStore.getCount(); i++) {
    mainGridHeader[housestyleColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+housestyleColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+housestyleColumnStore.getAt(i).get('value')] = housestyleColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>