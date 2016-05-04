<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="获取服务器信息及内存CPU实时监控" fcfEnabled="true">
<bf:import src="/system/admin/js/serverInfo.js" />
<bf:body>
	<bf:flashReport type="L" dataVar="xmlString" id="jvmMemChart" style="margin-top:50px"
		width="680" height="250" align="center" visible="false" />
</bf:body>
<bf:script>
var jsonInfo = <bf:out key="jsonInfo" scope="request" />;
</bf:script>
</bf:html>