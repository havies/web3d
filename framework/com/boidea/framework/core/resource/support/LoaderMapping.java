package com.boidea.framework.core.resource.support;

import com.boidea.framework.core.resource.ResourceException;
import com.boidea.framework.core.resource.ResourceLoader;

/**
 * LoaderMapping
 * 
 * @author HuangYunHui|zhaozh
 * @since 2010-2-5
 */
public interface LoaderMapping {
	public ResourceLoader mapping(String pName) throws ResourceException;
}
