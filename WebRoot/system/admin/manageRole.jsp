<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="角色管理与授权">
<bf:import src="/system/admin/js/manageRole.js"/>
<bf:ext.codeRender fields="ROLETYPE,ROLESPEC,LOCKED"  />
<bf:ext.codeStore fields="LOCKED,ROLESPEC,ROLETYPE:3"/>
<bf:body>
<bf:div key="deptTreeDiv"></bf:div>
</bf:body>
<bf:script>
   var root_deptid = '<bf:out key="rootDeptid" scope="request"/>';
   var root_deptname = '<bf:out key="rootDeptname" scope="request"/>';
   var login_account = '<bf:out key="login_account" scope="request"/>';
</bf:script>
</bf:html>