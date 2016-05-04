/**
 * Management Information System Platform
 * CopyRight 2014
 */

package com.boidea.app.web3d.category.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * categorys
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2016-04-13
 */
public class categorysVo extends BaseVo {

	/*产品分类编号*/
	private String categoryid;
	/*产品分类名称*/
	private String categoryname;
	/*父结点ID*/
	private String parentid;
	
	/**
	 * 构造函数
	 */
	public categorysVo() {
	}
	
	/**
	 * 设置 产品分类编号
	 * @param categoryid 产品分类编号
	 */
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	/**
	 * 取得 产品分类编号
	 * @return Categoryid
	 */
	public String getCategoryid() {
		return this.categoryid;
	}
	/**
	 * 设置 产品分类名称
	 * @param categoryname 产品分类名称
	 */
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	/**
	 * 取得 产品分类名称
	 * @return Categoryname
	 */
	public String getCategoryname() {
		return this.categoryname;
	}
	/**
	 * 设置 父结点ID
	 * @param parentid 父结点ID
	 */
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	/**
	 * 取得 父结点ID
	 * @return Parentid
	 */
	public String getParentid() {
		return this.parentid;
	}
}
