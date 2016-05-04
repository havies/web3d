<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="日历" uxEnabled="true">

<bf:import src="/resource/myux/calendar/resources/css/calendar.css" />
<bf:import src="/resource/myux/calendar/src/Ext.calendar.js" />
<bf:import src="/resource/myux/calendar/src/templates/DayHeaderTemplate.js" />
<bf:import src="/resource/myux/calendar/src/templates/DayBodyTemplate.js" />
<bf:import src="/resource/myux/calendar/src/templates/DayViewTemplate.js" />
<bf:import src="/resource/myux/calendar/src/templates/BoxLayoutTemplate.js" />
<bf:import src="/resource/myux/calendar/src/templates/MonthViewTemplate.js" />
<bf:import src="/resource/myux/calendar/src/dd/CalendarScrollManager.js" />
<bf:import src="/resource/myux/calendar/src/dd/StatusProxy.js" />
<bf:import src="/resource/myux/calendar/src/dd/CalendarDD.js" />
<bf:import src="/resource/myux/calendar/src/dd/DayViewDD.js" />
<bf:import src="/resource/myux/calendar/src/EventRecord.js" />
<bf:import src="/resource/myux/calendar/src/views/MonthDayDetailView.js" />
<bf:import src="/resource/myux/calendar/src/widgets/CalendarPicker.js" />
<bf:import src="/resource/myux/calendar/src/WeekEventRenderer.js" />
<bf:import src="/resource/myux/calendar/src/views/CalendarView.js" />
<bf:import src="/resource/myux/calendar/src/views/MonthView.js" />
<bf:import src="/resource/myux/calendar/src/views/DayHeaderView.js" />
<bf:import src="/resource/myux/calendar/src/views/DayBodyView.js" />
<bf:import src="/resource/myux/calendar/src/views/DayView.js" />
<bf:import src="/resource/myux/calendar/src/views/WeekView.js" />
<bf:import src="/resource/myux/calendar/src/widgets/DateRangeField.js" />
<bf:import src="/resource/myux/calendar/src/widgets/ReminderField.js" />
<bf:import src="/resource/myux/calendar/src/EventEditForm.js" />
<bf:import src="/resource/myux/calendar/src/EventEditWindow.js" />
<bf:import src="/resource/myux/calendar/src/CalendarPanel.js" />
<bf:import src="/resource/commonjs/ext-lang-zh_CN.js" />

<script>
var ctx = '<c:out value="${ctx}" />';
var calendarList = {
    "calendars":[{
        "id":1,
        "title":"工作"
    },{
        "id":2,
        "title":"学习"
    },{
        "id":3,
        "title":"其他"
    }]
};
var eventList = {};
</script>

<bf:import src="/resource/myux/calendar/resources/css/examples.css" />
<bf:import src="/resource/myux/calendar/app/cal-app.js" />


<div>
	<div id="app-header-content">
	   <span id="app-msg" class="x-hidden"></span>
	</div>
</div>

</bf:html>

