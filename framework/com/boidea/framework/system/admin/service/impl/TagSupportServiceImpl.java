package com.boidea.framework.system.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.bouncycastle.jce.exception.ExtCertificateEncodingException;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.properties.PropertiesFactory;
import com.boidea.framework.core.properties.PropertiesFile;
import com.boidea.framework.core.properties.PropertiesHelper;
import com.boidea.framework.system.admin.service.TagSupportService;
import com.boidea.framework.system.admin.web.tag.vo.MenuVo;
import com.boidea.framework.system.common.util.SystemConstants;
import com.boidea.framework.util.BFUtils;

/**
 * 权限模型标签业务实现类
 * 
 * @author zhaozh
 * @since 2010-05-13
 */
public class TagSupportServiceImpl extends BizServiceImpl implements TagSupportService {

	/**
	 * 获取卡片
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getCardList(Dto pDto) {
		Dto outDto = new BaseDto();
		List resultList = new ArrayList();
		String accountType = pDto.getAsString("accountType");
		pDto.put("dbType", "common");
		if (System.getProperty("bfDao.db").equalsIgnoreCase("sqlserver")) {
			pDto.put("dbType", "sqlserver");
		}
		if (!accountType.equalsIgnoreCase(SystemConstants.ACCOUNTTYPE_NORMAL)) {
			resultList = bfDao.queryForList("ArmTagSupport.getCardListBasedSuperAndDeveloper", pDto);
			outDto.setDefaultAList(resultList);
			return outDto;
		}
		List cardListBasedRole = bfDao.queryForList("ArmTagSupport.getCardList", pDto);
		List cardListBasedUser = bfDao.queryForList("ArmTagSupport.getCardListBasedUser", pDto);
		if (BFUtils.isEmpty(cardListBasedRole)) {
			resultList.addAll(cardListBasedUser);
		} else {
			resultList.addAll(cardListBasedRole);
			for (int i = 0; i < cardListBasedUser.size(); i++) {
				MenuVo menuVoBaseUser = (MenuVo) cardListBasedUser.get(i);
				boolean flag = true;
				for (int j = 0; j < cardListBasedRole.size(); j++) {
					MenuVo menuVoBaseRole = (MenuVo) cardListBasedRole.get(j);
					if (menuVoBaseUser.getMenuid().equals(menuVoBaseRole.getMenuid())) {
						flag = false;
					}
				}
				if (flag)
					resultList.add(menuVoBaseUser);
			}
		}
		outDto.setDefaultAList(resultList);
		return outDto;
	}

	/**
	 * 获取卡片子树
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getCardTreeList(Dto pDto) {
		Dto outDto = new BaseDto();
		List resultList = new ArrayList();
		String accountType = pDto.getAsString("accountType");
		if (!accountType.equalsIgnoreCase(SystemConstants.ACCOUNTTYPE_NORMAL)) {
			resultList = bfDao.queryForList("ArmTagSupport.getCardTreeListBasedSuperAndDeveloper", pDto);
			for (int i = 0; i < resultList.size(); i++) {
				MenuVo vo = (MenuVo)resultList.get(i);
				if (vo.getMenuid().length() == 4) {
					vo.setIsRoot("true");
				}else {
					vo.setIsRoot("false");
				}
				if (vo.getExpanded().equals("1")) {
					vo.setExpanded("true");
				}else if (vo.getExpanded().equals("0")) {
					vo.setExpanded("false");
				}
				if (BFUtils.isEmpty(vo.getIcon())) {
					vo.setIcon("tab_blank.png");
				}
			}
			outDto.setDefaultAList(resultList);
			return outDto;
		}
		List cardTreeListBasedRole = new ArrayList();;
		cardTreeListBasedRole = bfDao.queryForList("ArmTagSupport.getCardTreeList", pDto);
		for (int i = 0; i < cardTreeListBasedRole.size(); i++) {
			MenuVo vo = (MenuVo)cardTreeListBasedRole.get(i);
			if (vo.getMenuid().length() == 4) {
				vo.setIsRoot("true");
			}else {
				vo.setIsRoot("false");
			}
			if (vo.getExpanded().equals("1")) {
				vo.setExpanded("true");
			}else if (vo.getExpanded().equals("0")) {
				vo.setExpanded("false");
			}
			if (BFUtils.isEmpty(vo.getIcon())) {
				vo.setIcon("tab_blank.png");
			}
		}
		List cardTreeListBasedUser = new ArrayList();;
		cardTreeListBasedUser = bfDao.queryForList("ArmTagSupport.getCardTreeListBasedUser", pDto);
		for (int i = 0; i < cardTreeListBasedUser.size(); i++) {
			MenuVo vo = (MenuVo)cardTreeListBasedUser.get(i);
			if (vo.getMenuid().length() == 4) {
				vo.setIsRoot("true");
			}else {
				vo.setIsRoot("false");
			}
			if (vo.getExpanded().equals("1")) {
				vo.setExpanded("true");
			}else if (vo.getExpanded().equals("0")) {
				vo.setExpanded("false");
			}
			if (BFUtils.isEmpty(vo.getIcon())) {
				vo.setIcon("tab_blank.png");
			}
		}
		if (BFUtils.isEmpty(cardTreeListBasedRole)) {
			resultList.addAll(cardTreeListBasedUser);
		} else {
			resultList.addAll(cardTreeListBasedRole);
			for (int i = 0; i < cardTreeListBasedUser.size(); i++) {
				MenuVo menuVoBaseUser = (MenuVo) cardTreeListBasedUser.get(i);
				boolean flag = true;
				for (int j = 0; j < cardTreeListBasedRole.size(); j++) {
					MenuVo menuVoBaseRole = (MenuVo) cardTreeListBasedRole.get(j);
					if (menuVoBaseUser.getMenuid().equals(menuVoBaseRole.getMenuid())) {
						flag = false;
					}
				}
				if (flag)
					resultList.add(menuVoBaseUser);
			}
		}
		for (int i = 0; i < resultList.size(); i++) {
			MenuVo menuVo = (MenuVo) resultList.get(i);
			if (menuVo.getMenuid().equals(SystemConstants.ROORID_MENU)) {
				resultList.remove(i);
			}
		}
		outDto.setDefaultAList(resultList);
		return outDto;
	}
	
	/**
	 * 获取应用菜单(桌面布局)
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getMenuList4Desktop(Dto pDto) {
		Dto outDto = new BaseDto();
		List resultList = new ArrayList();
		String accountType = pDto.getAsString("accountType");
		if (!accountType.equalsIgnoreCase(SystemConstants.ACCOUNTTYPE_NORMAL)) {
			resultList = bfDao.queryForList("ArmTagSupport.getCardTreeListBasedSuperAndDeveloper4Desktop", pDto);
			resultList = doProcessList(resultList);
			outDto.setDefaultAList(resultList);
			return outDto;
		}
		List cardTreeListBasedRole = new ArrayList();;
		cardTreeListBasedRole = bfDao.queryForList("ArmTagSupport.getCardTreeList4Desktop", pDto);
		List cardTreeListBasedUser = new ArrayList();;
		cardTreeListBasedUser = bfDao.queryForList("ArmTagSupport.getCardTreeListBasedUser4Desktop", pDto);
		if (BFUtils.isEmpty(cardTreeListBasedRole)) {
			resultList.addAll(cardTreeListBasedUser);
		} else {
			resultList.addAll(cardTreeListBasedRole);
			for (int i = 0; i < cardTreeListBasedUser.size(); i++) {
				MenuVo menuVoBaseUser = (MenuVo) cardTreeListBasedUser.get(i);
				boolean flag = true;
				for (int j = 0; j < cardTreeListBasedRole.size(); j++) {
					MenuVo menuVoBaseRole = (MenuVo) cardTreeListBasedRole.get(j);
					if (menuVoBaseUser.getMenuid().equals(menuVoBaseRole.getMenuid())) {
						flag = false;
					}
				}
				if (flag)
					resultList.add(menuVoBaseUser);
			}
		}
		resultList = doProcessList(resultList);
		outDto.setDefaultAList(resultList);
		return outDto;
	}
	
	/**
	 * 加工桌面布局菜单
	 * 
	 * @param resultList
	 * @return
	 */
	private List doProcessList(List resultList){
		PropertiesHelper bfPHelper = PropertiesFactory.getPropertiesHelper(PropertiesFile.BF);
		String defaultShortcut = bfPHelper.getValue("desktopShortcut", "window.png");
		for (int i = 0; i < resultList.size(); i++) {
			MenuVo vo = (MenuVo)resultList.get(i);
			vo.setMaxed("false");
			if (BFUtils.isEmpty(vo.getShortcut())) {
				vo.setShortcut(defaultShortcut);
			}
			if (vo.getMenuname() != null && vo.getMenuname().length() > 10) {
				vo.setMenuname(vo.getMenuname().substring(0, 10));
			}
			if (BFUtils.isEmpty(vo.getScrollbar()) || vo.getScrollbar().equals("0")) {
				vo.setScrollbar("no");
			}else {
				vo.setScrollbar("yes");
			}
			if (BFUtils.isEmpty(vo.getWidth()) || vo.getWidth() == 0) {
				vo.setWidth(800);
				vo.setMaxed("true");
			}
			if (BFUtils.isEmpty(vo.getHeight()) || vo.getHeight() == 0) {
				vo.setHeight(600);
				vo.setMaxed("true");
			}
		}
		return resultList;
	}

	/**
	 * 获取登录人员所属部门信息
	 * 
	 * @return                            
	 */
	public Dto getDepartmentInfo(Dto pDto) {
		Dto outDto = (BaseDto) bfDao.queryForObject("ArmTagSupport.getDepartmentInfo", pDto);
		String deptname = ((BaseDto)bfDao.queryForObject("ArmTagSupport.getDepartmentInfo", pDto)).getAsString("deptname");
		return outDto;
	}

	/**
	 * 获取登录人员附加信息
	 * 
	 * @param pDto
	 * @return
	 */
	public Dto getEauserSubInfo(Dto pDto) {
		return (BaseDto)bfDao.queryForObject("ArmTagSupport.getEauserSubInfo", pDto);
	}

}
