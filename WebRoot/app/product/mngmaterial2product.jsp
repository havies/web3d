<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="material2product管理" uxEnabled="true">
<bf:import src="/app/product/js/mngmaterial2product.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var material2productColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['materialid', '材质ID'],
        ['productid', '产品ID']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < material2productColumnStore.getCount(); i++) {
    mainGridHeader[material2productColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+material2productColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+material2productColumnStore.getAt(i).get('value')] = material2productColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>