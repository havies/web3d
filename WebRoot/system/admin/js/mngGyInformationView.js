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
	moduleComboBox.on('select', function(combo){
		store.load({
			params : {
				start : 0,
				limit : bbar.pageSize,
				menuid: menuid,
				module: combo.getValue()
			}
		});
		
	});
	
	var sm = new Ext.grid.CheckboxSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm]);
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
							url : './queryForView.action'
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
				title : '<span class="commoncss">信息发布列表</span>',
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
				tbar : ['请选择模块:',moduleComboBox,
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
						},'-', {
							text : '返回',
							id: 'id_return_button',
							iconCls : 'n_arrow_leftIcon',
							handler : function() {
								window.history.go(-1);
							}
						}],
				bbar : bbar
			});
	
	grid.on("cellclick", function(grid, rowIndex, columnIndex, e) {
		var store = grid.getStore();
		var record = store.getAt(rowIndex);
		var fieldName = grid.getColumnModel().getDataIndex(columnIndex);
		
		if (fieldName == 'title' && columnIndex == 3) {
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
	
	//进入列表默认查询所有
	store.load({
				params : {
					start : 0,
					limit : bbar.pageSize,
					menuid: menuid,
					module: module
				}
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

	
});

