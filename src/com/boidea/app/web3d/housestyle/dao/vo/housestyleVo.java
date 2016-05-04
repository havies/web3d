/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.housestyle.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * housestyle
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-14
 */
public class housestyleVo extends BaseVo {

	/*风格编号*/
	private String styleid;
	/*风格名称*/
	private String stylename;
	
	/**
	 * 构造函数
	 */
	public housestyleVo() {
	}
	
	/**
	 * 设置 风格编号
	 * @param styleid 风格编号
	 */
	public void setStyleid(String styleid) {
		this.styleid = styleid;
	}
	/**
	 * 取得 风格编号
	 * @return Styleid
	 */
	public String getStyleid() {
		return this.styleid;
	}
	/**
	 * 设置 风格名称
	 * @param stylename 风格名称
	 */
	public void setStylename(String stylename) {
		this.stylename = stylename;
	}
	/**
	 * 取得 风格名称
	 * @return Stylename
	 */
	public String getStylename() {
		return this.stylename;
	}
}
