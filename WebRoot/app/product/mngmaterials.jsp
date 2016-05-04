<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="materials管理" uxEnabled="true">
<bf:import src="/app/product/js/mngmaterials.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var materialsColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['materialname', '材质名称'],
        ['assetbundlename', ''],
        ['assetname', '']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < materialsColumnStore.getCount(); i++) {
    mainGridHeader[materialsColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+materialsColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+materialsColumnStore.getAt(i).get('value')] = materialsColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>