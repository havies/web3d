/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.households.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * households
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-14
 */
public class householdsVo extends BaseVo {

	/*户型编号*/
	private String houseid;
	/*风格编号*/
	private String styleid;
	/*户型类型*/
	private String roomtype;
	/*面积*/
	private java.math.BigDecimal square;
	private String assetbundlename;
	private String assetname;
	
	/**
	 * 构造函数
	 */
	public householdsVo() {
	}
	
	/**
	 * 设置 户型编号
	 * @param houseid 户型编号
	 */
	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}
	/**
	 * 取得 户型编号
	 * @return Houseid
	 */
	public String getHouseid() {
		return this.houseid;
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
	 * 设置 户型类型
	 * @param roomtype 户型类型
	 */
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	/**
	 * 取得 户型类型
	 * @return Roomtype
	 */
	public String getRoomtype() {
		return this.roomtype;
	}
	/**
	 * 设置 面积
	 * @param square 面积
	 */
	public void setSquare(java.math.BigDecimal square) {
		this.square = square;
	}
	/**
	 * 取得 面积
	 * @return Square
	 */
	public java.math.BigDecimal getSquare() {
		return this.square;
	}
	/**
	 * 设置 
	 * @param assetbundlename 
	 */
	public void setAssetbundlename(String assetbundlename) {
		this.assetbundlename = assetbundlename;
	}
	/**
	 * 取得 
	 * @return Assetbundlename
	 */
	public String getAssetbundlename() {
		return this.assetbundlename;
	}
	/**
	 * 设置 
	 * @param assetname 
	 */
	public void setAssetname(String assetname) {
		this.assetname = assetname;
	}
	/**
	 * 取得 
	 * @return Assetname
	 */
	public String getAssetname() {
		return this.assetname;
	}
}
