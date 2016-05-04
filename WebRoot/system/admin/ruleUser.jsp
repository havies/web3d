<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<bf:html title="数据规则人员授权">
<bf:import src="/system/admin/js/ruleUser.js"/>
<bf:body>
<bf:div key="deptTreeDiv" />
<bf:ext.codeRender fields="CMPTYPE"/>
<bf:ext.codeStore fields="CMPTYPE"/>
<bf:ext.codeRender fields="PARTAUTHTYPE"/>
<bf:ext.codeStore fields="PARTAUTHTYPE"/>
<bf:ext.codeRender fields="SEX,LOCKED,USERTYPE,DATARULE"/>
<bf:ext.codeStore fields="SEX,LOCKED,USERTYPE:3,DATARULE"/>
</bf:body>
<bf:script>
   var root_deptid = '<bf:out key="rootDeptid" scope="request"/>';
   var root_deptname = '<bf:out key="rootDeptname" scope="request"/>';
   var root_menuname = '<bf:out key="rootMenuName" scope="request"/>';
</bf:script>
</bf:html>