package com.boidea.framework.core.mvc.xstruts.action;

import com.boidea.framework.core.mvc.xstruts.config.FormBeanConfig;

public class ActionFormBean extends FormBeanConfig {
	/**
	 * <p>
	 * Construct an instance with default vaslues.
	 * </p>
	 */
	public ActionFormBean() {
		super();
	}

	/**
	 * <p>
	 * Construct an instance with the specified values.
	 * </p>
	 * 
	 * @param name
	 *            Form bean name
	 * @param type
	 *            Fully qualified class name
	 */
	public ActionFormBean(String name, String type) {
		super();
		setName(name);
		setType(type);
	}
}
