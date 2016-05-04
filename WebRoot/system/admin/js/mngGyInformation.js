/**
 * 信息发布管理管理
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-09
 */
Ext.onReady(function() {
	var searchColumnParam = '';
	
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
	
	var expander = new Ext.grid.RowExpander({
		tpl : new Ext.Template(
            '<table id="previewCardTable" border="0" width="500">',
			mainGridHeader.module === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_module+'：</span></td><td><span>{module}</span></td></tr>':'',
			mainGridHeader.title === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_title+'：</span></td><td><span>{title}</span></td></tr>':'',
			mainGridHeader.assignrolename === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_assignrolename+'：</span></td><td><span>{assignrolename}</span></td></tr>':'',
			mainGridHeader.content === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_content+'：</span></td><td><span>{content}</span></td></tr>':'',
			mainGridHeader.attachment === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_attachment+'：</span></td><td><span>{attachment}</span></td></tr>':'',
			mainGridHeader.istop === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_istop+'：</span></td><td><span>{istop}</span></td></tr>':'',
			mainGridHeader.readcount === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_readcount+'：</span></td><td><span>{readcount}</span></td></tr>':'',
			mainGridHeader.createuser === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_createuser+'：</span></td><td><span>{createuser}</span></td></tr>':'',
			mainGridHeader.createtime === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_createtime+'：</span></td><td><span>{createtime}</span></td></tr>':'',
			mainGridHeader.updateuser === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_updateuser+'：</span></td><td><span>{updateuser}</span></td></tr>':'',
			mainGridHeader.updatetime === true?'<tr><td width="40%"><span style=color:Teal;>'+mainGridHeader.header_updatetime+'：</span></td><td><span>{updatetime}</span></td></tr>':'',
			'</table>'
			),
            expandOnDblClick : true
	});
	var sm = new Ext.grid.CheckboxSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, expander]);
	var curColConfig = cm.config;
	if(mainGridHeader.module === true)
        curColConfig.push({
                    header : mainGridHeader.header_module,
                    dataIndex : 'module',
                    sortable: true,
                    hidden: mainGridHeader.hide_module,
                    width : 100,
                    renderer: Ext.ux.comboBoxRenderer(moduleComboBox)
        });
	if(mainGridHeader.title === true)
        curColConfig.push({
                    header : mainGridHeader.header_title,
                    dataIndex : 'title',
                    sortable: true,
                    hidden: mainGridHeader.hide_title,
                    width : 450,
                    renderer: function (data, metadata, record, rowIndex, columnIndex, store) {  
                        var informationid = store.getAt(rowIndex).get('informationid');  
                        var title = store.getAt(rowIndex).get('title');  
                        return '<a href="javascript:">' + title + '</a>';  
                    }
        });
	if(mainGridHeader.attachment === true)
        curColConfig.push({
                    header : mainGridHeader.header_attachment,
                    dataIndex : 'attachment',
                    sortable: true,
                    hidden: mainGridHeader.hide_attachment,
                    width : 150
        });
	if(mainGridHeader.assignrolename === true)
        curColConfig.push({
                    header : mainGridHeader.header_assignrolename,
                    dataIndex : 'assignrolename',
                    sortable: true,
                    hidden: mainGridHeader.hide_assignrolename,
                    width : 150
        });
	if(mainGridHeader.istop === true)
        curColConfig.push({
                    header : mainGridHeader.header_istop,
                    dataIndex : 'istop',
                    sortable: true,
                    hidden: mainGridHeader.hide_istop,
                    width : 80
        });
	if(mainGridHeader.readcount === true)
        curColConfig.push({
                    header : mainGridHeader.header_readcount,
                    dataIndex : 'readcount',
                    sortable: true,
                    hidden: mainGridHeader.hide_readcount,
                    width : 150
        });
	if(mainGridHeader.createuser === true)
        curColConfig.push({
                    header : mainGridHeader.header_createuser,
                    dataIndex : 'createuser',
                    sortable: true,
                    hidden: mainGridHeader.hide_createuser,
                    width : 150
        });
	if(mainGridHeader.createtime === true)
        curColConfig.push({
                    header : mainGridHeader.header_createtime,
                    dataIndex : 'createtime',
                    sortable: true,
                    hidden: mainGridHeader.hide_createtime,
                    width : 150
        });
	if(mainGridHeader.updateuser === true)
        curColConfig.push({
                    header : mainGridHeader.header_updateuser,
                    dataIndex : 'updateuser',
                    sortable: true,
                    hidden: mainGridHeader.hide_updateuser,
                    width : 150
        });
	if(mainGridHeader.updatetime === true)
        curColConfig.push({
                    header : mainGridHeader.header_updatetime,
                    dataIndex : 'updatetime',
                    sortable: true,
                    hidden: mainGridHeader.hide_updatetime,
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
							url : './queryForManage.action?module='+module
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
							 name : 'content'
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
		          for (var i = 0; i < GyInformationColumnStore.getCount(); i++) {
		        	  var nItem = new Ext.menu.CheckItem({
		        		  text: GyInformationColumnStore.getAt(i).get('text'),
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
		for (var i = 0; i < GyInformationColumnStore.getCount(); i++) {
      	  if(itemText == GyInformationColumnStore.getAt(i).get('text')) {
      		  itemValue = GyInformationColumnStore.getAt(i).get('value');
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
				title : '<span class="commoncss">信息发布管理列表</span>',
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
						 '->',
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
								exportExcelWindow(exportUrl, GyInformationColumnStore);
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
	grid.on("cellclick", function(grid, rowIndex, columnIndex, e) {
		var store = grid.getStore();
		var record = store.getAt(rowIndex);
		var fieldName = grid.getColumnModel().getDataIndex(columnIndex);
		
		if (fieldName == 'title' && columnIndex == 4) {
			var informationid = record.get('informationid');  
            
			var url = 'view.action?informationid='+informationid;
            infoWindow.show();
            //window.frames["infomationViewIFrame"].location.replace(url);
            Ext.get('infomationViewIFrame').dom.src = url;
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
	
	
	var roleRoot = new Ext.tree.AsyncTreeNode( {
		text : root_rolename,
		expanded : true,
		id : root_roleid
	});
	var roleTree = new Ext.tree.TreePanel( {
		loader : new Ext.tree.TreeLoader( {
			baseParams : {multicheck:true},
			dataUrl : ctx+'/common.do?reqCode=getRolesOrderbySpec'
		}),
		root : roleRoot,
		autoScroll : true,
		animate : false,
		useArrows : true,
		border : false
	});
	var roleCombo = new Ext.form.ComboBox(
			{
				id : 'assignrolename',
				name: 'assignrolename',
				store : new Ext.data.SimpleStore( {
					fields : [],
					data : [ [] ]
				}),
				editable : false,
				emptyText : '请选择...',
				fieldLabel : '指定阅读角色',
				anchor : '50%',
				mode : 'local',
				triggerAction : 'all',
				maxHeight : 390,
				tpl : "<tpl for='.'><div style='height:390px'><div id='roleTreeDiv'></div></div></tpl>",
				allowBlank : true,
				onViewClick:Ext.emptyFn,
				beforeBlur:Ext.emptyFn,
				onSelect : Ext.emptyFn
			});
	roleCombo.on('expand', function() {
			roleTree.render('roleTreeDiv');
			//roleTree.root.reload(); 
			roleTree.root.expand(); 
		});
	roleCombo.on('collapse', function() {
	        var checkedNodes = roleTree.getChecked();
	        var str=[]; 
	        var strvalue=[]; 
	        Ext.each(checkedNodes, function(node) {
	        	str.push(node.attributes.text);  
	            strvalue.push(node.attributes.id); 
	        });
	        roleCombo.setValue(str.join());
	        Ext.getCmp("addFormPanel").findById('assignroleid').setValue(strvalue.join());
	});
	
	var addFormPanel = new Ext.form.FormPanel({
				id : 'addFormPanel',
				name : 'addFormPanel',
				labelAlign : 'right',
				labelWidth : 100,
				frame : false,
				autoScroll:true,
				fileUpload : true,
				bodyStyle : 'padding:5 5 0',
				items : [
							moduleComboBox,
							{
								name : 'module',
								id : 'module_single',
								xtype:"textfield",
								hidden : true,
								disabled: true
							},
							{
								fieldLabel : '信息标题',
								name : 'title',
								id : 'title',
								xtype:"textfield",
								allowBlank : false, // 是否允许为空
								anchor : '99%'
							},roleCombo,
							{
								id : 'content',
								name : 'content',
								fieldLabel : '信息内容<br/>(<font color=gray>支持直接拷贝Word文档</font>)',
								xtype : 'htmleditor',
								anchor : '99%',
								allowBlank : true,
								height: 300,
								plugins : [ new Ext.ux.form.HtmlEditor.Link(),
											new Ext.ux.form.HtmlEditor.Table(),
											new Ext.ux.form.HtmlEditor.HR(),
											new Ext.ux.form.HtmlEditor.Word() ]
							},
							{
			                    fieldLabel:"信息附件",
			                    name:"attachment1",
			                    id:"attachment1",
			                    inputType:"file",
			                    xtype:"textfield",
			                    //xtype:"fileuploadfield",
			                    labelStyle:"",
			                    allowBlank:true,
			                    anchor:"99%"
			                  },
							new Ext.form.ComboBox({
								name : 'istop',
								hiddenName : 'istop',
								store : SFStore,
								mode : 'local',
								triggerAction : 'all',
								valueField : 'value',
								displayField : 'text',
								fieldLabel : '是否置顶',
								value: '否',
								emptyText : '请选择...',
								forceSelection : true,
								editable : false,
								typeAhead : true,
								anchor : "50%"
							})
						,{
							id : 'assignroleid',
							name : 'assignroleid',
							xtype:"textfield",
							hidden : true
						},{
							id : 'informationid',
							name : 'informationid',
							xtype:"textfield",
							hidden : true
						},{
							id : 'windowmode',
							name : 'windowmode',
							xtype:"textfield",
							hidden : true
						}]
			});

	if(module != 'ALL') {
		moduleComboBox.setValue(module);
		moduleComboBox.setDisabled(true);
		moduleComboBox.hide();
		Ext.getCmp('module_single').setDisabled(false);
		Ext.getCmp('module_single').setValue(module);
	}
	
	var addWindow = new Ext.Window({
				layout : 'fit',
				width : 800,
				height : 480,
				resizable : true,
				draggable : true,
				closeAction : 'hide',
				title : '<span class="commoncss">新增信息发布管理</span>',
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
	 * 新增信息发布管理初始化
	 */
	function addInit() {
		var flag = Ext.getCmp('windowmode').getValue();
		if (typeof(flag) != 'undefined') {
			addFormPanel.form.getEl().dom.reset();
		} 
		addWindow.show();
		addWindow.setTitle('<span class="commoncss">新增信息发布管理</span>');
		Ext.getCmp('windowmode').setValue('add');
		Ext.getCmp('module_single').setValue(module);
		Ext.getCmp('content').setValue('');
	}

	/**
	 * 新增信息发布管理数据
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
						Ext.Msg.alert('提示', '新增信息发布管理成功');
					},
					failure : function(form, action) {
						top.showException(action.response.responseText);
					}
				});
	}

	/**
	 * 修改信息发布管理初始化
	 */
	function editInit() {
		var record = grid.getSelectionModel().getSelected();
		if (Ext.isEmpty(record)) {
			Ext.Msg.alert('提示', '请先选中要修改的信息发布管理');
			return;
		}
		addFormPanel.getForm().loadRecord(record);
		addWindow.show();
		addWindow.setTitle('<span class="commoncss">修改信息发布管理</span>');
		
	}

	/**
	 * 修改信息发布管理数据
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
                        Ext.Msg.alert('提示', '修改信息发布管理成功');
                    },
                    failure : function(form, action) {
                        top.showException(action.response.responseText);
                    }
                });
	}

	
	/**
	 * 删除信息发布管理
	 */
	function deleteItems() {
		var rows = grid.getSelectionModel().getSelections();
		if (Ext.isEmpty(rows)) {
			Ext.Msg.alert('提示', '请先选中要删除的信息发布管理!');
			return;
		}
		var strChecked = jsArray2JsString(rows, 'informationid');
		Ext.Msg.confirm('请确认', '确认删除选中的信息发布管理吗?', function(btn, text) {
					if (btn == 'yes') {
						showWaitMsg();
						Ext.Ajax.request({
							url : './deleteItems.action',
							success : function(response) {
								var resultArray = Ext.util.JSON.decode(response.responseText);
								store.reload();
								Ext.Msg.alert('提示', '删除信息发布管理成功');
							},
							params : {
								strChecked : strChecked
							}
						});
					}
				});
	}
});

