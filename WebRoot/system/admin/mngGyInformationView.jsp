<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="信息发布管理管理" uxEnabled="true">
<bf:import src="/system/admin/js/mngGyInformationView.js"/>

<bf:ext.codeStore fields="SYSINFO_MODULE" />

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var GyInformationColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
	    ['module', '所属模块'],
        ['title', '信息标题'],
        ['attachment', '信息附件'],
        ['updatetime', '信息修改时间']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < GyInformationColumnStore.getCount(); i++) {
    mainGridHeader[GyInformationColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+GyInformationColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+GyInformationColumnStore.getAt(i).get('value')] = GyInformationColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
var module = '<bf:out key="module" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>