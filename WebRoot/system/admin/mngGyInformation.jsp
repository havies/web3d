<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="信息发布管理管理" uxEnabled="true">
<bf:ext.myux uxType="htmleditor"/>
<bf:import src="/system/admin/js/mngGyInformation.js"/>

<bf:ext.codeStore fields="SYSINFO_MODULE" />

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var SFStore = new Ext.data.SimpleStore({
	  fields : ['value', 'text'],
	  data : [['是', '是'],['否', '否']]
	});

var GyInformationColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
	    ['module', '所属模块'],
        ['title', '信息标题'],
        //['content', '信息内容'],
        ['attachment', '信息附件'],
        ['assignrolename', '指定阅读角色'],
        ['istop', '是否置顶'],
        ['readcount', '信息阅读数'],
        ['createuser', '信息创建用户'],
        ['createtime', '信息创建时间'],
        ['updateuser', '信息修改用户'],
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
var root_roleid = '<bf:out key="rootRoleid" scope="request"/>';
var root_rolename = '<bf:out key="rootRolename" scope="request"/>';
var module = '<bf:out key="module" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>