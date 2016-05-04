/**
 * CopyRight 2013
 */
package com.boidea.framework.system.admin.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.system.admin.service.DataRuleService;
import com.boidea.framework.system.common.util.idgenerator.IDHelper;
import com.boidea.framework.util.BFUtils;

/**
 * 数据规则管理及授权的服务实现类
 *
 * @author zhaozehui
 * @since 2013-12-2
 */
public class DataRuleServiceImpl extends BizServiceImpl implements
		DataRuleService {

	/* (non-Javadoc)
	 * @see com.boidea.framework.system.admin.service.DataRuleService#saveRuleItem(com.boidea.framework.core.metatype.Dto)
	 */
	@Override
	public Dto saveRuleItem(Dto pDto) {
		pDto.put("ruleid", IDHelper.getRuleID());
		bfDao.insert("DataRule.saveDataRuleItem", pDto);
		return null;
	}

	/* (non-Javadoc)
	 * @see com.boidea.framework.system.admin.service.DataRuleService#deleteRuleItems(com.boidea.framework.core.metatype.Dto)
	 */
	@Override
	public Dto deleteRuleItems(Dto pDto) {
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("ruleid", arrChecked[i]);
			bfDao.delete("DataRule.deleteDataRuleInRuleManage", dto);
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.boidea.framework.system.admin.service.DataRuleService#updateRuleItem(com.boidea.framework.core.metatype.Dto)
	 */
	@Override
	public Dto updateRuleItem(Dto pDto) {
		bfDao.update("DataRule.updateDataRuleItem", pDto);
		return null;
	}

	/* (non-Javadoc)
	 * @see com.boidea.framework.system.admin.service.DataRuleService#saveRuleRoleGrant(com.boidea.framework.core.metatype.Dto)
	 */
	@Override
	public Dto saveRuleRoleGrant(Dto pDto) {
		bfDao.delete("DataRule.deleteRuleRoles", pDto);
		
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			
			if(BFUtils.isNotEmpty(arrChecked[i])) {
				dto.put("ruleroleid", IDHelper.getRuleRoleID());
				dto.put("roleid", pDto.getAsString("roleid"));
				dto.put("menuid", pDto.getAsString("menuid"));
				dto.put("ruleid", arrChecked[i]);
				bfDao.insert("DataRule.saveRuleRoleGrantItem", dto);
			}
		}
		return null;
	}

	/* (non-Javadoc)
	 * @see com.boidea.framework.system.admin.service.DataRuleService#saveRuleUserGrant(com.boidea.framework.core.metatype.Dto)
	 */
	@Override
	public Dto saveRuleUserGrant(Dto pDto) {
		bfDao.delete("DataRule.deleteRuleUsers", pDto);
		
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			if(BFUtils.isNotEmpty(arrChecked[i])) {
				dto.put("ruleuserid", IDHelper.getRuleUserID());
				dto.put("userid", pDto.getAsString("userid"));
				dto.put("menuid", pDto.getAsString("menuid"));
				dto.put("ruleid", arrChecked[i]);
				bfDao.insert("DataRule.saveSelectUser", dto);
			}
		}
		return null;
	}

}
