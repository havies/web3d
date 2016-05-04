/**
 * SQL监控
 * 
 * @author zhaozh email:zoominet(a)qq.com
 */
Ext.onReady(function() {
	
	var expander = new Ext.grid.RowExpander({
		tpl : new Ext.XTemplate(
			'<p style=margin-left:70px;><span style=color:Teal;>URI路径：</span><span>{URI}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>请求次数：</span><span>{RequestCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>总耗时(毫秒)：</span><span>{RequestTimeMillis}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>执行中：</span><span>{RunningCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>最大并发：</span><span>{ConcurrentMax}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>最后请求时间：</span><span>{LastAccessTime}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>Jdbc执行数：</span><span>{JdbcExecuteCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>Jdbc出错数：</span><span>{JdbcExecuteErrorCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>Jdbc耗时(毫秒)：</span><span>{JdbcExecuteTimeMillis}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>事务提交数：</span><span>{JdbcCommitCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>事务回滚数：</span><span>{JdbcRollbackCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>读取行数：</span><span>{JdbcFetchRowCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>更新行数：</span><span>{JdbcUpdateCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>查看执行SQL：</span><span>',
			'<tpl for="Profiles">',
				'<tpl if="Type == \'SQL\'">',
		        '<p style=margin-left:100px;><span style=color:Teal;>[{[xindex]}:]</span>{Name}[执行次数:{ExecuteCount}][执行时间:{ExecuteTimeMillis}]</p>',
		        '</tpl>',
		    '</tpl></span></p>'
			),
			expandOnDblClick : true
	});
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), expander,
			{
				header : 'URI路径',
				dataIndex : 'URI',
				sortable: true,
				width : 200
			},
			{
				header : '请求次数',
				dataIndex : 'RequestCount',
				sortable: true,
				width : 60
			},
			{
				header : '总耗时(毫秒)',
				dataIndex : 'RequestTimeMillis',
				sortable: true,
				width : 100
			},
			{
				header : '执行中',
				dataIndex : 'RunningCount',
				sortable: true,
				width : 120
			},
			{
				header : '最大并发',
				dataIndex : 'ConcurrentMax',
				sortable: true,
				width : 80
			},
			{
				header : '最后请求时间',
				dataIndex : 'LastAccessTime',
				sortable: true,
				width : 80
			},
			{
				header : 'Jdbc执行数',
				dataIndex : 'JdbcExecuteCount',
				sortable: true,
				width : 120
			},
			{
				header : 'Jdbc出错数',
				dataIndex : 'JdbcExecuteErrorCount',
				sortable: true,
				width : 120
			},
			{
				header : 'Jdbc耗时(毫秒)',
				dataIndex : 'JdbcExecuteTimeMillis',
				sortable: true,
				width : 120
			},
			{
				header : '事务提交数',
				dataIndex : 'JdbcCommitCount',
				sortable: true,
				width : 80
			},
			{
				header : '事务回滚数',
				dataIndex : 'JdbcRollbackCount',
				sortable: true,
				width : 80
			},
			{
				header : '读取行数',
				dataIndex : 'JdbcFetchRowCount',
				sortable: true,
				width : 60
			},
			{
				header : '更新行数',
				dataIndex : 'JdbcUpdateCount',
				sortable: true,
				width : 80
			}
			]);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : '../../monitor/weburi.json'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'ResultCode',
							root : 'Content'
						}, [
							{
							 name : 'URI'
							},
							{
							 name : 'RequestCount'
							},
							{
							 name : 'RequestTimeMillis'
							},
							{
							 name : 'RunningCount'
							},
							{
							 name : 'ConcurrentMax'
							},
							{
							 name : 'JdbcExecuteCount'
							},
							{
							 name : 'JdbcExecuteErrorCount'
							},
							{
							 name : 'JdbcExecuteTimeMillis'
							},
							{
							 name : 'JdbcCommitCount'
							},
							{
							 name : 'JdbcRollbackCount'
							},
							{
							 name : 'JdbcFetchRowCount'
							},
							{
							 name : 'JdbcUpdateCount'
							},
							{
							 name : 'LastAccessTime'
							},
							{
							 name : 'Profiles'
							}
							])
			});

	var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">Web请求列表</span>',
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
				cm : cm,
				plugins : expander,
				tbar : [{
							text : '刷新',
							id: 'id_refresh_button',
							iconCls : 'page_refreshIcon',
							handler : function() {
								store.reload();
							}
						},'-','展开行查看该请求路径中执行的所有SQL语句']
			});
	//进入列表默认查询所有
	store.load();
	grid.on('rowdblclick', function(grid, rowIndex, event) {
				//editInit();
			});
	grid.on('sortchange', function() {
				// grid.getSelectionModel().selectFirstRow();
			});
	
	
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [grid]
			});
});

