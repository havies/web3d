/**
 * 会话监控
 * 
 * @author zhaozh
 * @since 2010-09-03
 */
Ext.onReady(function() {
		
			var expander = new Ext.grid.RowExpander({
				tpl : new Ext.Template(
						'<p style=margin-left:70px;><span style=color:Teal;>登录账户：</span><span>{account}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>姓名：</span><span>{username}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>会话创建时间：</span><span>{CreateTime}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>最后访问时间：</span><span>{LastAccessTime}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>请求次数：</span><span>{RequestCount}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>共请求时间(毫秒)：</span><span>{RequestTimeMillisTotal}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>最大并发：</span><span>{ConcurrentMax}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>Jdbc执行数：</span><span>{JdbcExecuteCount}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>Jdbc时间(毫秒)：</span><span>{JdbcExecuteTimeMillis}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>读取行：</span><span>{JdbcFetchRowCount}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>更新行：</span><span>{JdbcUpdateCount}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>客户端IP：</span><span>{RemoteAddress}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>客户端：</span><span>{UserAgent}</span></p>',
						'<p style=margin-left:70px;><span style=color:Teal;>会话ID：</span><span>{sessionID}</span></p>'
					),
					expandOnDblClick : true
			});
			var sm = new Ext.grid.CheckboxSelectionModel();
			var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm,expander,
					{
						header : '用户编号',
						dataIndex : 'userid',
						width : 75,
						hidden : true,
						sortable : true
					}, {
						header : '登录账户',
						dataIndex : 'account',
						width : 80,
						sortable : true
					}, {
						header : '姓名',
						dataIndex : 'username',
						width : 90,
						sortable : true
					}, {
						header : '会话创建时间',
						dataIndex : 'CreateTime',
						width : 140,
						sortable : true
					}, {
						header : '最后访问时间',
						dataIndex : 'LastAccessTime',
						width : 140,
						sortable : true
					}, {
						header : '请求次数',
						dataIndex : 'RequestCount',
						width : 80,
						sortable : true
					}, {
						header : '共请求时间(毫秒)',
						dataIndex : 'RequestTimeMillisTotal',
						width : 120,
						sortable : true
					}, {
						header : '最大并发',
						dataIndex : 'ConcurrentMax',
						width : 80,
						sortable : true
					}, {
						header : 'Jdbc执行数',
						dataIndex : 'JdbcExecuteCount',
						width : 80,
						sortable : true
					}, {
						header : 'Jdbc时间(毫秒)',
						dataIndex : 'JdbcExecuteTimeMillis',
						width : 80,
						sortable : true
					}, {
						header : '读取行',
						dataIndex : 'JdbcFetchRowCount',
						width : 80,
						sortable : true
					}, {
						header : '更新行',
						dataIndex : 'JdbcUpdateCount',
						width : 80,
						sortable : true
					}, {
						header : '客户端IP',
						dataIndex : 'RemoteAddress',
						width : 100,
						sortable : true
					}, {
						header : '客户端类型',
						dataIndex : 'UserAgent',
						width : 150,
						sortable : true
					}, {
						header : '会话ID',
						dataIndex : 'sessionID',
						width : 250,
						sortable : true
					}, {
						dataIndex : '_blank',
						id : '_blank'
					}]);

			var store = new Ext.data.Store({
						proxy : new Ext.data.HttpProxy({
									url : 'sessionMonitor.do?reqCode=getSessionList'
								}),
						reader : new Ext.data.JsonReader({
									totalProperty : 'TOTALCOUNT',
									root : 'ROOT'
								}, [{
											name : 'sessionID'
										}, {
											name : 'userid'
										}, {
											name : 'username'
										}, {
											name : 'account'
										}, {
											name : 'loginIP'
										}, {
											name : 'explorer'
										}, {
											name : 'sessionCreatedTime'
										}])
					});

			store.on('beforeload', function() {
						this.baseParams = {
							username : Ext.getCmp('username').getValue(),
							account : Ext.getCmp('account').getValue()
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
											[250, '250条/页'], [500, '500条/页'],
											[1000, '1000条/页']]
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
					})

			var grid = new Ext.grid.GridPanel({
						title : '<span class="commoncss">会话监控</span>',
						height : 510,
						store : store,
						region : 'center',
						margins : '3 3 3 3',
						loadMask : {
							msg : '正在加载数据,请稍等...'
						},
						stripeRows : true,
						frame : true,
						autoExpandColumn : '_blank',
						cm : cm,
						sm : sm,
						plugins : expander,
						tbar : [{
							text : '踢出会话',
							iconCls : 'deleteIcon',
							handler : function() {
								killSession();
							}
						}, '->', {
							id : 'account',
							name : 'account',
							xtype : 'textfield',
							emptyText : '登录帐户',
							enableKeyEvents : true,
							listeners : {
								specialkey : function(field, e) {
									if (e.getKey() == Ext.EventObject.ENTER) {
										query();
									}
								}
							},
							width : 120
						}, '-', {
							id : 'username',
							name : 'username',
							xtype : 'textfield',
							emptyText : '姓名',
							enableKeyEvents : true,
							listeners : {
								specialkey : function(field, e) {
									if (e.getKey() == Ext.EventObject.ENTER) {
										query();
									}
								}
							},
							width : 120
						}, {
							text : '查询',
							iconCls : 'previewIcon',
							handler : function() {
								query();
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

			grid.on('sortchange', function() {
						// grid.getSelectionModel().selectFirstRow();
					});

			bbar.on("change", function() {
						// grid.getSelectionModel().selectFirstRow();
					});
			store.on('load', function() {
					var sCount = store.getCount();
					if(sCount > 0) {
						
						Ext.Ajax.request({
							url : './monitor/websession.json',
							success : function(response) {
								var resultArray = Ext.util.JSON
										.decode(response.responseText);
								var sessionContent = resultArray['Content'];
								
								for(var i = 0; i < sCount; i++) {
									var nRecord = store.getAt(i);
									for(j = 0; j < sessionContent.length; j++) {
										if(sessionContent[j]['SESSIONID'] == nRecord.get('sessionID')) {
											for(var sKey in sessionContent[j]){
												nRecord.set(sKey, sessionContent[j][sKey]);
											}
											break;
										}
									}
								}
							},
							failure : function(response) {
							}
						});
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
			 * 踢出会话
			 */
			function killSession() {
				var rows = grid.getSelectionModel().getSelections();
				if (Ext.isEmpty(rows)) {
					Ext.Msg.alert('提示', '请先选中踢出的会话!');
					return;
				}
				var strChecked = jsArray2JsString(rows, 'sessionID');
				showWaitMsg('正在踢出会话,请等待...');
				Ext.Ajax.request({
							url : 'sessionMonitor.do?reqCode=killSession',
							success : function(response) {
								var resultArray = Ext.util.JSON
										.decode(response.responseText);
								store.reload();
								Ext.Msg.alert('提示', resultArray.msg);
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

			function query() {
				store.load({
							params : {
								start : 0,
								limit : bbar.pageSize,
								username : Ext.getCmp('username').getValue(),
								account : Ext.getCmp('account').getValue()
							}
						});
			}

		});