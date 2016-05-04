package com.boidea.framework.codegen.meta;

public class ZField {

	public String dbFieldName;
	public String fieldName;
	public String fieldNameCap;
	public String dbFieldType;
	public String classTypeName;
	public boolean primaryKey = false;
	public boolean unique = false;
	public boolean notNull = false;
	public boolean unsign = false;
	//注释
	public String comment;
	public String getDbFieldName() {
		return dbFieldName;
	}
	public void setDbFieldName(String dbFieldName) {
		this.dbFieldName = dbFieldName;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getDbFieldType() {
		return dbFieldType;
	}
	public void setDbFieldType(String dbFieldType) {
		this.dbFieldType = dbFieldType;
	}
	public String getClassTypeName() {
		return classTypeName;
	}
	public void setClassTypeName(String classTypeName) {
		this.classTypeName = classTypeName;
	}
	public boolean getPrimaryKey() {
		return primaryKey;
	}
	public void setPrimaryKey(boolean primaryKey) {
		this.primaryKey = primaryKey;
	}
	public boolean isUnique() {
		return unique;
	}
	public void setUnique(boolean unique) {
		this.unique = unique;
	}
	public boolean isNotNull() {
		return notNull;
	}
	public void setNotNull(boolean notNull) {
		this.notNull = notNull;
	}
	public boolean isUnsign() {
		return unsign;
	}
	public void setUnsign(boolean unsign) {
		this.unsign = unsign;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getFieldNameCap() {
		return fieldNameCap;
	}
	public void setFieldNameCap(String fieldNameCap) {
		this.fieldNameCap = fieldNameCap;
	}
	
}
