package com.boidea.framework.core.resource;

/**
 * ResourceHandler
 * 
 * @author HuangYunHui|zhaozh
 * @since 2009-11-20
 */
public interface ResourceHandler {
	public void handle(Resource pResource) throws HandleResourceException;
}
