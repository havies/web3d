/**
 * SQL监控
 * 
 * @author zhaozh email:zoominet(a)qq.com
 */
Ext.onReady(function() {
	
	var propsGrid = new Ext.grid.PropertyGrid({
				title : '<span class="commoncss">数据源监控参数列表</span>',
				region : 'center',
		        autoScroll : true,
				margins : '3 3 3 3',
				clicksToEdit : 3,
				loadMask : {
					msg : '正在加载表格数据,请稍等...'
				},
		        tbar : [{
					text : '刷新',
					id: 'id_refresh_button',
					iconCls : 'page_refreshIcon',
					handler : function() {
						loadParams();
					}
				}]
		        
		    });
	
	function loadParams() {
		Ext.Ajax.request({
			url : '../../monitor/datasource.json',
			success : function(response) {
				var resultArray = Ext.util.JSON
						.decode(response.responseText);
				var appContent = resultArray['Content'];
				
				for(var aKey in appContent[0]){
					for(var lKey in lang){
						if(lKey == aKey) {
							appContent[0][lang[lKey][1]] = appContent[0][aKey];
							delete appContent[0][aKey];
							break;
						}
					}
				}
				propsGrid.setSource(appContent[0]);
			},
			failure : function(response) {
				var resultArray = Ext.util.JSON
						.decode(response.responseText);
				Ext.Msg.alert('提示', resultArray.msg);
			}
		});
		
	}
	loadParams();
	
	var viewport = new Ext.Viewport({
				layout : 'border',
				items : [propsGrid]
			});
});

