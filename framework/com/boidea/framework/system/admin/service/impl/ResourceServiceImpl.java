package com.boidea.framework.system.admin.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.ResourceService;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;
import com.boidea.framework.system.common.util.idgenerator.IdGenerator;
import com.boidea.framework.util.BFUtils;

/**
 * 资源模型业务实现类
 * 
 * @author zhaozh
 * @since 2010-01-13
 */
public class ResourceServiceImpl extends BizServiceImpl implements ResourceService {

	/**
	 * 保存代码对照
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveCodeItem(Dto pDto) {
		Dto outDto = new BaseDto();
		String codeid = IDHelper.getCodeID();
		pDto.put("codeid", codeid);
		Dto checkDto = (BaseDto) bfDao.queryForObject("Resource.checkEaCodeByIndex", pDto);
		if (BFUtils.isNotEmpty(checkDto)) {
			outDto.put("success", new Boolean(false));
			outDto.put("msg", "违反唯一约束,[对照字段]和[代码]组合不能重复.");
			return outDto;
		} else {
			bfDao.insert("Resource.createEacodeDomain", pDto);
			outDto.put("success", new Boolean(true));
		}
		return outDto;
	}

	/**
	 * 删除代码表
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteCodeItem(Dto pDto) {
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for (int i = 0; i < arrChecked.length; i++) {
			dto.put("codeid", arrChecked[i]);
			Dto chechkDto = (BaseDto) bfDao.queryForObject("Resource.getEaCodeByKey", dto);
			if (chechkDto.getAsString("editmode").equals(SystemConstants.EDITMODE_Y)) {
				bfDao.delete("Resource.deleteCodeItem", dto);
			}
		}
		return null;
	}

	/**
	 * 修改代码表
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateCodeItem(Dto pDto) {
		bfDao.update("Resource.updateCodeItem", pDto);
		return null;
	}

	/**
	 * 保存菜单
	 * 
	 * @param pDto
	 * @return
	 */
	public synchronized Dto saveMenuItem(Dto pDto) {
		String menuid = IdGenerator.getMenuIdGenerator(pDto.getAsString("parentid"));
		pDto.put("menuid", menuid);
		pDto.put("leaf", SystemConstants.LEAF_Y);
		pDto.put("sortno", BFUtils.isEmpty(pDto.getAsString("sortno")) ? Integer.valueOf("0") : pDto
				.getAsInteger("sortno"));
		pDto.put("width", BFUtils.isEmpty(pDto.getAsString("width")) ? null : pDto
				.getAsInteger("width"));
		pDto.put("height", BFUtils.isEmpty(pDto.getAsString("height")) ? null : pDto
				.getAsInteger("height"));
		bfDao.insert("Resource.saveMenuItem", pDto);
		Dto updateDto = new BaseDto();
		updateDto.put("menuid", pDto.getAsString("parentid"));
		updateDto.put("leaf", SystemConstants.LEAF_N);
		bfDao.update("Resource.updateLeafFieldInEaMenu", updateDto);
		return null;
	}

	/**
	 * 删除菜单项
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteMenuItems(Dto pDto) {
		Dto dto = new BaseDto();
		Dto changeLeafDto = new BaseDto();
		if (pDto.getAsString("type").equals("1")) {
			String[] arrChecked = pDto.getAsString("strChecked").split(",");
			for (int i = 0; i < arrChecked.length; i++) {
				dto.put("menuid", arrChecked[i]);
				changeLeafDto.put("parentid", ((BaseDto) bfDao.queryForObject("Resource.queryMenuItemsByDto", dto))
						.getAsString("parentid"));
				bfDao.delete("Resource.deleteEamenuItem", dto);
				bfDao.delete("Resource.deleteEarwauthorizeItem", dto);
				bfDao.delete("Resource.deleteEausermenumapByMenuid", dto);
				updateLeafOfDeletedParent(changeLeafDto);
			}
		} else {
			dto.put("menuid", pDto.getAsString("menuid"));
			changeLeafDto.put("parentid", ((BaseDto) bfDao.queryForObject("Resource.queryMenuItemsByDto", dto))
					.getAsString("parentid"));
			bfDao.delete("Resource.deleteEamenuItem", dto);
			bfDao.delete("Resource.deleteEarwauthorizeItem", dto);
			bfDao.delete("Resource.deleteEausermenumapByMenuid", dto);
			updateLeafOfDeletedParent(changeLeafDto);
		}
		return null;
	}

	/**
	 * 调整被删除菜单的直系父级菜单的Leaf属性
	 * 
	 * @param pDto
	 */
	private void updateLeafOfDeletedParent(Dto pDto) {
		String parentid = pDto.getAsString("parentid");
		pDto.put("menuid", parentid);
		Integer countInteger = (Integer) bfDao.queryForObject("Resource.prepareChangeLeafOfDeletedParent", pDto);
		if (countInteger.intValue() == 0) {
			pDto.put("leaf", SystemConstants.LEAF_Y);
		} else {
			pDto.put("leaf", SystemConstants.LEAF_N);
		}
		bfDao.update("Resource.updateLeafFieldInEaMenu", pDto);
	}

	/**
	 * 修改菜单
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateMenuItem(Dto pDto) {
		pDto.put("sortno", BFUtils.isEmpty(pDto.getAsString("sortno")) ? Integer.valueOf("0") : pDto
				.getAsString("sortno"));
		pDto.put("width", BFUtils.isEmpty(pDto.getAsString("width")) ? Integer.valueOf("0") : pDto
				.getAsString("width"));
		pDto.put("height", BFUtils.isEmpty(pDto.getAsString("height")) ? Integer.valueOf("0") : pDto
				.getAsString("height"));
		if (pDto.getAsString("parentid").equals(pDto.getAsString("parentid_old"))) {
			pDto.remove("parentid");
			bfDao.update("Resource.updateMenuItem", pDto);
		} else {
			bfDao.delete("Resource.deleteEamenuItem", pDto);
			bfDao.delete("Resource.deleteEarwauthorizeItem", pDto);
			bfDao.delete("Resource.deleteEausermenumapByMenuid", pDto);
			saveMenuItem(pDto);
			pDto.put("parentid", pDto.getAsString("parentid_old"));
			updateLeafOfDeletedParent(pDto);
		}
		return null;
	}

}
