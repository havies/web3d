/**
 * 登陆页面
 * 
 * @author zhaozh
 * @since 2010-01-13
 */
Ext.onReady(function() {

	// 清除按钮上下文菜单
	var mainMenu = new Ext.menu.Menu({
				id : 'mainMenu',
				items : [{
					text : '清除记忆',
					iconCls : 'status_awayIcon',
					handler : function() {
						clearCookie('bf.login.account');
						var account = Ext.getCmp('loginForm')
								.findById('account');
						Ext.getCmp('loginForm').form.reset();
						account.setValue('');
						account.focus();
					}
				}, {
					text : '切换到全屏模式',
					iconCls : 'imageIcon',
					handler : function() {
						window.location.href = './fullScreen.htm';
					}
				}]
			});

	var loginForm=new Ext.form.FormPanel({
		id : 'loginForm',
		height : 190,
        el:'center_middle',
        defaults : {
			width : 230
        },
        bodyStyle : 'padding:30 0 0 0',
        labelWidth : 50,
        items : [
		{
		    layout:"column",
		    border:false,
		    bodyStyle : 'padding:0 0 0 30',
		    items:[{
		        columnWidth:1,
		        layout:"form",
		        border:false,
				defaultType : 'textfield',
		        items:[
		        {
		        	fieldLabel : '帐&nbsp;号',
		        	name : 'account',
		        	id : 'account',
		        	cls : 'user',
		        	style: 'margin:0 0 15 0',
		        	blankText : '帐号不能为空,请输入!',
		        	maxLength : 30,
		        	maxLengthText : '账号的最大长度为30个字符',
		        	allowBlank : false,
		        	listeners : {
		        		specialkey : function(field, e) {
		        			if (e.getKey() == Ext.EventObject.ENTER) {
		        				Ext.getCmp('password').focus();
							}
						}
					}
		        }, 
		        {
		        	fieldLabel : '密&nbsp;码',
		        	name : 'password',
		        	id : 'password',
		        	cls : 'key',
		        	inputType : 'password',
		        	blankText : '密码不能为空,请输入!',
		        	maxLength : 20,
		        	maxLengthText : '密码的最大长度为20个字符',
		        	allowBlank : false,
		        	listeners : {
		        		specialkey : function(field, e) {
		        			if (e.getKey() == Ext.EventObject.ENTER) {
		        				login();
							}
						}
					}
				}]
		      }]
		},
        {
			layout : 'column',
			border : false,
			bodyStyle : 'padding:0 0 0 30',
			items : [
	        {
	        	columnWidth : 1,
				layout : 'form',
				border : false,
				items : [
				{
					xtype: 'button',
					text : '&nbsp;登&nbsp;录&nbsp;',
					iconCls : 'acceptIcon',
					scale :'medium',
					width : 80,
					style: 'padding:20 0 0 70',
					handler : function() {
						login();
					}
				}]
	        }
	        /*,
	        {
	        	columnWidth : .5,
				layout : 'form',
				border : false,
				items : [
				{
					xtype: 'button',
					text : '&nbsp;选项',
					iconCls : 'tbar_synchronizeIcon',
					scale :'medium',
					width : 80,
					style: 'padding:20 0 0 0',
					menu : mainMenu
				}]
	        }
	        */]
        }]
	 });
	
	
	loginForm.on('afterrender', function() {
		setTimeout(function() {
			var account = Ext.getCmp('loginForm').findById('account');
			var password = Ext.getCmp('loginForm').findById('password');
			var c_account = getCookie('bf.login.account');
			account.setValue(c_account);
			if (Ext.isEmpty(c_account)) {
				account.focus();
			} else {
				password.focus();
			}
		}, 200);
		Ext.getCmp('loginForm').findById('account').focus();
		
	});
	
	loginForm.render();
	
	var addUserFormPanel = new Ext.form.FormPanel({
		id : 'addUserFormPanel',
		name : 'addUserFormPanel',
		defaultType : 'textfield',
		labelAlign : 'right',
		labelWidth : 65,
		bodyStyle : 'padding:5 5 5 5',
		frame : false,
		items : [{
					fieldLabel : '登录帐户',
					name : 'account',
					allowBlank : false,
					emptyText : '请使用Email作为帐户',
					regex : /^([\w]+)(.[\w]+)*@([\w-]+\.){1,5}([A-Za-z]){2,4}$/,
					regexText : '请以电子邮箱地址作为帐户',
					maxLength : 30,
					anchor : '99%'
				}, {
					fieldLabel : '姓名/昵称',
					name : 'username',
					allowBlank : false,
					anchor : '99%'
				}, {
					fieldLabel : '密码',
					name : 'password',
					inputType : 'password',
					allowBlank : false,
					anchor : '99%'
				}, {
					fieldLabel : '确认密码',
					name : 'password1',
					inputType : 'password',
					allowBlank : false,
					anchor : '99%'
				}]
	});

	var addUserWindow = new Ext.Window({
				layout : 'fit',
				width : 280,
				height : 185,
				resizable : false,
				draggable : false,
				closeAction : 'hide',
				title : '<span style="font-weight:normal">注册新帐户</span>',
				iconCls : 'group_addIcon',
				modal : true,
				collapsible : false,
				maximizable : false,
				buttonAlign : 'right',
				border : false,
				animCollapse : true,
				animateTarget : Ext.getBody(),
				constrain : true,
				items : [addUserFormPanel],
				buttons : [{
							text : '保存',
							iconCls : 'acceptIcon',
							handler : function() {
								regAccount();
							}
						}, {
							text : '重置',
							id : 'btnReset',
							iconCls : 'tbar_synchronizeIcon',
							handler : function() {
								clearForm(addUserFormPanel.getForm());
							}
						}]
			});

	/**
	 * 提交登陆请求
	 */
	function login() {
		if (Ext.getCmp('loginForm').form.isValid()) {
			Ext.getCmp('loginForm').form.submit({
				url : 'login.do?reqCode=login',
				waitTitle : '提示',
				method : 'POST',
				waitMsg : '正在验证您的身份,请稍候.....',
				success : function(form, action) {
					var manyRolespec = action.result.manyrolespec;
					if(manyRolespec == 'true') {
						initSelectRolespecWin();
					}
					else {
						var account = Ext.getCmp('loginForm').findById('account');
						setCookie("bf.login.account", account.getValue(), 60);
						setCookie("bf.login.userid", action.result.userid, 60);
						setCookie("bf.system.flag", '0', 60);
						setCookie("bf.lockflag", '0', 60);
						window.location.href = 'index.do?reqCode=indexInit';
					}
				},
				failure : function(form, action) {
					var errmsg = action.result.msg;
					var errtype = action.result.errorType;
					if(errtype == '4') {//如果遇到同一个客户端上同时登录两个不同的账号
						Ext.MessageBox.show({
							title : '提示',
							msg : errmsg,
							buttons : Ext.MessageBox.YESNO,
							animEl : Ext.getBody(),
							icon : Ext.MessageBox.QUESTION,
							fn : function(btn) {
								if (btn == 'yes') {
									//踢出之前的账号，重新登录
									Ext.Ajax.request( {
										url : 'login.do?reqCode=logout',
										success : function(response) {
											Ext.getCmp('loginForm').form.submit({
												url : 'login.do?reqCode=login',
												waitTitle : '提示',
												method : 'POST',
												waitMsg : '正在验证您的身份,请稍候.....',
												success : function(form, action) {
													var manyRolespec = action.result.manyrolespec;
													if(manyRolespec == 'true') {
														initSelectRolespecWin();
													}
													else {
														var account = Ext.getCmp('loginForm').findById('account');
														setCookie("bf.login.account", account.getValue(), 60);
														setCookie("bf.login.userid", action.result.userid, 60);
														setCookie("bf.system.flag", '0', 60);
														setCookie("bf.lockflag", '0', 60);
														window.location.href = 'index.do?reqCode=indexInit';
													}
												},
												failure : function(form, action) {
													Ext.Msg.alert('提示', errmsg, function() {
															var account = Ext.getCmp('loginForm')
																	.findById('account');
															var password = Ext.getCmp('loginForm')
																	.findById('password');
															if (errtype == '2') {
																password.focus();
																password.setValue('');
															} else if (errtype == '3') {
																account.focus();
																account.setValue('');
															}
														});
												}
											});
										},
										failure : function(response) {
											var resultArray = Ext.util.JSON
													.decode(response.responseText);
											Ext.Msg.alert('提示',
													resultArray.msg);
										}
									});
									
								} else {//不踢出之前的用户
									Ext.getCmp('loginForm').form.reset();
									account.focus();
									//account.validate();
								}
							}
						});

					}
					else {
						Ext.Msg.alert('提示', errmsg, function() {
								var account = Ext.getCmp('loginForm')
										.findById('account');
								var password = Ext.getCmp('loginForm')
										.findById('password');
								if (errtype == '1') {
									//Ext.getCmp('loginForm').form.reset();
									account.focus();
									account.setValue('');
									//account.validate();
								} else if (errtype == '2') {
									password.focus();
									password.setValue('');
								} else if (errtype == '3') {
									account.focus();
								}
							});
					}
				}
			});
		}
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
				var result = Ext.util.JSON.decode(response.responseText);
				var account = Ext.getCmp('loginForm').findById('account');
				setCookie("bf.login.account", account.getValue(), 60);
				setCookie("bf.login.userid", result.userid, 60);
				setCookie("bf.system.flag", '0', 60);
				setCookie("bf.lockflag", '0', 60);
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
	
	
	
	/**
	 * 注册新帐户
	 */
	function regAccount() {
		if (!addUserFormPanel.form.isValid()) {
			return;
		}
		var values = addUserFormPanel.getForm().getValues();
		if (values.password1 != values.password) {
			Ext.Msg.alert('提示', '两次输入的密码不匹配,请重新输入!');
			Ext.getCmp('password').setValue('');
			Ext.getCmp('password1').setValue('');
			return;
		}
		
		addUserFormPanel.form.submit({
					url : 'login.do?reqCode=regAccount',
					waitTitle : '提示',
					method : 'POST',
					waitMsg : '正在处理数据,请稍候...',
					success : function(form, action) {
						addUserWindow.hide();
						Ext.MessageBox.alert('提示', '帐户注册成功,点击[登录]按钮进入系统!');
						var password = Ext.getCmp('loginForm')
								.findById('password');
						var account = Ext.getCmp('loginForm')
								.findById('account');
						password.setValue(values.password);
						account.setValue(values.account);
					},
					failure : function(form, action) {
						Ext.MessageBox.alert('提示', action.result.msg);
					}
				});
	}
	
	
});
