/**
 * 数据规则人员授权
 * 
 * @author zhaozehui
 */
Ext.onReady(function() {
	var menuid;
	var userid;

	var root = new Ext.tree.AsyncTreeNode({
				text : root_deptname,
				expanded : true,
				id : root_deptid
			});
	var deptTree = new Ext.tree.TreePanel({
				loader : new Ext.tree.TreeLoader({
							baseAttrs : {},
							dataUrl : 'ruleUser.do?reqCode=departmentTreeInit'
						}),
				root : root,
				title : '',
				applyTo : 'deptTreeDiv',
				autoScroll : false,
				animate : false,
				useArrows : false,
				border : false
			});
	deptTree.root.select();
	deptTree.on('click', function(node) {
				deptid = node.attributes.id;
				store.load({
							params : {
								start : 0,
								limit : bbar.pageSize,
								deptid : deptid
							}
						});
			});

	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		header : '授权',
		dataIndex : 'userid',
		renderer : function(value, cellmeta, record) {
			return '<a href="javascript:void(0);"><img src="./resource/image/ext/edit1.png"/></a>';
		},
		width : 35
	}, {
		header : '姓名',
		dataIndex : 'username',
		width : 150
	}, {
		header : '登录帐户',
		dataIndex : 'account',
		width : 110
	}, {
		id : 'deptname',
		header : '所属部门',
		dataIndex : 'deptname',
		width : 100
	}, {
		header : '性别',
		dataIndex : 'sex',
		width : 60,
		renderer : SEXRender
	}, {
		id : 'usertype',
		header : '人员类型',
		dataIndex : 'usertype',
		width : 100,
		renderer : USERTYPERender
	}, {
		header : '人员状态',
		dataIndex : 'locked',
		width : 60,
		renderer : LOCKEDRender
	}, {
		header : '人员编号',
		dataIndex : 'userid',
		hidden : false,
		hidden : false,
		width : 80,
		sortable : true
	}, {
		id : 'remark',
		header : '备注',
		dataIndex : 'remark'
	}, {
		id : 'deptid',
		header : '所属部门编号',
		dataIndex : 'deptid',
		hidden : true
	}]);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : './user.do?reqCode=queryUsersForManage'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'TOTALCOUNT',
							root : 'ROOT'
						}, [{
									name : 'userid'
								}, {
									name : 'username'
								}, {
									name : 'sex'
								}, {
									name : 'account'
								}, {
									name : 'locked'
								}, {
									name : 'deptid'
								}, {
									name : 'deptname'
								}, {
									name : 'remark'
								}, {
									name : 'usertype'
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
				emptyMsg : "没有符合条件的记录",
				items : ['-', '&nbsp;&nbsp;', pagesize_combo]
			});
	var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">人员信息表</span>',
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
				tbar : [new Ext.form.TextField({
									id : 'queryParam',
									name : 'queryParam',
									emptyText : '请输入人员名称',
									enableKeyEvents : true,
									listeners : {
										specialkey : function(field, e) {
											if (e.getKey() == Ext.EventObject.ENTER) {
												queryUserItem();
											}
										}
									},
									width : 150
								}), {
							text : '查询',
							iconCls : 'previewIcon',
							handler : function() {
								queryUserItem();
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
					limit : bbar.pageSize,
					firstload : 'true'
				}
			});

	grid.on('sortchange', function() {
				// grid.getSelectionModel().selectFirstRow();
			});
	grid.on("cellclick", function(grid, rowIndex, columnIndex, e) {
				var store = grid.getStore();
				var record = store.getAt(rowIndex);
				var fieldName = grid.getColumnModel().getDataIndex(columnIndex);
				if (fieldName == 'userid' && columnIndex == 1) {
					userid = record.get('userid');
					userGrantWindow.show();
					userGrantWindow.setTitle('<span class="commoncss">授权数据规则[人员:'+record.get('username')+']</span>');
				}
			});

	bbar.on("change", function() {
				// grid.getSelectionModel().selectFirstRow();
			});

	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [{
							title : '<span class="commoncss">组织机构</span>',
							iconCls : 'chart_organisationIcon',
							tools : [{
										id : 'refresh',
										handler : function() {
											deptTree.root.reload()
										}
									}],
							collapsible : true,
							width : 210,
							minSize : 160,
							maxSize : 280,
							split : true,
							region : 'west',
							margins : '3 3 3 3',
							autoScroll : true,
							// collapseMode:'mini',
							items : [deptTree]
						}, grid]
			});

	/**
	 * 根据条件查询人员
	 */
	function queryUserItem() {
		var selectModel = deptTree.getSelectionModel();
		var selectNode = selectModel.getSelectedNode();
		var deptid = selectNode.attributes.id;
		store.load({
					params : {
						start : 0,
						limit : bbar.pageSize,
						queryParam : Ext.getCmp('queryParam').getValue(),
						deptid : deptid
					}
				});
	}

	
	//数据规则授权
	var sm_rule = new Ext.grid.CheckboxSelectionModel();
	var cm_rule = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm_rule,
			 {
				id: 'rulename',
				header : '数据规则名称',
				dataIndex : 'rulename',
				sortable: true,
				width : 200
			}, {
				id : 'ruleobject',
				header : '数据规则适用对象',
				dataIndex : 'ruleobject',
				width : 110,
				sortable: true,
				renderer : DATARULERender
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
	var store_rule = new Ext.data.Store({
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
									name : 'locked'
								}, {
									name : 'ruleid'
								}, {
									name : 'remark'
								}])
			});


	var grid_rule = new Ext.grid.GridPanel({
				// width:600,
				title : '<img src="./resource/image/ext/wrench.png" align="top" class="IEPNG"> 选择数据规则',
				autoScroll : true,
				region : 'center',
				margins : '0 0 0 0',
				store : store_rule,
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
				stripeRows : true,
				frame : true,
				cm : cm_rule,
				sm : sm_rule,
				tbar : [{
					text : '授权菜单：',
					id : 'selectMenu4SaveText'
			    }, '-', {
					text : '保存',
					id : 'selectRule_saveBtn',
					iconCls : 'acceptIcon',
					handler : function() {
						saveRuleItems();
					 }
			    }, '-', {
					text : '重置',
					iconCls : 'deleteIcon',
					handler : function() {
						resetRuleChecked();
					}
			    },'->',
						new Ext.form.TextField({
							id : 'queryRuleParam',
							name : 'queryRuleParam',
							emptyText : '请输入数据规则名称',
							enableKeyEvents : true,
							listeners : {
								specialkey : function(field, e) {
									if (e.getKey() == Ext.EventObject.ENTER) {
										queryRuleParam();
									}
								}
							},
							width : 150
						}), {
					text : '查询',
					iconCls : 'previewIcon',
					handler : function() {
						queryRuleParam();
					}
				}, '-', {
					text : '刷新',
					iconCls : 'arrow_refreshIcon',
					handler : function() {
						store_rule.reload();
					}
				}]
			});

	/**
	 * 查询数据规则
	 */
	function queryRuleParam() {
		store_rule.load({
					params : {
						queryParam : Ext.getCmp('queryRuleParam').getValue()
					}
				});
	}

	var menu_root = new Ext.tree.AsyncTreeNode({
		text : root_menuname,
		expanded : true,
		id : '01'
	});

	var menuTreePanel = new Ext.tree.TreePanel({
			loader : new Ext.tree.TreeLoader({
						baseAttrs : {},
						dataUrl : 'part.do?reqCode=queryMenuItems'
					}),
			root : menu_root,
			title : '<span class="commoncss">功能菜单</span>',
			region : 'west',
			split : true,
			width : 220,
			minSize : 180,
			maxSize : 300,
			collapsible : true,
			autoScroll : true,
			animate : false
		});
	menuTreePanel.on('click', function(node) {
			if (!node.isLeaf()) {
				return;
			}
			Ext.getCmp('selectMenu4SaveText').setText('授权菜单：'+node.text);
			menuid = node.id
			store_rule.load({
						params : {
							start : 0,
							limit : 50,
							menuid : menuid,
							userid : userid
						}
					});
		});
	
	var userGrantTabPanel = new Ext.TabPanel({
				activeTab : 0,
				width : 600,
				margins : '3 3 3 3',
				region:'center',
				plain : true,// True表示为不渲染tab候选栏上背景容器图片
				defaults : {
					autoScroll : true
				}
			});

	userGrantTabPanel.add(grid_rule);
	
	var userGrantWindow = new Ext.Window({
				layout : 'border',
				width : document.body.clientWidth - 200,
				height : document.body.clientHeight - 30,
				resizable : true,
				draggable : true,
				closeAction : 'hide',
				closable : true,
				title : '<span class="commoncss">授权数据规则</span>',
				modal : true,
				collapsible : true,
				titleCollapse : true,
				maximizable : true,
				animateTarget: document.body,
				// //如果使用autoLoad,建议不要使用动画效果
				buttonAlign : 'right',
				constrain : true,
				border : false,
				items : [menuTreePanel, userGrantTabPanel],
				buttons : [{
							text : '关闭',
							iconCls : 'deleteIcon',
							handler : function() {
								userGrantWindow.hide();
							}
						}]
			});
	
	
	
	userGrantWindow.on('show', function() {
		menuTreePanel.getRootNode().reload();
		//store_rule.load();
		store_rule.removeAll();
	});
	store_rule.on('load', function() {
		resetRuleChecked();
	})
	
	function resetRuleChecked() {
		var selectModel = menuTreePanel.getSelectionModel();
		var selectNode = selectModel.getSelectedNode();
		if(!selectNode || !selectNode.isLeaf()) {
			//Ext.Msg.alert("提示", "请选择要授权的对应菜单资源");
			return;
		}
		var menuid = selectNode.attributes.id;
		Ext.Ajax.request({
			url : 'ruleUser.do?reqCode=queryRuleList4Grant',
			success : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);

				var st = grid_rule.getStore();
				sm_rule.clearSelections();
				
				if(resultArray.TOTALCOUNT > 0) {
					
					for(var j = 0; j < st.getTotalCount(); j++) {
						var re = st.getAt(j);
						
						for(var k = 0; k < resultArray.TOTALCOUNT; k++) {
							if(re.get('ruleid') == resultArray.ROOT[k].ruleid) {
								sm_rule.selectRow(j, true);
								break;
							}
						}
						
					}
				}
				
			},
			failure : function(response) {
				//Ext.MessageBox.alert('提示', '数据保存失败');
			},
			params : {
				userid: userid,
				menuid: menuid
			}
		});
	}
	
	function saveRuleItems() {
		var selectModel = menuTreePanel.getSelectionModel();
		var selectNode = selectModel.getSelectedNode();
		if(!selectNode || !selectNode.isLeaf()) {
			Ext.Msg.alert("提示", "请选择要授权的对应菜单资源");
			return;
		}
		var menuid = selectNode.attributes.id;
		var rows = grid_rule.getSelectionModel().getSelections();
		//if (Ext.isEmpty(rows)) {
			//Ext.Msg.alert('提示', '请先选中要授权的规则!');
			//return;
		//}
		var strChecked = jsArray2JsString(rows, 'ruleid');
		//showWaitMsg();
		Ext.Ajax.request({
			url : './ruleUser.do?reqCode=saveRuleUserGrantDatas',
			success : function(response) {
				var resultArray = Ext.util.JSON
						.decode(response.responseText);
				store.reload();
				Ext.Msg.alert('提示','数据规则授权成功');
			},
			failure : function(response) {
				var resultArray = Ext.util.JSON
						.decode(response.responseText);
				Ext.Msg.alert('提示', resultArray.msg);
			},
			params : {
				strChecked : strChecked,
				userid: userid,
				menuid: menuid
			}
		});
	}

	
});