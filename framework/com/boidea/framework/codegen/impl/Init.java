package com.boidea.framework.codegen.impl;

import java.io.File;

import org.nutz.lang.Files;

import com.boidea.framework.codegen.ConfigPool;

public class Init {

	/**
	 * 初始化目录结构
	 * 
	 * @param config
	 */
	public void init(ConfigPool config) {
		String projectName = config.getProject().get("projectName");
		// String packageName = config.project.getProperty("packageName");
		String output = config.getProject().get("output", "codegen/output/");
		if (!output.endsWith("/"))
			output += "/";
		Files.deleteDir(new File(output + projectName));
//		Files.makeDir(new File(output + projectName + "/WebContent/WEB-INF/pages/"));
	}
}
