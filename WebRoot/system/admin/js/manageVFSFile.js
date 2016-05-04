/**
 * VFS文件管理
 * 
 * @author zhaozh
 * @since 2014-01-11
 */
Ext.onReady(function() {
		var root = new Ext.tree.AsyncTreeNode( {
			text : vfsroot_name,
			expanded : true,
			id : vfsroot
		});
		var folderTree = new Ext.tree.TreePanel( {
			loader : new Ext.tree.TreeLoader( {
				baseAttrs : {},
				dataUrl : './vfsfile.do?reqCode=fileFolderTreeInit'
			}),
			root : root,
			title : '',
			applyTo : 'folderTreeDiv',
			autoScroll : false,
			animate : false,
			useArrows : false,
			border : false
		});
		//folderTree.root.select();
		var selectedFolderId = '';
		folderTree.on('click', function(node) {
			selectedFolderId = node.attributes.id;
			if(selectedFolderId != 'NOT_EXISTS_ID') {
				store.load( {
					params : {
						start : 0,
						limit : bbar.pageSize,
						folderid : selectedFolderId
					}
				});
				grid.setTitle('<span class="commoncss">['+node.attributes.text+']文件列表</span>');
			}
		});
	
		var contextMenu = new Ext.menu.Menu( {
			id : 'folderTreeContextMenu',
			items : [ {
				text : '新增文件夹',
				iconCls : 'page_addIcon',
				handler : function() {
					addInit();
				}
			}, {
				text : '修改文件夹',
				iconCls : 'page_edit_1Icon',
				handler : function() {
					editInit();
				}
			}, {
				text : '删除文件夹',
				iconCls : 'page_delIcon',
				handler : function() {
					var selectModel = folderTree.getSelectionModel();
					var selectNode = selectModel.getSelectedNode();
					deleteFolderItems('2', selectNode.attributes.id);
				}
			}, {
				text : '刷新节点',
				iconCls : 'page_refreshIcon',
				handler : function() {
					var selectModel = folderTree.getSelectionModel();
					var selectNode = selectModel.getSelectedNode();
					if (selectNode.attributes.leaf) {
						selectNode.parentNode.reload();
					} else {
						selectNode.reload();
					}
				}
			} ]
		});
		folderTree.on('contextmenu', function(node, e) {
			e.preventDefault();
			folderid = node.attributes.id;
			foldername = node.attributes.text;
	
			node.select();
			contextMenu.showAt(e.getXY());
		});
		
		function downloadColumnRender(value) {
			return "<a href='javascript:void(0);'><img src='" + webContext
					+ "/resource/image/ext/download.png'/></a>";
		}
		function filetypeColumnRender(value) {
			return "<img src='" + webContext+"/resource/image/filetype/"+value.toLowerCase()+".gif'/>";
		}
		var sm = new Ext.grid.CheckboxSelectionModel();
		var cm = new Ext.grid.ColumnModel( [ new Ext.grid.RowNumberer(), sm, {
			header : '下载', // 列标题
			dataIndex : 'download',
			width : 50,
			align: 'center',
			renderer : downloadColumnRender
		},{
			header : '文件名称',
			dataIndex : 'vfsfilename',
			width : 200
		},{
			header : '文件类型',
			dataIndex : 'vfsfiletype',
			align: 'center',
			width : 60,
			renderer: filetypeColumnRender
		}, {
			header : '大小(KB)',
			dataIndex : 'vfsfilesize',
			align: 'right',
			width : 80
		}, {
			header : '创建时间',
			dataIndex : 'filecreatetime',
			width : 130
		}, {
			header : '存储路径',
			dataIndex : 'vfsfilepath',
			width : 400
		},{
	        dataIndex : '_blank',
	        id : '_blank'
	    }]);
	
		/**
		 * 数据存储
		 */
		var store = new Ext.data.Store( {
			proxy : new Ext.data.HttpProxy( {
				url : './vfsfile.do?reqCode=queryFilesForManage'
			}),
			reader : new Ext.data.JsonReader( {
				totalProperty : 'TOTALCOUNT',
				root : 'ROOT'
			}, [{
					name : 'vfsfilename'
				},
				{
					name : 'vfsfiletype'
				}, 
				{
					name : 'vfsfilesize'
				}, 
				{
					name : 'filecreatetime'
				}, 
				{
					name : 'vfsfilepath'
				}])
		});
	
		// 翻页排序时带上查询条件
		store.on('beforeload', function() {
			this.baseParams = {
				folderid : selectedFolderId,
				queryParam : Ext.getCmp('queryParam').getValue()
			};
		});

		var pagesize_combo = new Ext.form.ComboBox( {
			name : 'pagesize',
			hiddenName : 'pagesize',
			typeAhead : true,
			triggerAction : 'all',
			lazyRender : true,
			mode : 'local',
			store : new Ext.data.ArrayStore(
					{
						fields : [ 'value', 'text' ],
						data : [ [ 10, '10条/页' ], [ 20, '20条/页' ],
								[ 50, '50条/页' ], [ 100, '100条/页' ],
								[ 250, '250条/页' ], [ 500, '500条/页' ] ]
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
			store.reload( {
				params : {
					start : 0,
					limit : bbar.pageSize
				}
			});
		});

		var bbar = new Ext.PagingToolbar( {
			pageSize : number,
			store : store,
			displayInfo : true,
			displayMsg : '显示{0}条到{1}条,共{2}条',
			emptyMsg : "没有符合条件的记录",
			items : [ '-', '&nbsp;&nbsp;', pagesize_combo ]
		});
		var grid = new Ext.grid.GridPanel( {
			title : '<span class="commoncss">文件列表</span>',
			height : 500,
			// width:600,
			autoScroll : true,
			region : 'center',
			store : store,
			loadMask : {
				msg : '正在加载表格数据,请稍等...'
			},
			stripeRows : true,
			frame : true,
			cm : cm,
			sm : sm,
			tbar : [ {
				id : 'id_uploadfile_button',
				text : '上传文件',
				iconCls : 'page_addIcon',
				handler : function() {
					if(selectedFolderId == '') {
						Ext.MessageBox.alert('提示', '请先选择左侧文件夹');
						return;
					}
					var _swfuploadWin = new Ext.Window({
						title : '<span class="commoncss">上传文件(文件小于'+maxUploadFileSize+'MB)</span>',
						width : 500,
						height : 350,
						resizable : true,
						modal : true,
						layout : 'fit',
						constrain : true,
						//closeAction : 'close',
						maximizable : true,
						listeners : {
							'close' : function(obj) {
								store.reload();
							}
						},
						items : [{
							xtype : 'uploadpanel',
							uploadUrl : webContext
									+ '/common/vfsfile.do?reqCode=doUploadFlash',
							filePostName : 'swfUploadFile',
							flashUrl : webContext
									+ '/resource/myux/uploadpanel/swf/swfupload.swf',
							fileSize : maxUploadFileSize+'MB',
							border : false,
							fileTypes : '*.*', // 在这里限制文件类型:'*.jpg,*.png,*.gif'
							fileTypesDescription : '所有文件',
							postParams : {
								postType : 1,
								folderid : encodeURI(selectedFolderId)
							}
						}]
					});

					_swfuploadWin.show();
				}
			}, '-', {
				id : 'id_deletefile_button',
				text : '删除文件',
				iconCls : 'page_delIcon',
				handler : function() {
					deleteFolderItems('1', '');
				}
			}, '-', {
				id : 'id_extractfile_button',
				text : '解压缩文件',
				iconCls : 'book_previousIcon',
				handler : function() {
					
				}
			}, '->', new Ext.form.TextField( {
				id : 'queryParam',
				name : 'queryParam',
				emptyText : '请输入文件夹名称',
				enableKeyEvents : true,
				listeners : {
					specialkey : function(field, e) {
						if (e.getKey() == Ext.EventObject.ENTER) {
							queryFolderItem();
						}
					}
				},
				width : 130
			}), {
				text : '查询',
				iconCls : 'previewIcon',
				handler : function() {
					queryFolderItem();
				}
			}, '-', {
				text : '刷新',
				iconCls : 'arrow_refreshIcon',
				handler : function() {
					if(selectedFolderId == '') {
						Ext.MessageBox.alert('提示', '请先选择左侧文件夹');
						return;
					}
					store.reload();
				}
			} ],
			bbar : bbar
		});

		grid.on("cellclick", function(pGrid, rowIndex, columnIndex, e) {
			var store = pGrid.getStore();
			var record = store.getAt(rowIndex);
			var fieldName = pGrid.getColumnModel().getDataIndex(columnIndex);
			if (fieldName == 'download' && columnIndex == 2) {
				var downloadIframe = document.createElement('iframe');
				downloadIframe.src = './vfsfile.do?reqCode=downloadFile&fname='
										+encodeURI(encodeURI(record.get("vfsfilename")))+'&fpath=' 
										+encodeURI(encodeURI(record.get("vfsfilepath")));
				downloadIframe.style.display = "none";
				document.body.appendChild(downloadIframe);
			}
		});
		
		grid.on('rowclick', function(grid, rowIndex, event) {
			var store = grid.getStore();
			var record = store.getAt(rowIndex);
			
			
			var vfsfiletype = record.get('vfsfiletype').toLowerCase();
			var vfsfilename = record.get('vfsfilename');
			
			if(isFileType(vfsfiletype,'pic')) {
				var viewUrl = './vfsfile.do?reqCode=viewPicFile&fname='
					+encodeURI(encodeURI(record.get("vfsfilename")))+'&fpath=' 
					+encodeURI(encodeURI(record.get("vfsfilepath")))+'&ftype=' 
					+encodeURI(encodeURI(record.get("vfsfiletype").toLowerCase()));
				var tpl = new Ext.Template(
						'<center>',
		                '<p style="padding:10"><img width="200" src="' + viewUrl +'" class="thumb-img" /></p>',
		                '<p style="margin:10"><strong>'+vfsfilename+'</strong></p>',
		                '</center>'
	                );
	            tpl.overwrite(previewFilePanel.body, record);
			}
			else {
				var tpl = new Ext.Template(
						'<center>',
		                '<p style="padding:100"><img width="20" src="' + webContext+ '/resource/image/filetype/'+vfsfiletype+'.gif" class="thumb-img" /></p>',
		                '<p style="margin:10"><strong>'+vfsfilename+'</strong></p>',
		                '</center>'
	                );
	            tpl.overwrite(previewFilePanel.body, record);
			}
			//previewFilePanel.body.highlight('#FFFFCC', {block:true});
		});
		grid.on('sortchange', function() {
			// grid.getSelectionModel().selectFirstRow();
			});

		bbar.on("change", function() {
			// grid.getSelectionModel().selectFirstRow();
			});

		var addRoot = new Ext.tree.AsyncTreeNode( {
			text : vfsroot_name,
			expanded : true,
			id : vfsroot
		});
		var addFolderTree = new Ext.tree.TreePanel( {
			loader : new Ext.tree.TreeLoader( {
				baseAttrs : {},
				dataUrl : './vfsfile.do?reqCode=fileFolderTreeInit'
			}),
			root : addRoot,
			autoScroll : true,
			animate : false,
			useArrows : false,
			border : false
		});
		// 监听下拉树的节点单击事件
		addFolderTree.on('click', function(node) {
			comboxWithTree.setValue(node.text);
			Ext.getCmp("addFolderFormPanel").findById('parentfolderid').setValue(
					node.attributes.id);
			comboxWithTree.collapse();
		});
		var comboxWithTree = new Ext.form.ComboBox(
				{
					id : 'parentfoldername',
					store : new Ext.data.SimpleStore( {
						fields : [],
						data : [ [] ]
					}),
					editable : false,
					value : ' ',
					emptyText : '请选择...',
					fieldLabel : '上级文件夹',
					anchor : '100%',
					mode : 'local',
					triggerAction : 'all',
					labelStyle: micolor,
					maxHeight : 390,
					// 下拉框的显示模板,addFolderTreeDiv作为显示下拉树的容器
					tpl : "<tpl for='.'><div style='height:390px'><div id='addFolderTreeDiv'></div></div></tpl>",
					allowBlank : false,
					onViewClick:Ext.emptyFn,
					beforeBlur:Ext.emptyFn,
					onSelect : Ext.emptyFn
				});
		// 监听下拉框的下拉展开事件
		comboxWithTree.on('expand', function() {
			// 将UI树挂到treeDiv容器
				addFolderTree.render('addFolderTreeDiv');
				// addFolderTree.root.expand(); //只是第一次下拉会加载数据
				addFolderTree.root.reload(); // 每次下拉都会加载数据

			});
		var addFolderFormPanel = new Ext.form.FormPanel( {
			id : 'addFolderFormPanel',
			name : 'addFolderFormPanel',
			defaultType : 'textfield',
			labelAlign : 'right',
			labelWidth : 70,
			frame : false,
			bodyStyle : 'padding:5 5 0',
			items : [ comboxWithTree,{
				fieldLabel : '文件夹名称',
				name : 'foldername',
				id : 'foldername',
				allowBlank : false,
				labelStyle: micolor,
				anchor : '99%'
			}, {
				id : 'parentfolderid',
				name : 'parentfolderid',
				hidden : true
			}, {
				id : 'windowmode',
				name : 'windowmode',
				hidden : true
			}, {
				id : 'folderid',
				name : 'folderid',
				hidden : true
			}, {
				id : 'foldername_old',
				name : 'foldername_old',
				hidden : true
			}, {
				id : 'parentfolderid_old',
				name : 'parentfolderid_old',
				hidden : true
			} ]
		});
		var addFolderWindow = new Ext.Window( {
			layout : 'fit',
			width : 400,
			height : 150,
			resizable : false,
			draggable : true,
			closable : true,
			modal : true,
			closeAction : 'hide',
			title : '<span class="commoncss">新增文件夹</span>',
			// iconCls : 'page_addIcon',
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
			items : [ addFolderFormPanel ],
			buttons : [
					{
						text : '保存',
						iconCls : 'acceptIcon',
						id : 'btn_id_save_update',
						handler : function() {
							var mode = Ext.getCmp('windowmode').getValue();
							if (mode == 'add')
								saveFolderItem();
							else
								updateFolderItem();
						}
					}, {
						text : '重置',
						id : 'btnReset',
						iconCls : 'tbar_synchronizeIcon',
						handler : function() {
							clearForm(addFolderFormPanel.getForm());
						}
					}, {
						text : '关闭',
						iconCls : 'deleteIcon',
						handler : function() {
							addFolderWindow.hide();
						}
					} ]
		});
		
		var previewFilePanel = new Ext.Panel({
	        id:'previewFilePanel',
	        layout:'fit'
	    });
		
		/**
		 * 布局
		 */
		var viewport = new Ext.Viewport( {
			layout : 'border',
			items : [ {
				title : '<span class="commoncss">文件夹</span>',
				iconCls : 'chart_organisationIcon',
				tools : [ {
					id : 'refresh',
					handler : function() {
						folderTree.root.reload()
					}
				} ],
				collapsible : true,
				width : 210,
				minSize : 160,
				maxSize : 350,
				split : true,
				region : 'west',
				autoScroll : true,
				margins : '3 3 3 3',
				// collapseMode:'mini',
				items : [ folderTree ]
			}, {
				region : 'center',
				layout : 'fit',
				border : false,
				margins : '3 3 3 3',
				items : [ grid ]
			},{
				title : '<span class="commoncss">预览</span>',
				iconCls : 'window_caise_listIcon',
				collapsible : true,
				width : 250,
				split : true,
				region : 'east',
				autoScroll : true,
				margins : '3 3 3 3',
				items : [previewFilePanel]
			} ]
		});

		
		
		/**
		 * 根据条件查询文件夹
		 */
		function queryFolderItem() {
			if(selectedFolderId == '') {
				Ext.MessageBox.alert('提示', '请先选择左侧文件夹');
				return;
			}
			store.load( {
				params : {
					start : 0,
					limit : bbar.pageSize,
					queryParam : Ext.getCmp('queryParam').getValue()
				}
			});
		}

		/**
		 * 新增文件夹初始化
		 */
		function addInit() {
			Ext.getCmp('btnReset').hide();
			// clearForm(addFolderFormPanel.getForm());
			var flag = Ext.getCmp('windowmode').getValue();
			if (typeof (flag) != 'undefined') {
				addFolderFormPanel.form.getEl().dom.reset();
			} else {
				clearForm(addFolderFormPanel.getForm());
			}
			var selectModel = folderTree.getSelectionModel();
			var selectNode = selectModel.getSelectedNode();
			Ext.getCmp('parentfoldername').setValue(selectNode.attributes.text);
			Ext.getCmp('parentfolderid').setValue(selectNode.attributes.id);
			addFolderWindow.show();
			addFolderWindow
					.setTitle('<span class="commoncss">新增文件夹</span>');
			Ext.getCmp('windowmode').setValue('add');
			comboxWithTree.setDisabled(false);
			//Ext.getCmp('btnReset').show();
		}

		/**
		 * 保存文件夹数据
		 */
		function saveFolderItem() {
			if (!addFolderFormPanel.form.isValid()) {
				return;
			}
			addFolderFormPanel.form.submit( {
				url : './vfsfile.do?reqCode=saveFolderItem',
				waitTitle : '提示',
				method : 'POST',
				waitMsg : '正在处理数据,请稍候...',
				success : function(form, action) {
					addFolderWindow.hide();
					//store.reload();
					refreshNode(Ext.getCmp('parentfolderid').getValue());
					form.reset();
					Ext.MessageBox.alert('提示', action.result.msg);
				},
				failure : function(form, action) {
					var msg = action.result.msg;
					Ext.MessageBox.alert('提示', '文件夹保存失败:<br>' + msg);
				}
			});
		}

		/**
		 * 刷新指定节点
		 */
		function refreshNode(nodeid) {
			var node = folderTree.getNodeById(nodeid);
			/* 异步加载树在没有展开节点之前是获取不到对应节点对象的 */
			if (Ext.isEmpty(node)) {
				folderTree.root.reload();
				return;
			}
			if (node.attributes.leaf) {
				node.parentNode.reload();
			} else {
				node.reload();
			}
		}

		/**
		 * 修改文件夹初始化
		 */
		function editInit() {
			var selectModel = folderTree.getSelectionModel();
			var selectNode = selectModel.getSelectedNode();
			
			var parentNode = selectNode.parentNode;
			
			comboxWithTree.setDisabled(true);
			
			if(selectNode.attributes.id == vfsroot) {
				Ext.MessageBox.alert('提示', '不能修改根文件夹');
				return;
			}
			Ext.getCmp('parentfoldername').setValue(parentNode.attributes.text);
			Ext.getCmp('parentfolderid').setValue(parentNode.attributes.id);
			
			Ext.getCmp('foldername').setValue(selectNode.attributes.text);
			Ext.getCmp('foldername_old').setValue(selectNode.attributes.text);
			Ext.getCmp('folderid').setValue(selectNode.attributes.id);
			
			addFolderWindow.show();
			addFolderWindow
					.setTitle('<span style="font-weight:normal">修改文件夹</span>');
			Ext.getCmp('windowmode').setValue('edit');
			Ext.getCmp('btnReset').hide();
		}

		/**
		 * 修改文件夹数据
		 */
		function updateFolderItem() {
			if (!addFolderFormPanel.form.isValid()) {
				return;
			}
			update();
		}

		/**
		 * 更新
		 */
		function update() {
			var parentfolderid = Ext.getCmp('parentfolderid').getValue();
			var parentfolderid_old = Ext.getCmp('parentfolderid_old').getValue();
			addFolderFormPanel.form.submit( {
				url : './vfsfile.do?reqCode=updateFolderItem',
				waitTitle : '提示',
				method : 'POST',
				waitMsg : '正在处理数据,请稍候...',
				success : function(form, action) {
					addFolderWindow.hide();
					//store.reload();
					refreshNode(parentfolderid);
					if (parentfolderid != parentfolderid_old) {
						refreshNode(parentfolderid_old);
					}
					form.reset();
					Ext.MessageBox.alert('提示', action.result.msg);
				},
				failure : function(form, action) {
					var msg = action.result.msg;
					Ext.MessageBox.alert('提示', '文件夹数据修改失败:<br>' + msg);
				}
			});
		}

		/**
		 * 删除文件夹
		 */
		function deleteFolderItems(pType, pFolderid) {
			
			if(pType == '1') {
				var rows = grid.getSelectionModel().getSelections();
				if (Ext.isEmpty(rows)) {
					Ext.Msg.alert('提示', '请先选中要删除的文件!');
					return;
				}
				var strChecked = jsArray2JsString(rows, 'vfsfilepath');
				Ext.Msg.confirm('请确认', '确认删除选中的文件?', function(btn, text) {
							if (btn == 'yes') {
								showWaitMsg();
								Ext.Ajax.request({
											url : './vfsfile.do?reqCode=deleteFolderItem',
											success : function(response) {
												var resultArray = Ext.util.JSON
														.decode(response.responseText);
												store.reload();
												Ext.Msg.alert('提示', '删除文件成功');
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
			if(pType == '2') {
				var selectModel = folderTree.getSelectionModel();
				var selectNode = selectModel.getSelectedNode();
				
				var parentNode = selectNode.parentNode;
				
				if(selectNode.attributes.id == vfsroot) {
					Ext.MessageBox.alert('提示', '不能删除根文件夹');
					return;
				}
				
				Ext.Msg.confirm(
								'请确认',
								'<b>提示:</b>如果该文件夹里有文件夹或文件,将不能删除.<br>是否继续删除?',
								function(btn, text) {
									if (btn == 'yes') {
										showWaitMsg();
										Ext.Ajax.request( {
													url : './vfsfile.do?reqCode=deleteFolderItem',
													success : function(response) {
														var resultArray = Ext.util.JSON
																.decode(response.responseText);
														//store.reload();
														refreshNode(parentNode.attributes.id);
														Ext.Msg.alert('提示',
																resultArray.msg);
													},
													failure : function(response) {
														var resultArray = Ext.util.JSON
																.decode(response.responseText);
														Ext.Msg.alert('提示',
																resultArray.msg);
													},
													params : {
														pFolderid : pFolderid
													}
												});
									}
								});
			}
		}

});

