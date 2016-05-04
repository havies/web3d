/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.project.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * projects
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-14
 */
public class projectsVo extends BaseVo {

	private String projectid;
	/*类型：0--系统项目，1--DIY项目*/
	private Integer type;
	/*项目名称*/
	private String projectname;
	/*风格编号*/
	private String categoryid;
	
	/**
	 * 构造函数
	 */
	public projectsVo() {
	}
	
	/**
	 * 设置 
	 * @param projectid 
	 */
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	/**
	 * 取得 
	 * @return Projectid
	 */
	public String getProjectid() {
		return this.projectid;
	}
	/**
	 * 设置 类型：0--系统项目，1--DIY项目
	 * @param type 类型：0--系统项目，1--DIY项目
	 */
	public void setType(Integer type) {
		this.type = type;
	}
	/**
	 * 取得 类型：0--系统项目，1--DIY项目
	 * @return Type
	 */
	public Integer getType() {
		return this.type;
	}
	/**
	 * 设置 项目名称
	 * @param projectname 项目名称
	 */
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	/**
	 * 取得 项目名称
	 * @return Projectname
	 */
	public String getProjectname() {
		return this.projectname;
	}
	/**
	 * 设置 风格编号
	 * @param categoryid 风格编号
	 */
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	/**
	 * 取得 风格编号
	 * @return Categoryid
	 */
	public String getCategoryid() {
		return this.categoryid;
	}
}
