package com.boidea.framework.codegen;

/**
 * 根据项目配置及ZTable列表生成需要的信息
 * 
 * @author zhaozh
 * 
 */
public interface Creator {

	void create(MoleContext context);
}
