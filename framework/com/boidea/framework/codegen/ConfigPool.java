package com.boidea.framework.codegen;

import org.nutz.ioc.impl.PropertiesProxy;

public class ConfigPool {

	private PropertiesProxy project = new PropertiesProxy();
	private PropertiesProxy templete = new PropertiesProxy();
	private PropertiesProxy typeMapping = new PropertiesProxy();
	private PropertiesProxy tableMapping = new PropertiesProxy();
	private PropertiesProxy tableFieldMapping = new PropertiesProxy();
	private PropertiesProxy tableCommentMapping = new PropertiesProxy();
	private PropertiesProxy other = new PropertiesProxy();

	public void load() throws Throwable {
		project.setPaths("codegen/conf/1-project.properties");
		templete.setPaths("codegen/conf/templates.properties");
		typeMapping.setPaths("codegen/conf/type-mapping.properties");
		tableMapping.setPaths("codegen/conf/2-table-mapping.properties");
		tableFieldMapping.setPaths("codegen/conf/4-table-field-mapping.properties");
		tableCommentMapping.setPaths("codegen/conf/3-table-comment.properties");
//		other.setPaths("codegen/conf/5-other.properties");

		String output = project.get("output", "codegen/output/");
		if (!output.endsWith("/"))
			output += "/";
		project.put("output", output);

		project.put("projectRoot", output + project.get("projectName", "Test") + "/");
		project.put("srcFileRoot",
					project.get("projectRoot")
							+ "src/"
							+ project.get("packageName", "org.test.z").replace('.', '/')
							+ "/");
	}

	public PropertiesProxy getProject() {
		return project;
	}

	public void setProject(PropertiesProxy project) {
		this.project = project;
	}

	public PropertiesProxy getTemplete() {
		return templete;
	}

	public void setTemplete(PropertiesProxy templete) {
		this.templete = templete;
	}

	public PropertiesProxy getTypeMapping() {
		return typeMapping;
	}

	public void setTypeMapping(PropertiesProxy typeMapping) {
		this.typeMapping = typeMapping;
	}

	public PropertiesProxy getTableMapping() {
		return tableMapping;
	}

	public void setTableMapping(PropertiesProxy tableMapping) {
		this.tableMapping = tableMapping;
	}

	public PropertiesProxy getTableFieldMapping() {
		return tableFieldMapping;
	}

	public void setTableFieldMapping(PropertiesProxy tableFieldMapping) {
		this.tableFieldMapping = tableFieldMapping;
	}
	
	public PropertiesProxy getTableCommentMapping() {
		return tableCommentMapping;
	}
	
	public void setTableCommentMapping(PropertiesProxy tableCommentMapping) {
		this.tableCommentMapping = tableCommentMapping;
	}

	public PropertiesProxy getOther() {
		return other;
	}

	public void setOther(PropertiesProxy other) {
		this.other = other;
	}
	
	
	
	
}
