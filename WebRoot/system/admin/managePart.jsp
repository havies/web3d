<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="UI组件管理" uxEnabled="true">
<bf:import src="/system/admin/js/managePart.js"/>
<bf:body>
<bf:div key="menuTreeDiv" />
<bf:ext.codeRender fields="CMPTYPE"/>
<bf:ext.codeStore fields="CMPTYPE"/>

</bf:body>
<bf:script>
   var root_menuname = '<bf:out key="rootMenuName" scope="request"/>';
</bf:script>
</bf:html>