<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="project2user管理" uxEnabled="true">
<bf:import src="/app/project/js/mngproject2user.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var project2userColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['projectid', '项目编号'],
        ['userid', '用户编号']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < project2userColumnStore.getCount(); i++) {
    mainGridHeader[project2userColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+project2userColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+project2userColumnStore.getAt(i).get('value')] = project2userColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>