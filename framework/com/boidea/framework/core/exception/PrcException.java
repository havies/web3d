package com.boidea.framework.core.exception;

import com.boidea.framework.util.BFConstants;

/**
 * 调用存储过程异常
 * 
 * @author zhaozh
 * @since 2011-01-24
 */
public class PrcException extends RuntimeException {

	private String appCode;
	private String errorMsg;
	private String prcName;

	public PrcException(String prcName, String errorMsg) {
		super(BFConstants.Exception_Head + "调用存储过程[" + prcName
				+ "]发生错误,错误原因：[" + errorMsg + "]");
		setErrorMsg(errorMsg);
	}

	public PrcException(String prcName, String appCode, String errorMsg) {
		super(BFConstants.Exception_Head + "调用存储过程[" + prcName
				+ "]发生错误,错误编码为：[" + appCode + "] 错误原因：[" + errorMsg + "]");
		setAppCode(appCode);
		setPrcName(prcName);
		setErrorMsg(errorMsg);
	}

	public String getAppCode() {
		return appCode;
	}

	public void setAppCode(String appCode) {
		this.appCode = appCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getPrcName() {
		return prcName;
	}

	public void setPrcName(String prcName) {
		this.prcName = prcName;
	}

}
