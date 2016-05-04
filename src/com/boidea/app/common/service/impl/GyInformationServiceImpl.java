/**
 * Boidea's Management Information System Platform
 * CopyRight 2013
 */

package com.boidea.app.common.service.impl;

import com.boidea.app.common.service.GyInformationService;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;
import com.boidea.framework.util.BFUtils;


/**
 * 信息发布管理数据访问实现
 * 
 * 信息发布管理管理业务接口
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-09
 */
public class GyInformationServiceImpl extends BizServiceImpl implements GyInformationService{

	/**
	 * 保存信息发布管理
	 */
	public Dto saveGyInformationItem(Dto pDto){
		pDto.put("informationid", IDHelper.uuid());
		bfDao.insert("GyInformation.saveGyInformationItem", pDto);
		
		assignRole(pDto);
		return null;
	}
	
	private void assignRole(Dto pDto) {
		String assignroleid = pDto.getAsString("assignroleid");
		if(BFUtils.isNotEmpty(assignroleid)) {
			Dto deldto = new BaseDto();
			deldto.put("informationid", pDto.getAsString("informationid"));
			bfDao.delete("GyInformationRole.deleteGyInformationRoleItem", deldto);
			String[] roleidArr = assignroleid.split("\\,");
			for(String roleid : roleidArr) {
				Dto rdto = new BaseDto();
				rdto.put("informationroleid", IDHelper.uuid());
				rdto.put("roleid", roleid);
				rdto.put("informationid", pDto.getAsString("informationid"));
				rdto.put("scrq", pDto.getAsString("updatetime"));
				bfDao.insert("GyInformationRole.saveGyInformationRoleItem", rdto);
			}
		}
	}

	/**
	 * 删除信息发布管理
	 * 
	 * @param pDto
	 */
	public Dto deleteGyInformationItem(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("informationid", arrChecked[i]);
			bfDao.delete("GyInformation.deleteGyInformationItem", dto);
			assignRole(dto);
		}
		return null;
	}

	/**
	 * 修改信息发布管理
	 * 
	 * @param pDto
	 */
	public Dto updateGyInformationItem(Dto pDto){
		bfDao.update("GyInformation.updateGyInformationItem", pDto);
		assignRole(pDto);
		return null;
	}

}
