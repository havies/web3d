/**
 * SQL监控
 * 
 * @author zhaozh email:zoominet(a)qq.com
 */
Ext.onReady(function() {
	
	var expander = new Ext.grid.RowExpander({
		tpl : new Ext.Template(
			'<p style=margin-left:70px;><span style=color:Teal;>SQL：</span><span>{SQL}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>执行数：</span><span>{ExecuteCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>总耗时(毫秒)：</span><span>{TotalTime}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>最慢(毫秒)：</span><span>{MaxTimespan}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>最后执行时间：</span><span>{LastTime}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>最慢执行时间：</span><span>{MaxTimespanOccurTime}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>事务中：</span><span>{InTransactionCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>错误数：</span><span>{ErrorCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>更新行数：</span><span>{EffectedRowCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>读取行数：</span><span>{FetchRowCountMax}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>执行中：</span><span>{RunningCount}</span></p>',
			'<p style=margin-left:70px;><span style=color:Teal;>最大并发：</span><span>{ConcurrentMax}</span></p>'
			),
			expandOnDblClick : true
	});
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), expander,
			{
				header : 'SQL',
				dataIndex : 'SQL',
				sortable: true,
				width : 380
			},
			{
				header : '执行数',
				dataIndex : 'ExecuteCount',
				sortable: true,
				width : 60
			},
			{
				header : '最后执行时间',
				dataIndex : 'LastTime',
				sortable: true,
				hidden: true,
				width : 100
			},
			{
				header : '总耗时(毫秒)',
				dataIndex : 'TotalTime',
				sortable: true,
				width : 100
			},
			{
				header : '最慢(毫秒)',
				dataIndex : 'MaxTimespan',
				sortable: true,
				width : 80
			},
			{
				header : '最慢执行时间',
				dataIndex : 'MaxTimespanOccurTime',
				sortable: true,
				hidden: true,
				width : 120
			},
			{
				header : '事务中',
				dataIndex : 'InTransactionCount',
				sortable: true,
				width : 60
			},
			{
				header : '错误数',
				dataIndex : 'ErrorCount',
				sortable: true,
				width : 60
			},
			{
				header : '更新行数',
				dataIndex : 'EffectedRowCount',
				sortable: true,
				width : 80
			},
			{
				header : '读取行数',
				dataIndex : 'FetchRowCountMax',
				sortable: true,
				width : 80
			},
			{
				header : '执行中',
				dataIndex : 'RunningCount',
				sortable: true,
				width : 60
			},
			{
				header : '最大并发',
				dataIndex : 'ConcurrentMax',
				sortable: true,
				width : 80
			}
			]);

	/**
	 * 数据存储
	 */
	var store = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
							url : '../../monitor/sql.json'
						}),
				reader : new Ext.data.JsonReader({
							totalProperty : 'ResultCode',
							root : 'Content'
						}, [
							{
							 name : 'SQL'
							},
							{
							 name : 'ExecuteCount'
							},
							{
							 name : 'TotalTime'
							},
							{
							 name : 'MaxTimespan'
							},
							{
							 name : 'InTransactionCount'
							},
							{
							 name : 'ErrorCount'
							},
							{
							 name : 'EffectedRowCount'
							},
							{
							 name : 'FetchRowCountMax'
							},
							{
							 name : 'RunningCount'
							},
							{
							 name : 'ConcurrentMax'
							},
							{
							 name : 'LastTime'
							},
							{
							 name : 'MaxTimespanOccurTime'
							}
							])
			});

	var grid = new Ext.grid.GridPanel({
				title : '<span class="commoncss">SQL列表</span>',
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
						}]
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

