<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="菜单资源管理">
<bf:import src="/system/admin/js/manageMenuResource.js"/>
<bf:ext.codeRender fields="MENUTYPE,LEAF,EXPAND"/>
<bf:ext.codeStore fields="EXPAND"/>
<bf:body>
<bf:div key="menuTreeDiv"></bf:div>
</bf:body>
<bf:script>
   var root_menuname = '<bf:out key="rootMenuName" scope="request"/>';
</bf:script>
</bf:html>