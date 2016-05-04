package com.boidea.framework.core.resource.support;

import com.boidea.framework.core.resource.ResourceException;

/**
 * ResourceConfigMapping
 * 
 * @author HuangYunHui|zhaozh
 * @since 2010-2-5
 */
public interface ResourceConfigMapping {
	public ResourceConfig mapping(String pUri) throws ResourceException;
}
