<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="部门管理"  >
<bf:import src="/system/admin/js/manageDepartment.js"/>
<bf:ext.codeRender fields="LEAF"/>
<bf:body>
<bf:div key="deptTreeDiv"></bf:div>
</bf:body>
<bf:script>

   var root_deptid = '<bf:out key="rootDeptid" scope="request"/>';
   var root_deptname = '<bf:out key="rootDeptname" scope="request"/>';
   
</bf:script>
</bf:html>