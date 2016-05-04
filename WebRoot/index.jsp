<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="${sysTitle}" showLoading="false" exportParams="true"
	isSubPage="false" exportExceptionWindow="true" exportUserinfo="true">
<bf:import src="/resource/commonjs/extTabCloseMenu.js" />
<bf:import src="/system/admin/js/index.js" />
<bf:ext.codeStore fields="SEX" />
<bf:body>
	<bf:arm.Viewport northTitle="${sysTitle}" westTitle="${westTitle}" />
</bf:body>
</bf:html>