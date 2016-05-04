<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html showLoading="false" urlSecurity2="false">
<bf:ext.myux uxType="tipwindow" />
<bf:import src="/system/admin/js/welcome.js" />

<bf:ext.codeStore fields="SYSINFO_MODULE" />

<bf:body cls="noYScrollBar">
<%-- 
<iframe width="100%" height="510" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=510&fansRow=1&ptype=1&speed=0&skin=9&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=2756431474&verifier=3f8e70e3&dpc=1"></iframe>
--%>
</bf:body>
<bf:script>
var sysIntroduce = '${sysIntroduce}'
</bf:script>
</bf:html>