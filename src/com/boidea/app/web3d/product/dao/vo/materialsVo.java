/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * materials
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-14
 */
public class materialsVo extends BaseVo {

	/*材质编号*/
	private String materialid;
	/*材质名称*/
	private String materialname;
	private String assetbundlename;
	private String assetname;
	
	/**
	 * 构造函数
	 */
	public materialsVo() {
	}
	
	/**
	 * 设置 材质编号
	 * @param materialid 材质编号
	 */
	public void setMaterialid(String materialid) {
		this.materialid = materialid;
	}
	/**
	 * 取得 材质编号
	 * @return Materialid
	 */
	public String getMaterialid() {
		return this.materialid;
	}
	/**
	 * 设置 材质名称
	 * @param materialname 材质名称
	 */
	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}
	/**
	 * 取得 材质名称
	 * @return Materialname
	 */
	public String getMaterialname() {
		return this.materialname;
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
