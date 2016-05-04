<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
<title>500错误</title>
</head>
<body>
服务器发生了内部错误。请<a href="${ctx}/index.do?reqCode=indexInit" target="_top">点击返回首页</a>。
</body>
</html>