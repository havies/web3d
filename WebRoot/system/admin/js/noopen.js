/**
 * 未开放
 */
Ext.onReady(function() {

	var noopenWindow = new Ext.Window({
		title : '<span class="commoncss">提示</span>', // 窗口标题
		iconCls : 'imageIcon',
		layout : 'fit', // 设置窗口布局模式
		width : 400, // 窗口宽度
		height : 200, // 窗口高度
		// tbar : tb, // 工具栏
		animateTarget : Ext.getBody(),
		closable : false, // 是否可关闭
		closeAction : 'hide', // 关闭策略
		collapsible : false, // 是否可收缩
		maximizable : false, // 设置是否可以最大化
		border : true, // 边框线设置
		pageY : 80, // 页面定位Y坐标
		pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位X坐标
		constrain : true,
		html: '<center><h1 style="margin-top:50px;">'+promptMsg+'</h1></center>'
	});
	noopenWindow.show(); // 显示窗口

});

