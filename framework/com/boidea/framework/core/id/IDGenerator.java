package com.boidea.framework.core.id;

/**
 * IDGenerator
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author zhaozh
 * @since 2010-03-17
 */
public interface IDGenerator {
	public String create() throws CreateIDException;
}