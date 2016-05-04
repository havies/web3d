<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="products管理" uxEnabled="true">
<bf:import src="/app/product/js/mngproducts.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var productsColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['productname', '产品名称'],
        ['categoryid', '类型编号'],
        ['styleid', '风格编号'],
        ['length', '长'],
        ['width', ' 宽'],
        ['height', '高'],
        ['assetbundlename', ''],
        ['assetname', '']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < productsColumnStore.getCount(); i++) {
    mainGridHeader[productsColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+productsColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+productsColumnStore.getAt(i).get('value')] = productsColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>