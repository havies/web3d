package com.boidea.framework.core.resource.support;

import com.boidea.framework.core.resource.ResourceException;
import com.boidea.framework.core.resource.ResourceHandler;

/**
 * HandlerMapping
 * 
 * @author HuangYunHui|zhaozh
 * @since 2010-2-5
 */
public interface HandlerMapping {

	public ResourceHandler mapping(String pName) throws ResourceException;

}
