<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="数据范围角色授权">
<bf:import src="/system/admin/js/ruleRole.js" />
<bf:body>
	<bf:div key="deptTreeDiv"></bf:div>

	<bf:ext.codeRender fields="ROLETYPE,ROLESPEC,LOCKED,DATARULE"  />
	<bf:ext.codeStore fields="LOCKED,ROLESPEC,ROLETYPE:3,DATARULE"/>

</bf:body>
<bf:script>
   var root_deptid = '<bf:out key="rootDeptid" scope="request" />';
   var root_deptname = '<bf:out key="rootDeptname" scope="request" />';
   var root_menuname = '<bf:out key="rootMenuName" scope="request" />';
</bf:script>
</bf:html>