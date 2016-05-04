<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="UI组件角色授权">
<bf:import src="/system/admin/js/rolePart.js" />
<bf:body>
	<bf:div key="deptTreeDiv"></bf:div>
	<bf:ext.codeRender fields="CMPTYPE" />
	<bf:ext.codeStore fields="CMPTYPE" />
	<bf:ext.codeRender fields="PARTAUTHTYPE" />
	<bf:ext.codeStore fields="PARTAUTHTYPE" />
	<bf:ext.codeRender fields="ROLETYPE,ROLESPEC,LOCKED"  />
	<bf:ext.codeStore fields="LOCKED,ROLESPEC,ROLETYPE:3"/>

</bf:body>
<bf:script>
   var root_deptid = '<bf:out key="rootDeptid" scope="request" />';
   var root_deptname = '<bf:out key="rootDeptname" scope="request" />';
   var root_menuname = '<bf:out key="rootMenuName" scope="request" />';
</bf:script>
</bf:html>