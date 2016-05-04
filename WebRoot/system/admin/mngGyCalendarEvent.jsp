<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="日历事件管理管理" uxEnabled="true">
<bf:import src="/system/admin/js/mngGyCalendarEvent.js"/>

<script type="text/javascript">
var ctx = '<%=request.getContextPath() %>';
var GyCalendarEventColumnStore = new Ext.data.SimpleStore({
	fields : ['value', 'text'],
	data : [
        ['eventtitle', '日历事件标题'],
        ['isallday', '全天事件'],
        ['whenbegin', '事件开始时间'],
        ['whenend', '事件结束时间'],
        ['eventtype', '事件类型（工作|学习|娱乐|生活）'],
        ['reminder', '提醒方式'],
        ['notes', '备注信息'],
        ['location', '地点'],
        ['weblink', 'Web链接'],
        ['eventowner', '事件属主（public|private）'],
        ['eventparamkey', '事件对应的gy_param里的key'],
        ['owneruserid', '私有事件的用户名'],
        ['scrq', '']
    ]
});
var mainGridHeader = {};
for (var i = 0; i < GyCalendarEventColumnStore.getCount(); i++) {
    mainGridHeader[GyCalendarEventColumnStore.getAt(i).get('value')] = true;
    mainGridHeader['hide_'+GyCalendarEventColumnStore.getAt(i).get('value')] = false;
    mainGridHeader['header_'+GyCalendarEventColumnStore.getAt(i).get('value')] = GyCalendarEventColumnStore.getAt(i).get('text');
}
</script>

<bf:body>
</bf:body>
<bf:script>
var menuid = '<bf:out key="menuid" scope="request"/>';
</bf:script>

<bf:ext.uiGrant/>
</bf:html>