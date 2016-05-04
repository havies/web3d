package com.boidea.framework.codegen.impl;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.nutz.json.Json;
import org.nutz.lang.Strings;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.boidea.framework.codegen.ConfigPool;
import com.boidea.framework.codegen.DatabaseAdaptor;
import com.boidea.framework.codegen.MoleContext;
import com.boidea.framework.codegen.meta.ZField;
import com.boidea.framework.codegen.meta.ZTable;

public class GenerallyDatabaseAdaptor implements DatabaseAdaptor {

	private static final Log log = Logs.get();

	public MoleContext fromDb(MoleContext context) {
		Connection connection = null;
		ConfigPool config = context.getConfig();
		try {
			//获取数据库连接
			Class.forName(config.getProject().get("db_driver"));
			connection = DriverManager.getConnection(	config.getProject().get("db_url"),
														config.getProject().get("db_username"),
														config.getProject().get("db_password"));
				if(connection==null || connection.isClosed())
				{	
					return null;
				}
				connection.setReadOnly(true);
				//获取数据库的元数据
				DatabaseMetaData metaData = connection.getMetaData();
				
				ResultSet tableResultset = metaData.getTables(	null,
																null,
																null,
																new String[]{"TABLE"});
				//开始遍历全部结果(即全部表)
				List<ZTable> tables = new ArrayList<ZTable>(10);
				while (tableResultset.next()) {
					
					ZTable zTable = new ZTable();
					zTable.setTableName(tableResultset.getString("TABLE_NAME"));

					//在tabel-mapping.properties里配置的表才生成代码
					if(null != config.getTableMapping().get(zTable.getTableName())) {
						//查询表名-->类名映射
						zTable.setClassName(config.getTableMapping().get(zTable.getTableName()));
						if (zTable.getClassName() == null) {
							zTable.setClassName(toName(zTable.getTableName()));
						}
						//表的备注名
						zTable.setComment(tableResultset.getString("REMARKS"));	
						if(null == zTable.getComment() || "".equals(zTable.getComment()))
							zTable.setComment(config.getTableCommentMapping().get(zTable.getTableName()));
						
						//表对应的菜单资源menuid
//						zTable.setMenuid(config.getOther().get(zTable.getTableName()));
						
						tables.add(zTable);
					}
				}
				//把信息打印一下,这样用户比较清晰
//				if(log.isInfoEnabled())
					log.errorf("Load %d tables", tables.size());
//				if(log.isDebugEnabled())
					log.errorf("Tables:\n"+Json.toJson(tables));
				//好了,开始找字段
				for (ZTable zTable : tables) {
					//先来找找主键
					Set<String> pks = new HashSet<String>();
					ResultSet pkResultSet = metaData.getPrimaryKeys(null, null, zTable.getTableName());
					while (pkResultSet.next()) {
						pks.add(pkResultSet.getString("COLUMN_NAME"));
					}

					ResultSet columnResultset = metaData.getColumns(null,
																	null,
																	zTable.getTableName(),
																	null);
					while (columnResultset.next()) {
						ZField zField = new ZField();
						zField.dbFieldName = columnResultset.getString("COLUMN_NAME");
						zField.notNull = "NO".equals(columnResultset.getString("IS_NULLABLE"));
						zField.dbFieldType = columnResultset.getString("TYPE_NAME");
						zField.fieldName = config.getTableFieldMapping().get(zTable.getTableName()
																				+ "."
																				+ zField.dbFieldName);
						if (zField.fieldName == null)
							zField.fieldName = config.getTableFieldMapping().get("*."
																					+ zField.dbFieldName);
						if (zField.fieldName == null)
							zField.fieldName = Strings.lowerFirst(toName(zField.dbFieldName));
						
						zField.fieldNameCap = Strings.capitalize(zField.fieldName);
						
						if (pks.contains(zField.dbFieldName)) {
							zField.primaryKey = true;
							zTable.setPkFieldName(zField.fieldName);
							zTable.setPkColumnName(zField.dbFieldName);
						}

						// 推断字段的Java类型
						zField.classTypeName = config.getTypeMapping().get(zField.dbFieldType);
						if (zField.classTypeName == null) {
							log.errorf(	"Unkown type_name %s.%s, skip!",
											zTable.getTableName(),
											zField.dbFieldName);
							continue;
						}
						
						zField.comment=columnResultset.getString("REMARKS");
						if(zField.comment==null)
							zField.comment="";
						
						zTable.getFields().add(zField);
					}
				}
				// return tables;
				context.setTables(tables);
				return context;
			
		}
		catch (SQLException sqle)
		{
			log.errorf(sqle.getMessage());
		}
		catch (Throwable e) {
			e.printStackTrace();
		}
		finally {
			if (connection != null)
				try {
					connection.close();
				}
				catch (Throwable e) {}
		}
		return null;
	}

	@Override
	public void toTarget(MoleContext context) {
		new PojoCreater().create(context);
//		new HelpFileCreater().create(context);
	}

	public static final String toName(String srcName) {
		if (Strings.isBlank(srcName))
			return "";
		srcName = srcName.toLowerCase();
		if (srcName.startsWith("t_"))
			srcName = srcName.substring(2);
		if (srcName.startsWith("tb_"))
			srcName = srcName.substring(3);
		String[] names = srcName.split("_");
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < names.length; i++) {
			//sb.append(Strings.capitalize(names[i]));//mysql下列名不区分大小写，所以不做单独单词首字母大写的操作。全部小写。
			sb.append(names[i]);
		}
		return sb.toString();
	}
}
