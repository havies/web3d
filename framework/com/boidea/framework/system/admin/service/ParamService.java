package com.boidea.framework.system.admin.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/*
 * 全局参数管理业务接口
 * @author zhaozh
 * @since 2010-05-13
 */
public interface ParamService extends BizService{

	/**
	 * 保存参数信息表
	 */
	public Dto saveParamItem(Dto pDto);

	/**
	 * 删除参数信息
	 * 
	 * @param pDto
	 */
	public Dto deleteParamItem(Dto pDto);

	/**
	 * 修改参数信息
	 * 
	 * @param pDto
	 */
	public Dto updateParamItem(Dto pDto);
}
