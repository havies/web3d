package com.boidea.framework.system.admin.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.RoleService;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;
import com.boidea.framework.util.BFUtils;

/**
 * 角色管理与授权业务实现类
 * @author zhaozh
 * @since 2010-04-13
 */
public class RoleServiceImpl extends BizServiceImpl implements RoleService{
	
	/**
	 * 保存角色
	 * @param pDto
	 * @return
	 */
	public Dto saveRoleItem(Dto pDto){
		pDto.put("roleid", IDHelper.getRoleID());
		bfDao.insert("Role.saveRoleItem", pDto);
		return null;
	}
	
	/**
	 * 删除角色
	 * @param pDto
	 * @return
	 */
	public Dto deleteRoleItems(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("roleid", arrChecked[i]);
			bfDao.delete("Role.deleteEaroleAuthorizeInRoleManage", dto);
			bfDao.delete("Role.deleteEauserauthorizeInRoleManage", dto);
			bfDao.delete("Role.deleteEarolemenupartInRoleManage", dto);
			bfDao.delete("Role.deleteEaroleInRoleManage", dto);
		}
		return null;
	}
	
	/**
	 * 修改角色
	 * @param pDto
	 * @return
	 */
	public Dto updateRoleItem(Dto pDto){
		bfDao.update("Role.updateRoleItem", pDto);
		if(!pDto.getAsString("deptid").equals(pDto.getAsString("deptid_old"))){
			bfDao.delete("Role.deleteEaroleAuthorizeInRoleManage", pDto);
		}
		return null;
	}
	
	/**
	 * 保存角色授权信息
	 * @param pDto
	 * @return
	 */
	public Dto saveGrant(Dto pDto){
		bfDao.delete("Role.deleteERoleGrants", pDto);
		String[] menuids = pDto.getAsString("menuid").split(",");
		for(int i = 0; i < menuids.length; i++){
			String menuid = menuids[i];
			if(BFUtils.isEmpty(menuid))
				continue;
			pDto.put("menuid", menuid);
			pDto.put("authorizeid", IDHelper.getAuthorizeid4Role());
			bfDao.insert("Role.saveRoleGrantItem", pDto);
		}
		return null;
	}
	
	/**
	 * 保存角色用户关联信息
	 * @param pDto
	 * @return
	 */
	public Dto saveSelectUser(Dto pDto){
		bfDao.delete("Role.deleteEaUserAuthorizeByRoleId", pDto);
		String[] userids = pDto.getAsString("userid").split(",");
		for(int i = 0; i < userids.length; i++){
			String userid = userids[i];
			if(BFUtils.isEmpty(userid))
				continue;
			pDto.put("userid", userid);
			pDto.put("authorizeid", IDHelper.getAuthorizeid4User());
			bfDao.insert("Role.saveSelectUser", pDto);
		}
		return null;
	}
}
