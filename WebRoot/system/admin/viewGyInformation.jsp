<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${info.title}</title>
<script type="text/javascript" src="<c:url value='/resource/commonjs/patch_png_background.js' />"></script>
</head>
<body>
<center>
<div style="font-size:22px;padding:10px 0 5px 0;">
${info.title}
</div>
<div style="font-size:12px;color:gray;text-align:right;margin:0 20px;">
发布日期：${fn:substring(info.updatetime, 0, 10)}
</div>
</center>
<hr size='1' color='gray'/>
<div style="padding:0 20px">
${info.content}
</div>
<hr size='1' color='gray'/>
<div style="font-size:15px;padding:0 0 10px 0;">
附件下载：
<a href="javascript:downloadAttachment('${ctx}', '${info.attachment}', '/${attachmentFolder}/${info.attachment}')">${info.attachment }</a>
</div>
</body>
<script>

</script>
</html>