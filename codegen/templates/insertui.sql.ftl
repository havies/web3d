INSERT INTO eamenupart (`PARTID`,`MENUID`,`CMPID`,`CMPTYPE`,`REMARK`) VALUES ('${zTable.menuid}P11','${zTable.menuid}','id_add_button','1','新增按钮');
INSERT INTO eamenupart (`PARTID`,`MENUID`,`CMPID`,`CMPTYPE`,`REMARK`) VALUES ('${zTable.menuid}P12','${zTable.menuid}','id_update_button','1','修改按钮');
INSERT INTO eamenupart (`PARTID`,`MENUID`,`CMPID`,`CMPTYPE`,`REMARK`) VALUES ('${zTable.menuid}P13','${zTable.menuid}','id_delete_button','1','删除按钮');
INSERT INTO eamenupart (`PARTID`,`MENUID`,`CMPID`,`CMPTYPE`,`REMARK`) VALUES ('${zTable.menuid}P14','${zTable.menuid}','id_query_button','1','组合查询按钮');
INSERT INTO eamenupart (`PARTID`,`MENUID`,`CMPID`,`CMPTYPE`,`REMARK`) VALUES ('${zTable.menuid}P15','${zTable.menuid}','id_export_button','1','导出Excel按钮');

<#list zTable.fields as zField>
<#if zField.primaryKey?string("yes", "no") == "no">
INSERT INTO eamenupart (`PARTID`,`MENUID`,`CMPID`,`CMPTYPE`,`REMARK`) VALUES ('${zTable.menuid}P2${zField_index}','${zTable.menuid}','${zField.fieldName}','2','${zField.comment}');
INSERT INTO eamenupart (`PARTID`,`MENUID`,`CMPID`,`CMPTYPE`,`REMARK`) VALUES ('${zTable.menuid}P4${zField_index}','${zTable.menuid}','${zField.fieldName}','4','${zField.comment}');
</#if>
</#list>

