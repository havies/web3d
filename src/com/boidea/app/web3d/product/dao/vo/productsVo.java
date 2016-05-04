/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * products
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-14
 */
public class productsVo extends BaseVo {

	private String productid;
	/*产品名称*/
	private String productname;
	/*类型编号*/
	private String categoryid;
	/*风格编号*/
	private String styleid;
	/*长*/
	private java.math.BigDecimal length;
	/* 宽*/
	private java.math.BigDecimal width;
	/*高*/
	private java.math.BigDecimal height;
	private String assetbundlename;
	private String assetname;
	
	/**
	 * 构造函数
	 */
	public productsVo() {
	}
	
	/**
	 * 设置 
	 * @param productid 
	 */
	public void setProductid(String productid) {
		this.productid = productid;
	}
	/**
	 * 取得 
	 * @return Productid
	 */
	public String getProductid() {
		return this.productid;
	}
	/**
	 * 设置 产品名称
	 * @param productname 产品名称
	 */
	public void setProductname(String productname) {
		this.productname = productname;
	}
	/**
	 * 取得 产品名称
	 * @return Productname
	 */
	public String getProductname() {
		return this.productname;
	}
	/**
	 * 设置 类型编号
	 * @param categoryid 类型编号
	 */
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	/**
	 * 取得 类型编号
	 * @return Categoryid
	 */
	public String getCategoryid() {
		return this.categoryid;
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
	 * 设置 长
	 * @param length 长
	 */
	public void setLength(java.math.BigDecimal length) {
		this.length = length;
	}
	/**
	 * 取得 长
	 * @return Length
	 */
	public java.math.BigDecimal getLength() {
		return this.length;
	}
	/**
	 * 设置  宽
	 * @param width  宽
	 */
	public void setWidth(java.math.BigDecimal width) {
		this.width = width;
	}
	/**
	 * 取得  宽
	 * @return Width
	 */
	public java.math.BigDecimal getWidth() {
		return this.width;
	}
	/**
	 * 设置 高
	 * @param height 高
	 */
	public void setHeight(java.math.BigDecimal height) {
		this.height = height;
	}
	/**
	 * 取得 高
	 * @return Height
	 */
	public java.math.BigDecimal getHeight() {
		return this.height;
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
