package com.boidea.framework.codegen;

import java.util.List;

import org.nutz.lang.util.SimpleContext;

import com.boidea.framework.codegen.meta.ZTable;

@SuppressWarnings("unchecked")
public class MoleContext extends SimpleContext {

	private ConfigPool config;

	public MoleContext() {
		config = new ConfigPool();
		try {
			config.load();
		}
		catch (Throwable e) {
			e.printStackTrace();
		}
	}

	public List<ZTable> getTables() {
		return getAs(List.class, "tables");
	}

	public void setTables(List<ZTable> tables) {
		set("tables", tables);
	}

	public ConfigPool getConfig() {
		return config;
	}
}
