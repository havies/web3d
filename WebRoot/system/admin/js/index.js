/**
 * 首页部分JS
 * 
 * @author zhaozh
 * @since 2010-03-13
 */
Ext.onReady(function() {
	var mainMenu = new Ext.menu.Menu({
				id : 'mainMenu',
				items : [/*{
							text : '皮肤设置',
							iconCls : 'bugIcon',
							handler : function() {
								themeWindowInit();
							}
						}, {
							text : '布局设置',
							iconCls : 'app_rightIcon',
							handler : function() {
								layoutWindowInit();
							}
						},'-',*/
			            {
							text : '系统锁定',
							iconCls : 'lockIcon',
							handler : function() {
								lockWindow.show();
								setCookie("bf.lockflag", '1', 240);
							}
						}, {
							text : '密码修改',
							iconCls : 'keyIcon',
							handler : function() {
								updateUserInit();
							}
						},'-',{
							text : '切换身份',
							id: 'selectRolespecButton',
							iconCls : 'userIcon',
							handler : function() {
								initSelectRolespecWin();
							}
						},'-',
						{
							text : '退出系统',
							iconCls : 'n_cancelIcon',
							handler : function() {
								logout();
							}
						}]
			});
	
	if(manyRolespec != 'true') {
		Ext.getCmp('selectRolespecButton').nextSibling().hide();
		Ext.getCmp('selectRolespecButton').hide();
	}
	
	var configButton = new Ext.Button({
				text : '日历',
				iconCls : 'calendarIcon',
				iconAlign : 'left',
				scale : 'medium',
				width : 40,
				tooltip : '<span style="font-size:12px">进入日历</span>',
				pressed : true,
				renderTo : 'calenderDiv',
				handler : function() {
					parent.addTab('common/gycalendarevent/calendarMain.action','日历','','云平台 -> 日历');
				}
			});
	var configButton = new Ext.Button({
				text : '设置',
				iconCls : 'configIcon',
				iconAlign : 'left',
				scale : 'medium',
				width : 40,
				//tooltip : '<span style="font-size:12px">修改密码等设置</span>',
				pressed : true,
				renderTo : 'configDiv',
				menu : mainMenu
			});
/*
	var closeButton = new Ext.Button({
				text : '退出系统',
				iconCls : 'cancel_48Icon',
				iconAlign : 'left',
				scale : 'medium',
				width : 30,
				tooltip : '<span style="font-size:12px">切换用户,安全退出系统</span>',
				pressed : true,
				arrowAlign : 'right',
				renderTo : 'closeDiv',
				handler : function() {
					logout();
				}
			});
*/			
    
			
	
    /**密码修改**/
	var lockForm = new Ext.form.FormPanel({
		labelWidth : 100,
		defaultType : 'textfield',
		labelAlign : 'right',
		bodyStyle : 'padding:10 5 5 5',
		layout : 'form',
		items : [{
					fieldLabel : '帐户密码',
					name : 'password',
					inputType : 'password',
					id : 'password_lock',
					labelStyle : micolor,
					allowBlank : false,
					maxLength : 50,
					listeners : {
						specialkey : function(field, e) {
							if (e.getKey() == Ext.EventObject.ENTER) {
								unlockSystem();
							}
						}
					},
					anchor : '100%'
				}, {
					xtype : 'panel',
					border : false,
					html : '<div style="font-size:12px;margin-left:10px">(提示:系统已成功锁定,解锁请输入登录帐户密码)</div>'
				}]
	});

	var lockWindow = new Ext.Window({
				title : '<span class="commoncss">系统锁定</span>',
				iconCls : 'lockIcon',
				layout : 'fit',
				width : 350,
				height : 130,
				closeAction : 'hide',
				collapsible : false,
				closable : false,
				maximizable : false,
				border : false,
				modal : true,
				constrain : true,
				animateTarget : Ext.getBody(),
				items : [lockForm],
				listeners : {
					'show' : function(obj) {
						lockForm.form.reset();
						lockForm.findById('password_lock').focus(true, 50);
					}
				},
				buttons : [{
							text : '解锁',
							iconCls : 'keyIcon',
							handler : function() {
								unlockSystem();
							}
						}, {
							text : '重新登录',
							iconCls : 'tbar_synchronizeIcon',
							handler : function() {
								window.location.href = 'login.do?reqCode=logout';
							}
						}]
			});

	var userFormPanel = new Ext.form.FormPanel({
				defaultType : 'textfield',
				labelAlign : 'right',
				labelWidth : 100,
				frame : false,
				bodyStyle : 'padding:5 5 0',
				items : [{
							fieldLabel : '登录帐户',
							name : 'account',
							id : 'account',
							allowBlank : false,
							readOnly : true,
							fieldClass : 'x-custom-field-disabled',
							anchor : '99%'
						}, {
							fieldLabel : '姓名',
							name : 'username',
							id : 'username',
							allowBlank : false,
							readOnly : true,
							fieldClass : 'x-custom-field-disabled',
							anchor : '99%'
						}, {
							fieldLabel : '当前密码',
							name : 'password2',
							id : 'password2',
							inputType : 'password',
							labelStyle : micolor,
							maxLength : 50,
							allowBlank : false,
							anchor : '99%'
						}, {
							fieldLabel : '新密码',
							name : 'password',
							id : 'password',
							inputType : 'password',
							labelStyle : micolor,
							maxLength : 50,
							allowBlank : false,
							anchor : '99%'
						}, {
							fieldLabel : '确认新密码',
							name : 'password1',
							id : 'password1',
							inputType : 'password',
							labelStyle : micolor,
							maxLength : 50,
							allowBlank : false,
							anchor : '99%'
						}, {
							id : 'userid',
							name : 'userid',
							hidden : true
						}]
			});

	var userWindow = new Ext.Window({
				layout : 'fit',
				width : 350,
				height : 215,
				resizable : false,
				draggable : true,
				closeAction : 'hide',
				modal : true,
				title : '<span class="commoncss">密码修改</span>',
				iconCls : 'keyIcon',
				collapsible : true,
				titleCollapse : true,
				maximizable : false,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				animateTarget : Ext.getBody(),
				constrain : true,
				listeners : {
					'show' : function(obj) {
						Ext.getCmp('password2').focus(true, 200);
					}
				},
				items : [userFormPanel],
				buttons : [{
					text : '保存',
					iconCls : 'acceptIcon',
					handler : function() {
						updateUser();
					}
				}, {
					text : '关闭',
					iconCls : 'deleteIcon',
					handler : function() {
						userWindow.hide();
					}
				}]
			});

	function unlockSystem() {
		// showWaitMsg();
		if (!lockForm.form.isValid())
			return;
		var params = lockForm.getForm().getValues();
		Ext.Ajax.request({
					url : 'index.do?reqCode=unlockSystem',
					success : function(response, opts) {
						var resultArray = Ext.util.JSON
								.decode(response.responseText);
						if (resultArray.flag == "1") {
							lockWindow.hide();
							setCookie("bf.lockflag", '0', 240);
						} else {
							Ext.Msg.alert('提示', '密码错误,请重新输入', function() {
										lockForm.form.reset();
										lockForm.findById('password_lock')
												.focus();
									});
						}
					},
					failure : function(response, opts) {
					},
					params : params
				});
	}

	/**
	 * 皮肤窗口初始化
	 */
	function themeWindowInit() {
		for (i = 0; i < root.childNodes.length; i++) {
			var child = root.childNodes[i];
			if (default_theme == child.attributes.theme) {
				child.select();
			}
		}
		var o = document.getElementById('previewDiv');
		o.innerHTML = '<img src="./resource/image/theme/' + default_theme
				+ '.jpg" />';
		themeWindow.show();

	}

	/**
	 * 保存用户自定义皮肤
	 */
	function saveUserTheme(o) {
		showWaitMsg();
		Ext.Ajax.request({
			url : './index.do?reqCode=saveUserTheme',
			success : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.MessageBox
						.confirm(
								'请确认',
								'您选择的['
										+ o.text
										+ ']皮肤保存成功,立即应用该皮肤吗?<br>提示：页面会被刷新,请先确认是否有尚未保存的业务数据,以免丢失!',
								function(btn, text) {
									if (btn == 'yes') {
										showWaitMsg('正在为您应用皮肤...');
										location.reload();
									} else {
										Ext.Msg.alert('提示',
												'请在任何时候按[F5]键刷新页面或者重新登录系统以启用['
														+ o.text + ']皮肤!',
												function() {
													themeWindow.hide();
												});

									}
								});
			},
			failure : function(response) {
				var resultArray = Ext.util.JSON.decode(response.responseText);
				Ext.Msg.alert('提示', '数据保存失败');
			},
			params : {
				theme : o.attributes.theme
			}
		});
	}

	/**
	 * 加载当前登录用户信息
	 */
	function updateUserInit() {
		userFormPanel.form.reset();
		userWindow.show();
		userWindow.on('show', function() {
					setTimeout(function() {
								userFormPanel.form.load({
											waitTitle : '提示',
											waitMsg : '正在读取用户信息,请稍候...',
											url : 'index.do?reqCode=loadUserInfo',
											success : function(form, action) {
											},
											failure : function(form, action) {
												Ext.Msg
														.alert(
																'提示',
																'数据读取失败:'
																		+ action.failureType);
											}
										});
							}, 5);
				});
	}

	/**
	 * 修改用户信息
	 */
	function updateUser() {
		if (!userFormPanel.form.isValid()) {
			return;
		}
		password1 = Ext.getCmp('password1').getValue();
		password = Ext.getCmp('password').getValue();
		if (password1 != password) {
			Ext.Msg.alert('提示', '两次输入的密码不匹配,请重新输入!');
			Ext.getCmp('password').setValue('');
			Ext.getCmp('password1').setValue('');
			return;
		}
		userFormPanel.form.submit({
					url : 'index.do?reqCode=updateUserInfo',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						Ext.MessageBox.alert('提示', '密码修改成功', function() {
									userWindow.hide();
								});
					},
					failure : function(form, action) {
						var flag = action.result.flag;
						if (flag == '0') {
							Ext.MessageBox.alert('提示', '您输入的当前密码验证失败,请重新输入',
									function() {
										Ext.getCmp('password2').setValue('');
										Ext.getCmp('password2').focus();
									});
						} else {
							Ext.MessageBox.alert('提示', '密码修改失败');
						}
					}
				});
	}
	
	function initSelectRolespecWin() {
		Ext.Ajax.request( {
			url : './login.do?reqCode=selectRolespec',
			success : function(response) {
				var result = Ext.util.JSON.decode(response.responseText);
				var rsNum = result.TOTALCOUNT;
				var rsList = result.ROOT;
				var buttonItemsStr = "[";
				for(var i = 0; i < rsNum; i++) {
					if(i > 0)
						buttonItemsStr += ",'-',";
					buttonItemsStr += "{";
					buttonItemsStr += "text : '<span style=\"font-size:15px;\">"+rsList[i].rolespecname+"</span>',";
					buttonItemsStr += "iconCls : 'acceptIcon',";
					buttonItemsStr += "scale : 'large',";
					buttonItemsStr += "handler : function() {";
					buttonItemsStr += "	selectOneRolespec('"+rsList[i].rolespec+"','"+rsList[i].rolespecname+"');";
					buttonItemsStr += "}";
					buttonItemsStr += "}";
				}
				buttonItemsStr += "]";
				
				var rolespecWin = new Ext.Window({
					width : 600,
					height : 0,
					resizable : true,
					draggable : true,
					closeAction : 'hide',
					modal : true,
					title : '<span class="commoncss">提示：登录用户拥有多重角色身份，请选择本次操作使用的身份</span>',
					iconCls : 'userIcon',
					maximizable : false,
					border : false,
					animCollapse : true,
					animateTarget : Ext.getBody(),
					constrain : true,
					//bbar : eval(buttonItemsStr),
					buttonAlign: 'center',
					buttons : [eval(buttonItemsStr)
					    /*,{
						text : '关闭',
						iconCls : 'deleteIcon',
						handler : function() {
							rolespecWin.hide();
						}
					}*/]
				});
				
				rolespecWin.show();
			},
			failure : function(response) {
			}
		});
	}
	function selectOneRolespec(rolespec, rolespecname) {
		Ext.Ajax.request( {
			url : './login.do?reqCode=selectRolespec',
			success : function(response) {
				window.location.href = 'index.do?reqCode=indexInit';
			},
			failure : function(response) {
			},
			params : {
				rolespec : rolespec,
				rolespecname : rolespecname
			}
		});
	}
	
	function logout(){
			Ext.MessageBox.show({
					title : '提示',
					msg : '确认要注销系统,退出登录吗?',
					width : 280,
					buttons : Ext.MessageBox.YESNO,
					animEl : Ext.getBody(),
					icon : Ext.MessageBox.QUESTION,
					fn : function(btn) {
						if (btn == 'yes') {
								Ext.MessageBox.show({
										title : '请等待',
										msg : '正在注销...',
										width : 300,
										wait : true,
										waitConfig : {
											interval : 50
										}
									});
						  window.location.href = 'login.do?reqCode=logout';
						}
					}
				});
    }

	if (getCookie("bf.lockflag") == '1') {
		lockWindow.show();
	}

});

/**
 * 显示系统时钟
 */
/*
function showTime() {
	var date = new Date();
	var h = date.getHours();
	h = h < 10 ? '0' + h : h;
	var m = date.getMinutes();
	m = m < 10 ? '0' + m : m;
	var s = date.getSeconds();
	s = s < 10 ? '0' + s : s;
	document.getElementById('rTime').innerHTML = h + ":" + m + ":" + s;
}
window.onload = function() {
	setInterval("showTime()", 1000);
}
*/


