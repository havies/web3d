/**
 * 日历事件管理管理
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-10
 */
Ext.onReady(function() {
	var searchColumnParam = '';
	var qColumn1Combo = new Ext.form.ComboBox({
		name : 'qColumn1',
		hiddenName : 'qColumn1',
		store : GyCalendarEventColumnStore,
		mode : 'local',
		triggerAction : 'all',
		valueField : 'value',
		displayField : 'text',
		fieldLabel : '',
		hideLabel : true,
		emptyText : '请选择查询字段...',
		allowBlank : true,
		editable : false,
		typeAhead : true,
		anchor : "99%"
	});
	var qColumn2Combo = new Ext.form.ComboBox({
		name : 'qColumn2',
		hiddenName : 'qColumn2',
		store : GyCalendarEventColumnStore,
		mode : 'local',
		triggerAction : 'all',
		valueField : 'value',
		displayField : 'text',
		fieldLabel : '',
		hideLabel : true,
		emptyText : '请选择查询字段...',
		allowBlank : true,
		editable : false,
		typeAhead : true,
		anchor : "99%"
	});
	var qColumn3Combo = new Ext.form.ComboBox({
		name : 'qColumn3',
		hiddenName : 'qColumn3',
		store : GyCalendarEventColumnStore,
		mode : 'local',
		triggerAction : 'all',
		valueField : 'value',
		displayField : 'text',
		fieldLabel : '',
		hideLabel : true,
		emptyText : '请选择查询字段...',
		allowBlank : true,
		editable : false,
		typeAhead : true,
		anchor : "99%"
	});
	
	//设置3个默认选择恶查询字段
	//qColumn1Combo.setValue('');
	//qColumn2Combo.setValue('');
	//qColumn3Combo.setValue('');
	
	var qForm = new Ext.form.FormPanel({
		border : false,
		labelWidth : 60, // 标签宽度
		labelAlign : 'right', // 标签对齐方式
		bodyStyle : 'padding:3 5 0', // 表单元素和表单面板的边距
		buttonAlign : 'center',
		height : 120,
		autoScroll:true,
		items : [{
				layout : 'column',
				border : false,
				items : [{
							columnWidth : .5,
							layout : 'form',
							labelWidth : 10, // 标签宽度
							border : false,
							items : [qColumn1Combo,qColumn2Combo,qColumn3Combo]
						}, {
							columnWidth : .5,
							layout : 'form',
							labelWidth : 20, // 标签宽度
							defaultType : 'textfield',
							border : false,
							items : [{
										fieldLabel : '：',
										labelSeparator : "",
										id : 'qColumn1Text',
										name : 'qColumn1Text', // name:后台根据此name属性取值
										allowBlank : true, // 是否允许为空
										anchor : '100%' // 宽度百分比
									}, {
										fieldLabel : '：',
										labelSeparator : "",
										id : 'qColumn2Text',
										name : 'qColumn2Text', // name:后台根据此name属性取值
										allowBlank : true, // 是否允许为空
										anchor : '100%' // 宽度百分比
									},{
										fieldLabel : '：',
										labelSeparator : "",
										id : 'qColumn3Text',
										name : 'qColumn3Text', // name:后台根据此name属性取值
										allowBlank : true, // 是否允许为空
										anchor : '100%' // 宽度百分比
									}]
						}]
			}]
		});

	var qWindow = new Ext.Window({
			title : '<span class="commoncss">查询条件</span>', // 窗口标题
			layout : 'fit', // 设置窗口布局模式
			width : 400, // 窗口宽度
			height : 170, // 窗口高度
			closable : true, // 是否可关闭
			closeAction : 'hide', // 关闭策略
			collapsible : true, // 是否可收缩
			maximizable : false, // 设置是否可以最大化
			border : true, // 边框线设置
			constrain : true,
			titleCollapse : true,
			animateTarget : Ext.getBody(),
			pageY : 2, // 页面定位Y坐标
			pageX : document.body.clientWidth / 2 - 400 / 2, // 页面定位X坐标
			// 设置窗口是否可以溢出父容器
			buttonAlign : 'right',
			items : [qForm],
			buttons : [{
						text : '查询',
						iconCls : 'previewIcon',
						handler : function() {
							queryTableInfo(qForm.getForm());
							qWindow.collapse();
						}
					}, {
						text : '重置',
						iconCls : 'tbar_synchronizeIcon',
						handler : function() {
							qForm.getForm().reset();
						}
					}, {
						text : '关闭',
						iconCls : 'deleteIcon',
						handler : function() {
							qWindow.hide();
						}
					}]
		});
	//qWindow.show(); // 显示窗口
	
	// 查询表格数据
	function queryTableInfo(pForm) {
		var qParams = pForm.getValues();
		qParams.menuid = menuid;
		// 翻页排序时带上查询条件
		store.on('beforeload', function() {
			this.baseParams = qParams;
		});

		qParams.start = 0;
		qParams.limit = bbar.pageSize;
		store.load({
					params : qParams
				});
	}
	var expander = new Ext.grid.RowExpander({
		tpl : new Ext.Template(
            '<table id="previewCardTable" border="0" width="500">',
			mainGridHeader.eventtitle === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_eventtitle+'：</span></td><td><span>{eventtitle}</span></td></tr>':'',
			mainGridHeader.isallday === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_isallday+'：</span></td><td><span>{isallday}</span></td></tr>':'',
			mainGridHeader.whenbegin === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_whenbegin+'：</span></td><td><span>{whenbegin}</span></td></tr>':'',
			mainGridHeader.whenend === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_whenend+'：</span></td><td><span>{whenend}</span></td></tr>':'',
			mainGridHeader.eventtype === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_eventtype+'：</span></td><td><span>{eventtype}</span></td></tr>':'',
			mainGridHeader.reminder === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_reminder+'：</span></td><td><span>{reminder}</span></td></tr>':'',
			mainGridHeader.notes === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_notes+'：</span></td><td><span>{notes}</span></td></tr>':'',
			mainGridHeader.location === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_location+'：</span></td><td><span>{location}</span></td></tr>':'',
			mainGridHeader.weblink === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_weblink+'：</span></td><td><span>{weblink}</span></td></tr>':'',
			mainGridHeader.eventowner === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_eventowner+'：</span></td><td><span>{eventowner}</span></td></tr>':'',
			mainGridHeader.eventparamkey === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_eventparamkey+'：</span></td><td><span>{eventparamkey}</span></td></tr>':'',
			mainGridHeader.owneruserid === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_owneruserid+'：</span></td><td><span>{owneruserid}</span></td></tr>':'',
			mainGridHeader.scrq === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_scrq+'：</span></td><td><span>{scrq}</span></td></tr>':'',
			'</table>'
			),
            expandOnDblClick : true
	});
	var sm = new Ext.grid.CheckboxSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, expander]);
	var curColConfig = cm.config;
	if(mainGridHeader.eventtitle === true)
        curColConfig.push({
                    header : mainGridHeader.header_eventtitle,
                    dataIndex : 'eventtitle',
                    sortable: true,
                    hidden: mainGridHeader.hide_eventtitle,
                    width : 150
        });
	if(mainGridHeader.isallday === true)
        curColConfig.push({
                    header : mainGridHeader.header_isallday,
                    dataIndex : 'isallday',
                    sortable: true,
                    hidden: mainGridHeader.hide_isallday,
                    width : 150
        });
	if(mainGridHeader.whenbegin === true)
        curColConfig.push({
                    header : mainGridHeader.header_whenbegin,
                    dataIndex : 'whenbegin',
                    sortable: true,
                    hidden: mainGridHeader.hide_whenbegin,
                    width : 150
        });
	if(mainGridHeader.whenend === true)
        curColConfig.push({
                    header : mainGridHeader.header_whenend,
                    dataIndex : 'whenend',
                    sortable: true,
                    hidden: mainGridHeader.hide_whenend,
                    width : 150
        });
	if(mainGridHeader.eventtype === true)
        curColConfig.push({
                    header : mainGridHeader.header_eventtype,
                    dataIndex : 'eventtype',
                    sortable: true,
                    hidden: mainGridHeader.hide_eventtype,
                    width : 150
        });
	if(mainGridHeader.reminder === true)
        curColConfig.push({
                    header : mainGridHeader.header_reminder,
                    dataIndex : 'reminder',
                    sortable: true,
                    hidden: mainGridHeader.hide_reminder,
                    width : 150
        });
	if(mainGridHeader.notes === true)
        curColConfig.push({
                    header : mainGridHeader.header_notes,
                    dataIndex : 'notes',
                    sortable: true,
                    hidden: mainGridHeader.hide_notes,
                    width : 150
        });
	if(mainGridHeader.location === true)
        curColConfig.push({
                    header : mainGridHeader.header_location,
                    dataIndex : 'location',
                    sortable: true,
                    hidden: mainGridHeader.hide_location,
                    width : 150
        });
	if(mainGridHeader.weblink === true)
        curColConfig.push({
                    header : mainGridHeader.header_weblink,
                    dataIndex : 'weblink',
                    sortable: true,
                    hidden: mainGridHeader.hide_weblink,
                    width : 150
        });
	if(mainGridHeader.eventowner === true)
        curColConfig.push({
                    header : mainGridHeader.header_eventowner,
                    dataIndex : 'eventowner',
                    sortable: true,
                    hidden: mainGridHeader.hide_eventowner,
                    width : 150
        });
	if(mainGridHeader.eventparamkey === true)
        curColConfig.push({
                    header : mainGridHeader.header_eventparamkey,
                    dataIndex : 'eventparamkey',
                    sortable: true,
                    hidden: mainGridHeader.hide_eventparamkey,
                    width : 150
        });
	if(mainGridHeader.owneruserid === true)
        curColConfig.push({
                    header : mainGridHeader.header_owneruserid,
                    dataIndex : 'owneruserid',
                    sortable: true,
                    hidden: mainGridHeader.hide_owneruserid,
                    width : 150
        });
	if(mainGridHeader.scrq === true)
        curColConfig.push({
                    header : mainGridHeader.header_scrq,
                    dataIndex : 'scrq',
                    sortable: true,
                    hidden: mainGridHeader.hide_scrq,
                    width : 150
        });
    curColConfig.push({
                dataIndex : '_blank',
                id : '_blank'
    });
    cm.setConfig(curColConfig);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : './queryForManage.action'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [
							{
							 name : 'caleventid'
							},
							{
							 name : 'eventtitle'
							},
							{
							 name : 'isallday'
							},
							{
							 name : 'whenbegin'
							},
							{
							 name : 'whenend'
							},
							{
							 name : 'eventtype'
							},
							{
							 name : 'reminder'
							},
							{
							 name : 'notes'
							},
							{
							 name : 'location'
							},
							{
							 name : 'weblink'
							},
							{
							 name : 'eventowner'
							},
							{
							 name : 'eventparamkey'
							},
							{
							 name : 'owneruserid'
							},
							{
							 name : 'scrq'
							}
							])
			});

	var pagesize_combo = new Ext.form.ComboBox({
				name : 'pagesize',
				hiddenName : 'pagesize',
				typeAhead : true,
				triggerAction : 'all',
				lazyRender : true,
				mode : 'local',
				store : new Ext.data.ArrayStore({
							fields : ['value', 'text'],
							data : [[10, '10条/页'], [20, '20条/页'],
									[50, '50条/页'], [100, '100条/页'],
									[250, '250条/页'], [500, '500条/页']]
						}),
				valueField : 'value',
				displayField : 'text',
				value : '50',
				editable : false,
				width : 85
			});
	var number = parseInt(pagesize_combo.getValue());
	pagesize_combo.on("select", function(comboBox) {
				bbar.pageSize = parseInt(comboBox.getValue());
				number = parseInt(comboBox.getValue());
				store.reload({
							params : {
								start : 0,
								limit : bbar.pageSize
							}
						});
			});

	var bbar = new Ext.PagingToolbar({
				pageSize : number,
				store : store,
				displayInfo : true,
				displayMsg : '显示{0}条到{1}条,共{2}条',
				plugins : new Ext.ux.ProgressBarPager(), // 分页进度条
				emptyMsg : "没有符合条件的记录",
				items : ['-', '&nbsp;&nbsp;', pagesize_combo]
			});
	
	var searchMenu = new Ext.menu.Menu({
		  //maxHeight: 400,
		  listeners: {
		    'beforerender': function (m) {
		          for (var i = 0; i < GyCalendarEventColumnStore.getCount(); i++) {
		        	  var nItem = new Ext.menu.CheckItem({
		        		  text: GyCalendarEventColumnStore.getAt(i).get('text'),
		        		  checked : false,
		        		  hideOnClick: false,
		        		  checkHandler: function(item) {
		        			  selectSearchItem(item.checked, item.text);
		        		  }
		        	  });
		        	  m.addItem(nItem);
		          }
		    }
		  }
	});
	function selectSearchItem(checked, itemText) {
		var itemValue = '';
		for (var i = 0; i < GyCalendarEventColumnStore.getCount(); i++) {
      	  if(itemText == GyCalendarEventColumnStore.getAt(i).get('text')) {
      		  itemValue = GyCalendarEventColumnStore.getAt(i).get('value');
      		  break;
      	  }
        }
		var selectedColumnArr = searchColumnParam.split(',');
		if(checked) {
			selectedColumnArr.push(itemValue);
		}
		else {
			selectedColumnArr.remove(itemValue);
		}
		searchColumnParam = selectedColumnArr.join();
	}

	var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">日历事件管理列表</span>',
				height : 500,
				// width:600,
				autoScroll : true,
				region : 'center',
				margins : '3 3 3 3',
				store : store,
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
				stripeRows : true,
				frame : true,
				autoExpandColumn : '_blank',
				cm : cm,
				sm : sm,
				plugins : expander,
				tbar : [{
							text : '新增',
							id: 'id_add_button',
							iconCls : 'page_addIcon',
							handler : function() {
								addInit();
							}
						}, '-', {
							text : '修改',
							id: 'id_update_button',
							iconCls : 'page_edit_1Icon',
							handler : function() {
								editInit();
							}
						}, '-', {
							text : '删除',
							id: 'id_delete_button',
							iconCls : 'page_delIcon',
							handler : function() {
								deleteItems();
							}
						},
						/*
						 '-', {
							text : '查看',
							id: 'id_view_button',
							iconCls : 'application_view_listIcon',
							handler : function() {
								viewItems();
							}
						},
						*/
						 '-', {
							text : '组合查询',
							id: 'id_query_button',
							iconCls : 'previewIcon',
							handler : function() {
								qWindow.show();
							}
						}, '->',
						 {
							id : 'id_search_button',
							name : 'id_search_button',
							text : '搜索',
							menu : searchMenu
						},
						new Ext.form.TextField({
							id : 'searchColumnParamValue',
							name : 'searchColumnParamValue',
							emptyText : '选择搜索列,输入查询条件',
							enableKeyEvents : true,
							listeners : {
								specialkey : function(field, e) {
									if (e.getKey() == Ext.EventObject.ENTER) {
										searchColumn();
									}
								}
							},
							width : 150
						}), {
							text : '',
							iconCls : 'previewIcon',
							handler : function() {
								searchColumn();
							}
						}, '-', {
							text : '刷新',
							id: 'id_refresh_button',
							iconCls : 'page_refreshIcon',
							handler : function() {
								store.reload();
							}
						}, '-', {
							text : '导出Excel',
							id: 'id_export_button',
							iconCls : 'page_excelIcon',
							handler : function() {
								var exportUrl = './exportItem.action?1=1';
								exportExcelWindow(exportUrl, GyCalendarEventColumnStore);
							}
						}],
				bbar : bbar
			});
	//进入列表默认查询所有
	store.load({
				params : {
					start : 0,
					limit : bbar.pageSize,
					menuid: menuid
				}
			});
	grid.on('rowdblclick', function(grid, rowIndex, event) {
				//editInit();
			});
	grid.on('sortchange', function() {
				// grid.getSelectionModel().selectFirstRow();
			});

	bbar.on("change", function() {
				// grid.getSelectionModel().selectFirstRow();
			});

	var addFormPanel = new Ext.form.FormPanel({
				id : 'addFormPanel',
				name : 'addFormPanel',
				labelAlign : 'right',
				labelWidth : 120,
				frame : false,
				autoScroll:true,
				bodyStyle : 'padding:5 5 0',
				items : [
							{
								fieldLabel : '日历事件标题',
								name : 'eventtitle',
								id : 'eventtitle',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '全天事件',
								name : 'isallday',
								id : 'isallday',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '事件开始时间',
								name : 'whenbegin',
								id : 'whenbegin',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '事件结束时间',
								name : 'whenend',
								id : 'whenend',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '事件类型（工作|学习|娱乐|生活）',
								name : 'eventtype',
								id : 'eventtype',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '提醒方式',
								name : 'reminder',
								id : 'reminder',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '备注信息',
								name : 'notes',
								id : 'notes',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '地点',
								name : 'location',
								id : 'location',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : 'Web链接',
								name : 'weblink',
								id : 'weblink',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '事件属主（public|private）',
								name : 'eventowner',
								id : 'eventowner',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '事件对应的gy_param里的key',
								name : 'eventparamkey',
								id : 'eventparamkey',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '私有事件的用户名',
								name : 'owneruserid',
								id : 'owneruserid',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							},
							{
								fieldLabel : '',
								name : 'scrq',
								id : 'scrq',
								xtype:"textfield",
								allowBlank : true, // 是否允许为空
								anchor : '99%'
							}
						,{
							id : 'caleventid',
							name : 'caleventid',
							xtype:"textfield",
							hidden : true
						},{
							id : 'windowmode',
							name : 'windowmode',
							xtype:"textfield",
							hidden : true
						}]
			});

	var addWindow = new Ext.Window({
				layout : 'fit',
				width : 450,
				height : 350,
				resizable : true,
				draggable : true,
				closeAction : 'hide',
				title : '<span class="commoncss">新增日历事件管理</span>',
				modal : true,
				collapsible : true,
				titleCollapse : false,
				maximizable : true,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				//pageY : 20,
				//pageX : document.body.clientWidth / 2 - 420 / 2,
				animateTarget : Ext.getBody(),
				constrain : true,
				items : [addFormPanel],
				buttons : [{
					text : '保存',
					id : 'btnSave',
					iconCls : 'acceptIcon',
					handler : function() {
						var mode = Ext.getCmp('windowmode').getValue();
						if (mode == 'add')
							saveItem();
						else
							updateItem();
					}
				},
				/* {
					text : '重置',
					id : 'btnReset',
					iconCls : 'tbar_synchronizeIcon',
					handler : function() {
					}
				},*/
				 {
					text : '关闭',
					id : 'btnClose',
					iconCls : 'deleteIcon',
					handler : function() {
						addWindow.hide();
					}
				}]
			});

	/**
	 * 布局
	 */
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [grid]
			});

	/**
	 * 通用搜索列
	 */
	function searchColumn() {
		// 翻页排序时带上查询条件
		store.on('beforeload', function() {
			this.baseParams = {
				menuid: menuid,
				searchColumnParam: searchColumnParam,
				searchColumnParamValue : Ext.getCmp('searchColumnParamValue').getValue()
			}
		});
		store.load( {
			params : {
				start : 0,
				limit : bbar.pageSize,
				menuid: menuid,
				searchColumnParam: searchColumnParam,
				searchColumnParamValue : Ext.getCmp('searchColumnParamValue').getValue()
			}
		});
	}

	/**
	 * 新增日历事件管理初始化
	 */
	function addInit() {
		var flag = Ext.getCmp('windowmode').getValue();
		if (typeof(flag) != 'undefined') {
			addFormPanel.form.getEl().dom.reset();
		} 
		addWindow.show();
		addWindow.setTitle('<span class="commoncss">新增日历事件管理</span>');
		Ext.getCmp('windowmode').setValue('add');

	}

	/**
	 * 新增日历事件管理数据
	 */
	function saveItem() {
		if (!addFormPanel.form.isValid()) {
			return;
		}
		addFormPanel.form.submit({
					url : './saveItem.action',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						addWindow.hide();
						store.reload();
						form.reset();
						Ext.Msg.alert('提示', '新增日历事件管理成功');
					},
					failure : function(form, action) {
						top.showException(action.response.responseText);
					}
				});
	}

	/**
	 * 修改日历事件管理初始化
	 */
	function editInit() {
		var record = grid.getSelectionModel().getSelected();
		if (Ext.isEmpty(record)) {
			Ext.Msg.alert('提示', '请先选中要修改的日历事件管理');
			return;
		}
		addFormPanel.getForm().loadRecord(record);
		addWindow.show();
		addWindow.setTitle('<span class="commoncss">修改日历事件管理</span>');
		Ext.getCmp('windowmode').setValue('edit');
		Ext.getCmp('caleventid').setValue(record.get('caleventid'));
	}

	/**
	 * 修改日历事件管理数据
	 */
	function updateItem() {
		if (!addFormPanel.form.isValid()) {
			return;
		}
		addFormPanel.form.submit({
                    url : './updateItem.action',
                    waitTitle : '提示',
                    method : 'POST',
                    waitMsg : '正在处理数据,请稍候...',
                    success : function(form, action) {
                        addWindow.hide();
                        store.reload();
                        form.reset();
                        Ext.Msg.alert('提示', '修改日历事件管理成功');
                    },
                    failure : function(form, action) {
                        top.showException(action.response.responseText);
                    }
                });
	}

	
	/**
	 * 删除日历事件管理
	 */
	function deleteItems() {
		var rows = grid.getSelectionModel().getSelections();
		if (Ext.isEmpty(rows)) {
			Ext.Msg.alert('提示', '请先选中要删除的日历事件管理!');
			return;
		}
		var strChecked = jsArray2JsString(rows, 'caleventid');
		Ext.Msg.confirm('请确认', '确认删除选中的日历事件管理吗?', function(btn, text) {
					if (btn == 'yes') {
						showWaitMsg();
						Ext.Ajax.request({
							url : './deleteItems.action',
							success : function(response) {
								var resultArray = Ext.util.JSON.decode(response.responseText);
								store.reload();
								Ext.Msg.alert('提示', '删除日历事件管理成功');
							},
							params : {
								strChecked : strChecked
							}
						});
					}
				});
	}
});

