/**
 * Boidea's Management Information System Platform
 * CopyRight 2013
 */

package com.boidea.app.common.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * 日历事件管理
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since 2014-06-10
 */
public class GyCalendarEventVo extends BaseVo {

	private String caleventid;
	/*日历事件标题*/
	private String eventtitle;
	/*全天事件*/
	private String isallday;
	/*事件开始时间*/
	private String whenbegin;
	/*事件结束时间*/
	private String whenend;
	/*事件类型（工作|学习|娱乐|生活）*/
	private String eventtype;
	/*提醒方式*/
	private String reminder;
	/*备注信息*/
	private String notes;
	/*地点*/
	private String location;
	/*Web链接*/
	private String weblink;
	/*事件属主（public|private）*/
	private String eventowner;
	/*事件对应的gy_param里的key*/
	private String eventparamkey;
	/*私有事件的用户名*/
	private String owneruserid;
	private String scrq;
	
	/**
	 * 构造函数
	 */
	public GyCalendarEventVo() {
	}
	
	/**
	 * 设置 
	 * @param caleventid 
	 */
	public void setCaleventid(String caleventid) {
		this.caleventid = caleventid;
	}
	/**
	 * 取得 
	 * @return Caleventid
	 */
	public String getCaleventid() {
		return this.caleventid;
	}
	/**
	 * 设置 日历事件标题
	 * @param eventtitle 日历事件标题
	 */
	public void setEventtitle(String eventtitle) {
		this.eventtitle = eventtitle;
	}
	/**
	 * 取得 日历事件标题
	 * @return Eventtitle
	 */
	public String getEventtitle() {
		return this.eventtitle;
	}
	/**
	 * 设置 全天事件
	 * @param isallday 全天事件
	 */
	public void setIsallday(String isallday) {
		this.isallday = isallday;
	}
	/**
	 * 取得 全天事件
	 * @return Isallday
	 */
	public String getIsallday() {
		return this.isallday;
	}
	/**
	 * 设置 事件开始时间
	 * @param whenbegin 事件开始时间
	 */
	public void setWhenbegin(String whenbegin) {
		this.whenbegin = whenbegin;
	}
	/**
	 * 取得 事件开始时间
	 * @return Whenbegin
	 */
	public String getWhenbegin() {
		return this.whenbegin;
	}
	/**
	 * 设置 事件结束时间
	 * @param whenend 事件结束时间
	 */
	public void setWhenend(String whenend) {
		this.whenend = whenend;
	}
	/**
	 * 取得 事件结束时间
	 * @return Whenend
	 */
	public String getWhenend() {
		return this.whenend;
	}
	/**
	 * 设置 事件类型（工作|学习|娱乐|生活）
	 * @param eventtype 事件类型（工作|学习|娱乐|生活）
	 */
	public void setEventtype(String eventtype) {
		this.eventtype = eventtype;
	}
	/**
	 * 取得 事件类型（工作|学习|娱乐|生活）
	 * @return Eventtype
	 */
	public String getEventtype() {
		return this.eventtype;
	}
	/**
	 * 设置 提醒方式
	 * @param reminder 提醒方式
	 */
	public void setReminder(String reminder) {
		this.reminder = reminder;
	}
	/**
	 * 取得 提醒方式
	 * @return Reminder
	 */
	public String getReminder() {
		return this.reminder;
	}
	/**
	 * 设置 备注信息
	 * @param notes 备注信息
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}
	/**
	 * 取得 备注信息
	 * @return Notes
	 */
	public String getNotes() {
		return this.notes;
	}
	/**
	 * 设置 地点
	 * @param location 地点
	 */
	public void setLocation(String location) {
		this.location = location;
	}
	/**
	 * 取得 地点
	 * @return Location
	 */
	public String getLocation() {
		return this.location;
	}
	/**
	 * 设置 Web链接
	 * @param weblink Web链接
	 */
	public void setWeblink(String weblink) {
		this.weblink = weblink;
	}
	/**
	 * 取得 Web链接
	 * @return Weblink
	 */
	public String getWeblink() {
		return this.weblink;
	}
	/**
	 * 设置 事件属主（public|private）
	 * @param eventowner 事件属主（public|private）
	 */
	public void setEventowner(String eventowner) {
		this.eventowner = eventowner;
	}
	/**
	 * 取得 事件属主（public|private）
	 * @return Eventowner
	 */
	public String getEventowner() {
		return this.eventowner;
	}
	/**
	 * 设置 事件对应的gy_param里的key
	 * @param eventparamkey 事件对应的gy_param里的key
	 */
	public void setEventparamkey(String eventparamkey) {
		this.eventparamkey = eventparamkey;
	}
	/**
	 * 取得 事件对应的gy_param里的key
	 * @return Eventparamkey
	 */
	public String getEventparamkey() {
		return this.eventparamkey;
	}
	/**
	 * 设置 私有事件的用户名
	 * @param owneruserid 私有事件的用户名
	 */
	public void setOwneruserid(String owneruserid) {
		this.owneruserid = owneruserid;
	}
	/**
	 * 取得 私有事件的用户名
	 * @return Owneruserid
	 */
	public String getOwneruserid() {
		return this.owneruserid;
	}
	/**
	 * 设置 
	 * @param scrq 
	 */
	public void setScrq(String scrq) {
		this.scrq = scrq;
	}
	/**
	 * 取得 
	 * @return Scrq
	 */
	public String getScrq() {
		return this.scrq;
	}
}
