package com.boidea.framework.system.admin.service.impl;

import java.util.List;

import com.boidea.framework.core.json.JsonHelper;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.OrganizationService;
import com.boidea.framework.system.common.dao.vo.UserInfoVo;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.system.common.util.idgenerator.IdGenerator;
import com.boidea.framework.util.BFUtils;

/**
 * 组织机构模型业务实现类
 * 
 * @author zhaozh
 * @since 2010-01-13
 */
public class OrganizationServiceImpl extends BizServiceImpl implements OrganizationService {

	/**
	 * 获取用户信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getUserInfo(Dto pDto) {
		Dto outDto = new BaseDto();
		pDto.put("lock", SystemConstants.LOCK_N);
		pDto.put("enabled", SystemConstants.ENABLED_Y);
		UserInfoVo userInfo = (UserInfoVo) bfDao.queryForObject("Organization.getUserInfo", pDto);
		outDto.put("userInfo", userInfo);
		return outDto;
	}

	/**
	 * 查询部门信息生成部门树
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto queryDeptItems(Dto pDto) {
		Dto outDto = new BaseDto();
		List deptList = bfDao.queryForList("Organization.queryDeptItemsByDto", pDto);
		Dto deptDto = new BaseDto();
		for (int i = 0; i < deptList.size(); i++) {
			deptDto = (BaseDto) deptList.get(i);
			if (deptDto.getAsString("leaf").equals(SystemConstants.LEAF_Y))
				deptDto.put("leaf", new Boolean(true));
			else
				deptDto.put("leaf", new Boolean(false));
			if (deptDto.getAsString("id").length() == 6)
				deptDto.put("expanded", new Boolean(true));
		}
		outDto.put("jsonString", JsonHelper.encodeObject2Json(deptList));
		return outDto;
	}

	/**
	 * 保存部门
	 * 
	 * @param pDto
	 * @return
	 */
	public synchronized Dto saveDeptItem(Dto pDto) {
		String deptid = IdGenerator.getDeptIdGenerator(pDto.getAsString("parentid"));
		pDto.put("deptid", deptid);
		pDto.put("leaf", SystemConstants.LEAF_Y);
		// MYSQL下int类型字段不能插入空字符
		pDto.put("sortno",
				BFUtils.isEmpty(pDto.getAsString("sortno")) ? Integer.valueOf("0") : pDto.getAsString("sortno"));
		pDto.put("enabled", SystemConstants.ENABLED_Y);
		bfDao.insert("Organization.saveDeptItem", pDto);
		Dto updateDto = new BaseDto();
		updateDto.put("deptid", pDto.getAsString("parentid"));
		updateDto.put("leaf", SystemConstants.LEAF_N);
		bfDao.update("Organization.updateLeafFieldInEaDept", updateDto);
		return null;
	}

	/**
	 * 修改部门
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateDeptItem(Dto pDto) {
		if (BFUtils.isEmpty(pDto.getAsString("sortno"))) {
			pDto.put("sortno", "0");
		}
		if (pDto.getAsString("parentid").equals(pDto.getAsString("parentid_old"))) {
			pDto.remove("parentid");
			bfDao.update("Organization.updateDeptItem", pDto);
		} else {
			bfDao.update("Organization.updateEadeptItem", pDto);
			saveDeptItem(pDto);
			pDto.put("parentid", pDto.getAsString("parentid_old"));
			updateLeafOfDeletedParent(pDto);
		}
		return null;
	}

	/**
	 * 调整被删除部门的直系父级部门的Leaf属性
	 * 
	 * @param pDto
	 */
	private void updateLeafOfDeletedParent(Dto pDto) {
		String parentid = pDto.getAsString("parentid");
		pDto.put("deptid", parentid);
		Integer countInteger = (Integer) bfDao.queryForObject("Organization.prepareChangeLeafOfDeletedParentForEadept", pDto);
		if (countInteger.intValue() == 0) {
			pDto.put("leaf", SystemConstants.LEAF_Y);
		} else {
			pDto.put("leaf", SystemConstants.LEAF_N);
		}
		bfDao.update("Organization.updateLeafFieldInEaDept", pDto);
	}

	/**
	 * 删除部门项
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteDeptItems(Dto pDto) {
		Dto dto = new BaseDto();
		if (pDto.getAsString("type").equals("1")) {
			// 列表复选删除
			String[] arrChecked = pDto.getAsString("strChecked").split(",");
			for (int i = 0; i < arrChecked.length; i++) {
				dto.put("deptid", arrChecked[i]);
				deleteDept(dto);
			}
		} else {
			// 部门树右键删除
			dto.put("deptid", pDto.getAsString("deptid"));
			deleteDept(dto);
		}
		return null;
	}

	/**
	 * 删除部门 类内部调用
	 * 
	 * @param pDto
	 */
	private void deleteDept(Dto pDto) {
		Dto changeLeafDto = new BaseDto();
		Dto tempDto = (BaseDto) bfDao.queryForObject("Organization.queryDeptItemsByDto", pDto);
		if (BFUtils.isNotEmpty(tempDto)) {
			changeLeafDto.put("parentid", tempDto.getAsString("parentid"));
		}
		bfDao.delete("Organization.deleteEaroleAuthorizeInDeptManage", pDto);
		bfDao.delete("Organization.deleteEaroleInDeptManage", pDto);
		bfDao.delete("Organization.deleteEauserauthorizeInDeptManage", pDto);
		bfDao.delete("Organization.deleteEauserauthorizeInDeptManage2", pDto);
		bfDao.delete("Organization.deleteEausermenumapInDeptManage", pDto);
		bfDao.delete("Organization.deleteEausersubinfoInDeptManage", pDto);
		bfDao.delete("Organization.deleteEausermenumapInDeptManage", pDto);
		bfDao.delete("Organization.deleteEarolemenumapInDeptManage", pDto);
		bfDao.update("Organization.updateEauserInDeptManage", pDto);
		bfDao.update("Organization.updateEadeptItem", pDto);
		if (BFUtils.isNotEmpty(tempDto)) {
			updateLeafOfDeletedParent(changeLeafDto);
		}
	}

	/**
	 * 根据用户所属部门编号查询部门对象<br>
	 * 用于构造组织机构树的根节点
	 * 
	 * @param
	 * @return
	 */
	public Dto queryDeptinfoByDeptid(Dto pDto) {
		Dto outDto = new BaseDto();
		outDto.putAll((BaseDto) bfDao.queryForObject("Organization.queryDeptinfoByDeptid", pDto));
		outDto.put("success", new Boolean(true));
		return outDto;
	}

	/**
	 * 保存用户主题信息
	 * 
	 * @param pDto
	 */
	public Dto saveUserTheme(Dto pDto) {
		Dto outDto = new BaseDto();
		bfDao.update("Organization.saveUserTheme", pDto);
		outDto.put("success", new Boolean(true));
		return outDto;
	}
	
	/**
	 * 保存用户布局信息
	 * 
	 * @param pDto
	 */
	public Dto saveUserLayout(Dto pDto) {
		Dto outDto = new BaseDto();
		bfDao.update("Organization.saveUserLayout", pDto);
		outDto.put("success", new Boolean(true));
		return outDto;
	}
	
	/**
	 * 保存用户自定义桌面背景
	 * 
	 * @param pDto
	 */
	public Dto saveUserBackground(Dto pDto) {
		Dto outDto = new BaseDto();
		bfDao.update("Organization.saveUserBackground", pDto);
		outDto.put("success", new Boolean(true));
		return outDto;
	}

}
