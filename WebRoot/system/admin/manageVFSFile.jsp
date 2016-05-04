<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="VFS文件管理" uxEnabled="true">
<bf:ext.myux uxType="swfupload"/>
<bf:import src="/system/admin/js/manageVFSFile.js"/>
<style type="text/css">
.x-tree-node-leaf .x-tree-node-icon{
 background-image:url(../resource/theme/default/resources/images/default/tree/folder.gif);
}
</style>

<bf:body>
<bf:div key="folderTreeDiv"></bf:div>
</bf:body>


<bf:script>
var vfsroot = '<bf:out key="vfsroot" scope="request"/>';
var vfsroot_name = '<bf:out key="vfsroot_name" scope="request"/>';
var maxUploadFileSize = '<bf:out key="maxUploadFileSize" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>