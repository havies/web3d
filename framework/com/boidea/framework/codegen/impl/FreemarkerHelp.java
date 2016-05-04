package com.boidea.framework.codegen.impl;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.nutz.lang.Files;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

public class FreemarkerHelp {

	static Configuration cfg = new Configuration();
	
	static {
		try {
			cfg.setDirectoryForTemplateLoading(new File("./codegen/templates"));
			cfg.setObjectWrapper(new DefaultObjectWrapper());
			cfg.setSharedVariable("todayDate", new TemplateMethodModel() {
				 private static final String DEFAULT_PATTERN = "yyyy-MM-dd"; 
				@Override
				public Object exec(List arg0) throws TemplateModelException {
					Date date = new Date();  
			        String pattern = arg0.get(0).toString();  
			        try {  
			            return new SimpleDateFormat(pattern).format(date);  
			        } catch (RuntimeException e) {  
			            return new SimpleDateFormat(DEFAULT_PATTERN).format(date);  
			        }  

				}
				
			});
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static final void make(String path, String templateName, Map<String, Object> datas) {
		try {
			Files.createNewFile(new File(path));
			Template template = cfg.getTemplate(templateName);
			Writer out = new FileWriter(path);
			template.process(datas, out);
			out.flush();
			out.close();
		}
		catch (Throwable e) {
			e.printStackTrace();
		}
	}
}
