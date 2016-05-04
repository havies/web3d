<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="categorys管理" uxEnabled="true">
<bf:import src="/app/category/js/mngcategorys.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var categorysColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['categoryname', '产品分类名称'],
        ['parentid', '父结点ID']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < categorysColumnStore.getCount(); i++) {
    mainGridHeader[categorysColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+categorysColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+categorysColumnStore.getAt(i).get('value')] = categorysColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>