package com.boidea.framework.system.admin.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.UserService;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;
import com.boidea.framework.util.BFUtils;

/**
 * 用户管理与授权业务实现类
 * 
 * @author zhaozh
 * @since 2010-04-13
 */
public class UserServiceImpl extends BizServiceImpl implements UserService {

	/**
	 * 保存用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveUserItem(Dto pDto) {
		Dto outDto = new BaseDto();
		pDto.put("enabled", SystemConstants.ENABLED_Y);
		Integer temp = (Integer) bfDao.queryForObject("User.checkAccount", pDto);
		if (temp.intValue() != 0) {
			outDto.put("msg", "登录账户" + outDto.getAsString("account") + "已被占用,请尝试其它帐户!");
			outDto.put("success", new Boolean(false));
			return outDto;
		}
		pDto.put("userid", IDHelper.getUserID());
		String password = pDto.getAsString("password");
		String mPasswor = BFUtils.encryptBasedDes(password);
		pDto.put("password", mPasswor);
		bfDao.insert("User.saveUserItem", pDto);
		bfDao.insert("User.saveEausersubinfoItem", pDto);
		outDto.put("msg", "用户数据新增成功");
		outDto.put("success", new Boolean(true));
		return outDto;
	}

	/**
	 * 删除用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto deleteUserItems(Dto pDto) {
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for (int i = 0; i < arrChecked.length; i++) {
			dto.put("userid", arrChecked[i]);
			bfDao.update("User.updateEauserInUserManage", dto);
			bfDao.delete("User.deleteEauserauthorizeInUserManage", dto);
			bfDao.delete("User.deleteEausermenumapByUserid", dto);
			bfDao.delete("User.deleteEausersubinfoByUserid", dto);
		}
		return null;
	}

	/**
	 * 修改用户
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateUserItem(Dto pDto) {
		String password = pDto.getAsString("password");
		if (password.equalsIgnoreCase("@@@@@@")) {
			pDto.remove("password");
		}else {
			String mPasswor = BFUtils.encryptBasedDes(password);
			pDto.put("password", mPasswor);
		}
		bfDao.update("User.updateUserItem", pDto);
		if (!pDto.getAsString("deptid").equals(pDto.getAsString("deptid_old"))) {
			bfDao.delete("User.deleteEauserauthorizeInUserManage", pDto);
			bfDao.delete("User.deleteEausermenumapByUserId", pDto);
		}
		return null;
	}

	/**
	 * 保存人员角色关联信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveSelectedRole(Dto pDto) {
		bfDao.delete("User.deleteEaUserAuthorizeByUserId", pDto);
		String[] roleids = pDto.getAsString("roleid").split(",");
		for (int i = 0; i < roleids.length; i++) {
			String roleid = roleids[i];
			if (BFUtils.isEmpty(roleid))
				continue;
			pDto.put("roleid", roleid);
			pDto.put("authorizeid", IDHelper.getAuthorizeid4User());
			bfDao.insert("User.saveSelectedRole", pDto);
		}
		return null;
	}

	/**
	 * 保存人员菜单关联信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto saveSelectedMenu(Dto pDto) {
		bfDao.delete("User.deleteEausermenumapByUserId", pDto);
		String[] menuids = pDto.getAsString("menuid").split(",");
		for (int i = 0; i < menuids.length; i++) {
			String menuid = menuids[i];
			if (BFUtils.isEmpty(menuid))
				continue;
			pDto.put("menuid", menuid);
			pDto.put("authorizeid", IDHelper.getAuthorizeid4Usermenumap());
			pDto.put("authorizelevel", SystemConstants.AUTHORIZELEVEL_ACCESS);
			bfDao.insert("User.saveSelectedMenu", pDto);
		}
		return null;
	}

	/**
	 * 修改用户(提供首页修改使用)
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto updateUserItem4IndexPage(Dto pDto) {
		String password = pDto.getAsString("password");
		String mPasswor = BFUtils.encryptBasedDes(password);
		pDto.put("password", mPasswor);
		bfDao.update("User.updateUserItem2", pDto);
		return null;
	}

}
