<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="报表预览">
<bf:body>
</bf:body>
<script language="JavaScript">
window.onload = function(){
    window.location.href = '<%=request.getAttribute("dataUrl")%>';
}
</script>

</bf:html>