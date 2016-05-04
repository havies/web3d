/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.product.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * material2product
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-14
 */
public class material2productVo extends BaseVo {

	private String uuid;
	/*材质ID*/
	private String materialid;
	/*产品ID*/
	private String productid;
	
	/**
	 * 构造函数
	 */
	public material2productVo() {
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
	 * 设置 材质ID
	 * @param materialid 材质ID
	 */
	public void setMaterialid(String materialid) {
		this.materialid = materialid;
	}
	/**
	 * 取得 材质ID
	 * @return Materialid
	 */
	public String getMaterialid() {
		return this.materialid;
	}
	/**
	 * 设置 产品ID
	 * @param productid 产品ID
	 */
	public void setProductid(String productid) {
		this.productid = productid;
	}
	/**
	 * 取得 产品ID
	 * @return Productid
	 */
	public String getProductid() {
		return this.productid;
	}
}
