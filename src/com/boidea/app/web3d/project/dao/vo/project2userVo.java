/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.project.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * project2user
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-14
 */
public class project2userVo extends BaseVo {

	private String uuid;
	/*项目编号*/
	private String projectid;
	/*用户编号*/
	private String userid;
	
	/**
	 * 构造函数
	 */
	public project2userVo() {
	}
	
	/**
	 * 设置 
	 * @param uuid 
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	/**
	 * 取得 
	 * @return Uuid
	 */
	public String getUuid() {
		return this.uuid;
	}
	/**
	 * 设置 项目编号
	 * @param projectid 项目编号
	 */
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	/**
	 * 取得 项目编号
	 * @return Projectid
	 */
	public String getProjectid() {
		return this.projectid;
	}
	/**
	 * 设置 用户编号
	 * @param userid 用户编号
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	 * 取得 用户编号
	 * @return Userid
	 */
	public String getUserid() {
		return this.userid;
	}
}
