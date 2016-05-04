/**
 * 欢迎页面
 * 
 */
Ext.onReady(function() {
			new Ext.ux.TipWindow({
						title : '<span class=commoncss>系统提示</span>',
						padding : '10',
						html : '您有[0]条未完成任务.<br/>您有[0]条未读消息.<br/>',
						iconCls : 'commentsIcon'
					});
			//.show(Ext.getBody());
		});

Ext.onReady(function() {

	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

	var tools = [{
				id : 'maximize',
				handler : function(e, target, panel) {
				}
			}];

	//得到信息发布列表
	var moduleComboBox = new Ext.form.ComboBox({
		name : 'module',
		hiddenName : 'module',
		store : SYSINFO_MODULEStore,
		mode : 'local',
		triggerAction : 'all',
		valueField : 'value',
		displayField : 'text',
		fieldLabel : '所属模块',
		emptyText : '请选择...',
		forceSelection : true,
		editable : false,
		typeAhead : true,
		allowBlank : false,
		anchor : "50%"
	});
	var cm = new Ext.grid.ColumnModel([]);
	var curColConfig = cm.config;
    curColConfig.push({
                header : '<div style="text-align:center">模块</div>',
                dataIndex : 'module',
                sortable: false,
                menuDisabled: true,
                width : 100,
                renderer: Ext.ux.comboBoxRenderer(moduleComboBox, '#666666')
    });
    curColConfig.push({
                header : '<div style="text-align:center">标题</div>',
                dataIndex : 'title',
                sortable: false,
                menuDisabled: true,
                width : 500,
                renderer: function (data, metadata, record, rowIndex, columnIndex, store) {  
                    var informationid = store.getAt(rowIndex).get('informationid');  
                    var title = store.getAt(rowIndex).get('title');  
                    return '<a href="javascript:"><font color="#444444">' + title + '</font></a>';  
                } 
    });
    curColConfig.push({
                header : '<div style="text-align:center">时间</div>',
                dataIndex : 'updatetime',
                sortable: false,
                menuDisabled: true,
                width : 120,
                renderer: function (data) {  
                    return '<font color="#666666">' + data.substring(0,10) + '</font>';  
                } 
    });
    curColConfig.push({
	        dataIndex : '_blank',
	        id : '_blank',
	        width : 10,
	        sortable: false,
            menuDisabled: true
    });
    cm.setConfig(curColConfig);
	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : './common/gyinformation/queryForView.action'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [
							{
							 name : 'informationid'
							},
							{
							 name : 'title'
							},
							{
							 name : 'module'
							},
							{
							 name : 'assignrolename'
							},
							{
							 name : 'assignroleid'
							},
							{
							 name : 'attachment'
							},
							{
							 name : 'istop'
							},
							{
							 name : 'readcount'
							},
							{
							 name : 'createuser'
							},
							{
							 name : 'createtime'
							},
							{
							 name : 'updateuser'
							},
							{
							 name : 'updatetime'
							}
							])
			});
	var grid = new Ext.grid.GridPanel({
						autoScroll : true,
						region : 'center',
						margins : '0 0 0 0',
						store : store,
						cm : cm,
						autoExpandColumn : '_blank',
						loadMask : {
							msg : '正在加载数据,请稍等...'
						},
						viewConfig : {
							// 不产横向生滚动条, 各列自动扩展自动压缩, 适用于列数比较少的情况
							forceFit : true,
							autoFill: true
						},
						trackMouseOver: false,
						bbar: [
								'->', {
									text : '查看更多...',
									id: 'id_more_button',
									iconCls : 'n_table_goIcon',
									handler : function() {
										location.href = 'common/gyinformation/viewListInit.action?module=ALL';
									}
								}
						       ]
				});

	grid.on("cellclick", function(grid, rowIndex, columnIndex, e) {
		var store = grid.getStore();
		var record = store.getAt(rowIndex);
		var fieldName = grid.getColumnModel().getDataIndex(columnIndex);
		
		if (fieldName == 'title' && columnIndex == 1) {
			var informationid = record.get('informationid');  
			var url = './common/gyinformation/view.action?informationid='+informationid;
		    infoWindow.show();
		    Ext.get('infomationViewIFrame').dom.src = url;
		}
	});
	store.load({
		params : {
			module: 'ALL',
			start : 0,
			limit : 20
		}
	});
	var infoWindow = new Ext.Window({
		layout : 'fit',
		width : 800,
		height : 500,
		resizable : true,
		draggable : true,
		closeAction : 'hide',
		title : '<span class="commoncss">查看信息发布</span>',
		modal : true,
		collapsible : true,
		titleCollapse : false,
		maximizable : true,
		buttonAlign : 'center',
		border : false,
		animCollapse : true,
		constrain : true,
		bodyStyle:"background-color:#FFFFFF;",
		html : '<iframe scrolling="auto" frameborder="0" id="infomationViewIFrame" name="infomationViewIFrame" src="" width="100%" height="100%" />',
		buttons : [
		 {
			text : '关闭',
			id : 'btnClose_infoWindow',
			iconCls : 'deleteIcon',
			handler : function() {
				infoWindow.hide();
			}
		}]
	});
	infoWindow.on("hide", function(w) {
		Ext.get('infomationViewIFrame').dom.src = '';
	});
	
	var my_height1 = document.body.clientHeight - 35;
	var my_height = document.body.clientHeight - 65;
	var viewport = new Ext.Viewport({
		layout : 'border',
		items : [{
			xtype : 'portal',
			region : 'center',
			margins : '3 3 3 3',
			items : [{
						columnWidth : .6,
						style : 'padding:8px 0px 8px 8px',
						items : [{
									title : '信息公告',
									layout : 'fit',
									padding : '0',
									// tools : tools,
									height : my_height1,
									items : [grid]
								}]
					}, {
						columnWidth : .4,
						style : 'padding:8px 8px 8px 8px',
						items : [{
							title : '我的任务',
							padding : '10',
							// tools : tools,
							html : '<div style=height:'+(my_height1 - 305)+'px;line-height:25px class=commoncss>&nbsp;&nbsp;<br>&nbsp;&nbsp;</div>'
						}, {
							title : '系统介绍',
							padding : '10',
							// tools : tools,
							html : '<div style=height:195px;line-height:25px class=commoncss>'+sysIntroduce+'</div>'
						}]
					}]
		}]
	});
});
