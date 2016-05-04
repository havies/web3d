package com.boidea.framework.system.admin.service.impl;

import java.util.List;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.PartService;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;

/**
 * UI组件授权服务实现
 * 
 * @author zhaozh
 * @since 2011-06-25
 */
public class PartServiceImpl extends BizServiceImpl implements PartService {
	
	/**
	 * 保存托管UI组件脏数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveDirtyDatas(Dto pDto){
		Dto outDto = new BaseDto();
		List list = pDto.getDefaultAList();
		if(!checkUniqueIndex(list)){
			outDto.setSuccess(BFConstants.FALSE);
			return outDto;
		}
		for (int i = 0; i < list.size(); i++) {
			Dto dto = (BaseDto)list.get(i);
			if (dto.getAsString("remark").equals("null")) {
				dto.put("remark", "");
			}
			if (dto.getAsString("dirtytype").equalsIgnoreCase("1")) {
				dto.put("partid", IDHelper.getPartID());
				bfDao.insert("Part.savePartItem", dto);
			}else {
				bfDao.update("Part.updatePartItem", dto);
			}
		}
		outDto.setSuccess(BFConstants.TRUE);
		return outDto;
	}
	
	/**
	 * 检查组件唯一性
	 * 
	 * @param pList
	 * @return
	 */
	private boolean checkUniqueIndex(List pList){
		/*
		for (int i = 0; i < pList.size(); i++) {
			Dto dto = (BaseDto)pList.get(i);
			Dto qDto = new BaseDto();
			qDto.put("menuid", dto.getAsString("menuid"));
			qDto.put("cmpid", dto.getAsString("cmpid"));
			Dto outDto = (BaseDto)bfDao.queryForObject("Part.queryPartByDto", qDto);
			if (!BFUtils.isEmpty(outDto)) {
				return false;
			}
		}
		*/
		return true;
	}
	
	
	/**
	 * 删除数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteItem(Dto pDto){
		bfDao.delete("Part.deletePartItem", pDto);
		bfDao.delete("Part.deletePartUserGrantItem", pDto);
		bfDao.delete("Part.deletePartRoleGrantItem", pDto);
		return null;
	}
	
	/**
	 * 保存UI元素人员授权数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto savePartUserGrantDatas(Dto pDto){
		List list = pDto.getDefaultAList();
		for (int i = 0; i < list.size(); i++) {
			Dto lDto = (BaseDto)list.get(i);
			if (BFUtils.isEmpty(lDto.getAsString("authorizeid"))) {
				if (!lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					lDto.put("authorizeid", IDHelper.getAuthorizeid4Eauserauthorize());
					bfDao.insert("Part.insertEausermenupartItem", lDto);
				}
			}else {
				if (lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					bfDao.delete("Part.deleteEausermenupartItem", lDto);
				}else {
					bfDao.update("Part.updateEausermenupartItem", lDto);
				}
			}
		}
		return null;
	}
	
	/**
	 * 保存UI元素角色授权数据
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto savePartRoleGrantDatas(Dto pDto){
		List list = pDto.getDefaultAList();
		for (int i = 0; i < list.size(); i++) {
			Dto lDto = (BaseDto)list.get(i);
			if (BFUtils.isEmpty(lDto.getAsString("authorizeid"))) {
				if (!lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					lDto.put("authorizeid", IDHelper.getAuthorizeid4Earoleauthorize());
					bfDao.insert("Part.insertEarolemenupartItem", lDto);
				}
			}else {
				if (lDto.getAsString("partauthtype").equals(SystemConstants.PARTAUTHTYPE_NOGRANT)) {
					bfDao.delete("Part.deleteEarolemenupartItem", lDto);
				}else {
					bfDao.update("Part.updateEarolemenupartItem", lDto);
				}
			}
		}
		return null;
	}
}
