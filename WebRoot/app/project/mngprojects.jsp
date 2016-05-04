<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="projects管理" uxEnabled="true">
<bf:import src="/app/project/js/mngprojects.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var projectsColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['type', '类型：0--系统项目，1--DIY项目'],
        ['projectname', '项目名称'],
        ['categoryid', '风格编号']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < projectsColumnStore.getCount(); i++) {
    mainGridHeader[projectsColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+projectsColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+projectsColumnStore.getAt(i).get('value')] = projectsColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>