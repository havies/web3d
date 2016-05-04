/**
 * 数据规则管理
 * 
 * @author zhaozehui
 */
Ext.onReady(function() {
	
	var sm = new Ext.grid.CheckboxSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm,
			 {
				id: 'rulename',
				header : '数据规则名称',
				dataIndex : 'rulename',
				width : 200
			}, {
				id : 'ruleobject',
				header : '数据规则适用对象',
				dataIndex : 'ruleobject',
				width : 110,
				renderer : DATARULERender
			}, {
				id: 'datacond',
				header : '数据规则范围条件',
				dataIndex : 'datacond',
				width : 250
			}, {
				id: 'locked',
				header : '规则状态',
				dataIndex : 'locked',
				width : 60,
				renderer : LOCKEDRender
			}, {
				id: 'ruleid',
				header : '数据规则编号',
				dataIndex : 'ruleid',
				width : 80,
				hidden: true
			}, {
				id : 'remark',
				header : '备注',
				dataIndex : 'remark'
			}]);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : './rule.do?reqCode=queryRulesForManage'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [{
									name : 'rulename'
								}, {
									name : 'ruleobject'
								}, {
									name : 'datacond'
								}, {
									name : 'locked'
								}, {
									name : 'ruleid'
								}, {
									name : 'remark'
								}])
			});

	// 翻页排序时带上查询条件
	store.on('beforeload', function() {
				this.baseParams = {
					queryParam : Ext.getCmp('queryParam').getValue()
				};
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

	var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">数据规则表</span>',
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
				autoExpandColumn : 'remark',
				cm : cm,
				sm : sm,
				tbar : [{
							text : '新增',
							iconCls : 'page_addIcon',
							handler : function() {
								addInit();
							}
						}, '-', {
							text : '修改',
							iconCls : 'page_edit_1Icon',
							handler : function() {
								editInit();
							}
						}, '-', {
							text : '删除',
							iconCls : 'page_delIcon',
							handler : function() {
								deleteParamItems();
							}
						}, '->',
						new Ext.form.TextField({
									id : 'queryParam',
									name : 'queryParam',
									emptyText : '请输入数据规则名称',
									enableKeyEvents : true,
									listeners : {
										specialkey : function(field, e) {
											if (e.getKey() == Ext.EventObject.ENTER) {
												queryParamItem();
											}
										}
									},
									width : 150
								}), {
							text : '查询',
							iconCls : 'previewIcon',
							handler : function() {
								queryParamItem();
							}
						}, '-', {
							text : '刷新',
							iconCls : 'arrow_refreshIcon',
							handler : function() {
								store.reload();
							}
						}],
				bbar : bbar
			});
	store.load({
				params : {
					start : 0,
					limit : bbar.pageSize
				}
			});
	grid.on('rowdblclick', function(grid, rowIndex, event) {
				editInit();
			});
	grid.on('sortchange', function() {
				// grid.getSelectionModel().selectFirstRow();
			});

	bbar.on("change", function() {
				// grid.getSelectionModel().selectFirstRow();
			});

	
	var lockedCombo = new Ext.form.ComboBox({
			name : 'locked',
			hiddenName : 'locked',
			store : LOCKEDStore,
			mode : 'local',
			triggerAction : 'all',
			valueField : 'value',
			displayField : 'text',
			value : '0',
			fieldLabel : '规则状态',
			emptyText : '请选择...',
			labelStyle : micolor,
			allowBlank : false,
			forceSelection : true,
			editable : false,
			typeAhead : true,
			anchor : "99%"
	});

	var ruleobjectCombo = new Ext.form.ComboBox({
			name : 'ruleobject',
			hiddenName : 'ruleobject',
			store : DATARULEStore,
			mode : 'local',
			triggerAction : 'all',
			valueField : 'value',
			displayField : 'text',
			value : '1',
			fieldLabel : '数据规则适用对象',
			emptyText : '请选择...',
			labelStyle : micolor,
			allowBlank : false,
			forceSelection : true,
			editable : false,
			typeAhead : true,
			anchor : "99%"
	});
	
	var addParamFormPanel = new Ext.form.FormPanel({
				id : 'addParamFormPanel',
				name : 'addParamFormPanel',
				defaultType : 'textfield',
				labelAlign : 'right',
				labelWidth : 150,
				frame : false,
				bodyStyle : 'padding:5 5 0',
				items : [{
							fieldLabel : '数据规则名称',
							name : 'rulename',
							id : 'rulename',
							labelStyle : micolor,
							allowBlank : false,
							anchor : '99%'
						}, ruleobjectCombo, {
							fieldLabel : '数据规则范围条件',
							name : 'datacond',
							id : 'datacond',
							allowBlank : false,
							labelStyle : micolor,
							xtype : 'textarea',
							anchor : '99%'
						},
						 lockedCombo,{
							fieldLabel : '备注',
							name : 'remark',
							allowBlank : true,
							anchor : '99%'
						}, {
							id : 'ruleid',
							name : 'ruleid',
							hidden : true
						}, {
							id : 'windowmode',
							name : 'windowmode',
							hidden : true
						}]
			});

	var addParamWindow = new Ext.Window({
				layout : 'fit',
				width : 500,
				height : 250,
				resizable : false,
				draggable : true,
				closeAction : 'hide',
				title : '<span class="commoncss">新增数据规则</span>',
				modal : true,
				collapsible : true,
				titleCollapse : true,
				maximizable : false,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				pageY : 20,
				pageX : document.body.clientWidth / 2 - 420 / 2,
				animateTarget : Ext.getBody(),
				constrain : true,
				items : [addParamFormPanel],
				buttons : [{
					text : '保存',
					iconCls : 'acceptIcon',
					handler : function() {
						var mode = Ext.getCmp('windowmode').getValue();
						if (mode == 'add')
							saveParamItem();
						else
							updateParamItem();
					}
				}, {
					text : '重置',
					id : 'btnReset',
					iconCls : 'tbar_synchronizeIcon',
					handler : function() {
						clearForm(addParamFormPanel.getForm());
					}
				}, {
					text : '关闭',
					iconCls : 'deleteIcon',
					handler : function() {
						addParamWindow.hide();
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
	 * 查询数据规则
	 */
	function queryParamItem() {
		store.load({
					params : {
						start : 0,
						limit : bbar.pageSize,
						queryParam : Ext.getCmp('queryParam').getValue()
					}
				});
	}

	/**
	 * 新增数据规则初始化
	 */
	function addInit() {
		Ext.getCmp('btnReset').hide();
		// clearForm(addParamFormPanel.getForm());
		var flag = Ext.getCmp('windowmode').getValue();
		if (typeof(flag) != 'undefined') {
			addParamFormPanel.form.getEl().dom.reset();
		} else {
			clearForm(addParamFormPanel.getForm());
		}
		addParamWindow.show();
		addParamWindow
				.setTitle('<span class="commoncss">新增数据规则</span>');
		Ext.getCmp('windowmode').setValue('add');
		lockedCombo.setValue('0');
	}

	/**
	 * 保存数据规则数据
	 */
	function saveParamItem() {
		if (!addParamFormPanel.form.isValid()) {
			return;
		}
		addParamFormPanel.form.submit({
					url : './rule.do?reqCode=saveRuleItem',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						addParamWindow.hide();
						store.reload();
						form.reset();
						Ext.Msg.alert('提示','数据规则新增成功');
					},
					failure : function(form, action) {
						var msg = action.result.msg;
						Ext.MessageBox.alert('提示', '数据规则数据保存失败:<br>' + msg);
					}
				});
	}

	/**
	 * 删除数据规则
	 */
	function deleteParamItems() {
		var rows = grid.getSelectionModel().getSelections();
		if (Ext.isEmpty(rows)) {
			Ext.Msg.alert('提示', '请先选中要删除的项目!');
			return;
		}
		var strChecked = jsArray2JsString(rows, 'ruleid');
		Ext.Msg.confirm('请确认', '确认删除选中的数据规则吗?', function(btn, text) {
					if (btn == 'yes') {
						showWaitMsg();
						Ext.Ajax.request({
									url : './rule.do?reqCode=deleteRuleItems',
									success : function(response) {
										var resultArray = Ext.util.JSON
												.decode(response.responseText);
										store.reload();
										Ext.Msg.alert('提示','数据规则删除成功');
									},
									failure : function(response) {
										var resultArray = Ext.util.JSON
												.decode(response.responseText);
										Ext.Msg.alert('提示', resultArray.msg);
									},
									params : {
										strChecked : strChecked
									}
								});
					}
				});
	}

	/**
	 * 修改数据规则初始化
	 */
	function editInit() {
		var record = grid.getSelectionModel().getSelected();
		if (Ext.isEmpty(record)) {
			Ext.MessageBox.alert('提示', '请先选中要修改的项目');
			return;
		}
		addParamFormPanel.getForm().loadRecord(record);
		addParamWindow.show(); 
		addParamWindow
				.setTitle('<span class="commoncss">修改数据规则</span>');
		Ext.getCmp('windowmode').setValue('edit');
		Ext.getCmp('ruleid').setValue(record.get('ruleid'));
		Ext.getCmp('btnReset').hide();
	}

	/**
	 * 修改数据规则数据
	 */
	function updateParamItem() {
		if (!addParamFormPanel.form.isValid()) {
			return;
		}
		update();
	}

	/**
	 * 更新
	 */
	function update() {
		addParamFormPanel.form.submit({
					url : './rule.do?reqCode=updateRuleItem',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						addParamWindow.hide();
						store.reload();
						form.reset();
						Ext.Msg.alert('提示','数据规则修改成功');
					},
					failure : function(form, action) {
						var msg = action.result.msg;
						Ext.MessageBox.alert('提示', '数据修改失败:<br>' + msg);
					}
				});
	}
});