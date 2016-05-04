/**
 * Boidea's Management Information System Platform
 * CopyRight 2013
 */

package com.boidea.app.common.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * 信息发布管理
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-09
 */
public class GyInformationVo extends BaseVo {

	/*ID*/
	private String informationid;
	/*信息标题*/
	private String title;
	/*所属模块*/
	private String module;
	/*信息内容*/
	private String content;
	/*信息附件*/
	private String attachment;
	/*是否置顶*/
	private String istop;
	/*信息阅读数*/
	private Integer readcount;
	/*信息创建用户*/
	private String createuser;
	/*信息创建时间*/
	private String createtime;
	/*信息修改用户*/
	private String updateuser;
	/*信息修改时间*/
	private String updatetime;
	
	/**
	 * 构造函数
	 */
	public GyInformationVo() {
	}
	
	/**
	 * 设置 ID
	 * @param informationid ID
	 */
	public void setInformationid(String informationid) {
		this.informationid = informationid;
	}
	/**
	 * 取得 ID
	 * @return Informationid
	 */
	public String getInformationid() {
		return this.informationid;
	}
	/**
	 * 设置 信息标题
	 * @param title 信息标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 取得 信息标题
	 * @return Title
	 */
	public String getTitle() {
		return this.title;
	}
	/**
	 * 设置 所属模块
	 * @param module 所属模块
	 */
	public void setModule(String module) {
		this.module = module;
	}
	/**
	 * 取得 所属模块
	 * @return Module
	 */
	public String getModule() {
		return this.module;
	}
	/**
	 * 设置 信息内容
	 * @param content 信息内容
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 取得 信息内容
	 * @return Content
	 */
	public String getContent() {
		return this.content;
	}
	/**
	 * 设置 信息附件
	 * @param attachment 信息附件
	 */
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	/**
	 * 取得 信息附件
	 * @return Attachment
	 */
	public String getAttachment() {
		return this.attachment;
	}
	/**
	 * 设置 是否置顶
	 * @param istop 是否置顶
	 */
	public void setIstop(String istop) {
		this.istop = istop;
	}
	/**
	 * 取得 是否置顶
	 * @return Istop
	 */
	public String getIstop() {
		return this.istop;
	}
	/**
	 * 设置 信息阅读数
	 * @param readcount 信息阅读数
	 */
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	/**
	 * 取得 信息阅读数
	 * @return Readcount
	 */
	public Integer getReadcount() {
		return this.readcount;
	}
	/**
	 * 设置 信息创建用户
	 * @param createuser 信息创建用户
	 */
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	/**
	 * 取得 信息创建用户
	 * @return Createuser
	 */
	public String getCreateuser() {
		return this.createuser;
	}
	/**
	 * 设置 信息创建时间
	 * @param createtime 信息创建时间
	 */
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	/**
	 * 取得 信息创建时间
	 * @return Createtime
	 */
	public String getCreatetime() {
		return this.createtime;
	}
	/**
	 * 设置 信息修改用户
	 * @param updateuser 信息修改用户
	 */
	public void setUpdateuser(String updateuser) {
		this.updateuser = updateuser;
	}
	/**
	 * 取得 信息修改用户
	 * @return Updateuser
	 */
	public String getUpdateuser() {
		return this.updateuser;
	}
	/**
	 * 设置 信息修改时间
	 * @param updatetime 信息修改时间
	 */
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	/**
	 * 取得 信息修改时间
	 * @return Updatetime
	 */
	public String getUpdatetime() {
		return this.updatetime;
	}
}
