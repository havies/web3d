package com.boidea.framework.system.common.util.idgenerator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.id.SequenceStorer;
import com.boidea.framework.core.id.fomater.DefaultSequenceFormater;
import com.boidea.framework.core.id.generator.DefaultIDGenerator;
import com.boidea.framework.core.id.sequence.DefaultSequenceGenerator;
import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.SpringBeanLoader;
import com.boidea.framework.core.model.dao.Dao;
import com.boidea.framework.util.BFConstants;
import com.boidea.framework.util.BFUtils;

/**
 * ID生成器
 * @author zhaozh
 * @since 2009-07-13
 */
public class IdGenerator {
	private static Log log = LogFactory.getLog(IdGenerator.class);
	private static int catche = 1;
	private static Dao bfDao = (Dao)SpringBeanLoader.getSpringBean("bfDao");
	
	/**
	 * 字段名称
	 */
	private String fieldname;
	
	public IdGenerator(String pFieldName){
		setFieldname(pFieldName);
	}
	
	public IdGenerator(){
	}
	
	/**
	 * 获取ID生成器实例
	 * @return DefaultIDGenerator
	 */
	public DefaultIDGenerator getDefaultIDGenerator(){
		Dto dto = new BaseDto();
		dto.put("fieldname", getFieldname());
		dto = (BaseDto)bfDao.queryForObject("IdGenerator.getEaSequenceByFieldName", dto);
		DefaultIDGenerator idGenerator = new DefaultIDGenerator(); 
		DefaultSequenceFormater sequenceFormater = new DefaultSequenceFormater(); 
		sequenceFormater.setPattern(dto.getAsString("pattern"));
		DefaultSequenceGenerator sequenceGenerator = new DefaultSequenceGenerator(getFieldname());
		SequenceStorer sequenceStorer = new DBSequenceStorer();
		sequenceGenerator.setSequenceStorer(sequenceStorer);
		sequenceGenerator.setCache(catche);
		idGenerator.setSequenceFormater(sequenceFormater);
		idGenerator.setSequenceGenerator(sequenceGenerator);
		return idGenerator;
	}
	
    /**
     * 菜单eamenu编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getMenuIdGenerator(String pParentid){
		String maxSubMenuId = (String)bfDao.queryForObject("IdGenerator.getMaxSubMenuId", pParentid);
		String menuId = null;
		if(BFUtils.isEmpty(maxSubMenuId)){
			menuId = "01";
		}else{
			int length = maxSubMenuId.length();
			String temp = maxSubMenuId.substring(length-2, length);
			int intMenuId = Integer.valueOf(temp).intValue() + 1;
			if(intMenuId > 0 && intMenuId < 10){
				menuId = "0" + String.valueOf(intMenuId);
			}else if(10 <= intMenuId && intMenuId <= 99){
				menuId = String.valueOf(intMenuId);
			}else if(intMenuId > 99){
				log.error(BFConstants.Exception_Head + "生成菜单编号越界了.同级兄弟节点编号为[01-99]\n请和您的系统管理员联系!");
			}else{
				log.error(BFConstants.Exception_Head + "生成菜单编号发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + menuId;
	}
	
    /**
     * 部门eadept编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getDeptIdGenerator(String pParentid){
		String maxSubDeptId = (String)bfDao.queryForObject("IdGenerator.getMaxSubDeptId", pParentid);
		String deptid = null;
		if(BFUtils.isEmpty(maxSubDeptId)){
			deptid = "001";
		}else{
			int length = maxSubDeptId.length();
			String temp = maxSubDeptId.substring(length-3, length);
			int intDeptId = Integer.valueOf(temp).intValue() + 1;
			if(intDeptId > 0 && intDeptId < 10){
				deptid = "00" + String.valueOf(intDeptId);
			}else if(10 <= intDeptId && intDeptId <= 99){
				deptid = "0" + String.valueOf(intDeptId);
			}else if (100 <= intDeptId && intDeptId <= 999) {
				deptid = String.valueOf(intDeptId);
			}else if(intDeptId >999){
				log.error(BFConstants.Exception_Head + "生成部门编号ID越界了.同级兄弟节点编号为[001-999]\n请和您的系统管理员联系!");
			}else{
				log.error(BFConstants.Exception_Head + "生成部门编号ID发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + deptid;
	}
	
	/**
     * 系统部门yy_subject_department信息编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getDepartmentIdGenerator(String pParentid){
		String maxSubDeptId = (String)bfDao.queryForObject("Department.getMaxSubDepartmentId", pParentid);
		String deptid = null;
		if(BFUtils.isEmpty(maxSubDeptId)){
			deptid = "001";
		}else{
			int length = maxSubDeptId.length();
			String temp = maxSubDeptId.substring(length-3, length);
			int intDeptId = Integer.valueOf(temp).intValue() + 1;
			if(intDeptId > 0 && intDeptId < 10){
				deptid = "00" + String.valueOf(intDeptId);
			}else if(10 <= intDeptId && intDeptId <= 99){
				deptid = "0" + String.valueOf(intDeptId);
			}else if (100 <= intDeptId && intDeptId <= 999) {
				deptid = String.valueOf(intDeptId);
			}else if(intDeptId >999){
				log.error(BFConstants.Exception_Head + "生成部门编号ID越界了.同级兄弟节点编号为[001-999]\n请和您的系统管理员联系!");
			}else{
				log.error(BFConstants.Exception_Head + "生成部门编号ID发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + deptid;
	}
	
	/**
     * 学科基本信息yy_subject_subjectinfo编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getSubjectinfoIdGenerator(String pParentid){
		String maxSubId = (String)bfDao.queryForObject("Subjectinfo.getMaxSubSubjectinfoId", pParentid);
		String infoid = null;
		if(BFUtils.isEmpty(maxSubId)){
			infoid = "001";
		}else{
			int length = maxSubId.length();
			String temp = maxSubId.substring(length-3, length);
			int intDeptId = Integer.valueOf(temp).intValue() + 1;
			if(intDeptId > 0 && intDeptId < 10){
				infoid = "00" + String.valueOf(intDeptId);
			}else if(10 <= intDeptId && intDeptId <= 99){
				infoid = "0" + String.valueOf(intDeptId);
			}else if (100 <= intDeptId && intDeptId <= 999) {
				infoid = String.valueOf(intDeptId);
			}else if(intDeptId >999){
				log.error(BFConstants.Exception_Head + "生成学科信息编号ID越界了.同级兄弟节点编号为[001-999]\n请和您的系统管理员联系!");
			}else{
				log.error(BFConstants.Exception_Head + "生成学科信息编号ID发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + infoid;
	}
	
	/**
     * 研工奖助项目基本信息yy_yg_jz_project_baseinfo编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getJzProjectbaseinfoIdGenerator(String pParentid){
		String maxSubId = (String)bfDao.queryForObject("YgJzProjectBaseInfo.getMaxJzProjectBaseInfoId", pParentid);
		String infoid = null;
		if(BFUtils.isEmpty(maxSubId)){
			infoid = "001";
		}else{
			int length = maxSubId.length();
			String temp = maxSubId.substring(length-3, length);
			int intDeptId = Integer.valueOf(temp).intValue() + 1;
			if(intDeptId > 0 && intDeptId < 10){
				infoid = "00" + String.valueOf(intDeptId);
			}else if(10 <= intDeptId && intDeptId <= 99){
				infoid = "0" + String.valueOf(intDeptId);
			}else if (100 <= intDeptId && intDeptId <= 999) {
				infoid = String.valueOf(intDeptId);
			}else if(intDeptId >999){
				log.error(BFConstants.Exception_Head + "生成学科信息编号ID越界了.同级兄弟节点编号为[001-999]\n请和您的系统管理员联系!");
			}else{
				log.error(BFConstants.Exception_Head + "生成学科信息编号ID发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + infoid;
	}
	
	/**
     * 代码管理gy_base_dmcode编号ID生成器(自定义)
     * @param pParentid 菜单编号的参考编号
     * @return
     */
	public static String getDmcodeIdGenerator(String pParentid){
		String maxSubDmid = (String)bfDao.queryForObject("Dmcode.getMaxSubDmcodeId", pParentid);
		String deptid = null;
		if(BFUtils.isEmpty(maxSubDmid)){
			deptid = "0001";
		}else{
			int length = maxSubDmid.length();
			String temp = maxSubDmid.substring(length-4, length);
			int intDeptId = Integer.valueOf(temp).intValue() + 1;
			if(intDeptId > 0 && intDeptId < 10){
				deptid = "000" + String.valueOf(intDeptId);
			}else if(10 <= intDeptId && intDeptId <= 99){
				deptid = "00" + String.valueOf(intDeptId);
			}else if(100 <= intDeptId && intDeptId <= 999){
				deptid = "0" + String.valueOf(intDeptId);
			}else if (1000 <= intDeptId && intDeptId <= 9999) {
				deptid = String.valueOf(intDeptId);
			}else if(intDeptId >9999){
				log.error(BFConstants.Exception_Head + "生成代码编号ID越界了.同级兄弟节点编号为[0001-9999]\n请和您的系统管理员联系!");
			}else{
				log.error(BFConstants.Exception_Head + "生成代码编号ID发生未知错误,请和开发人员联系!");
			}
		}
		return pParentid + deptid;
	}
	
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
}
