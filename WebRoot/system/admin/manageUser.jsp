<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="人员管理与授权">
<bf:import src="/system/admin/js/manageUser.js"/>
<bf:ext.codeRender fields="SEX,LOCKED,USERTYPE"/>
<bf:ext.codeStore fields="SEX,LOCKED,USERTYPE:3"/>
<bf:body>
<bf:div key="deptTreeDiv"></bf:div>
</bf:body>
<bf:script>
   var root_deptid = '<bf:out key="rootDeptid" scope="request"/>';
   var root_deptname = '<bf:out key="rootDeptname" scope="request"/>';
   var login_account = '<bf:out key="login_account" scope="request"/>';
</bf:script>
</bf:html>