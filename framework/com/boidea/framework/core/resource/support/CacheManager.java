package com.boidea.framework.core.resource.support;

import com.boidea.framework.core.resource.Cache;
import com.boidea.framework.core.resource.CacheException;
import com.boidea.framework.core.resource.Resource;

/**
 * CacheManager
 * 
 * @author HuangYunHui|zhaozh
 * @since 2010-2-5
 */
public class CacheManager {
	private final Cache cache;

	public CacheManager(Cache pCache) {
		this.cache = pCache;
	}

	public void put(Resource pResource) throws CacheException {
		cache.put(pResource.getUri(), pResource);
	}

	public Resource get(String pUri) throws CacheException {
		return (Resource) cache.get(pUri);
	}

}
