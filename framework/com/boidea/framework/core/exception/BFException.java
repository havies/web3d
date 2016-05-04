package com.boidea.framework.core.exception;

import com.boidea.framework.util.BFConstants;

/**
 * BF公共异常类<br>
 * 
 * @author zhaozh
 * @since 2011-04-27
 */
public class BFException extends RuntimeException {

	public BFException() {
		super();
	}

	public BFException(String msg) {
		super(BFConstants.Exception_Head + msg);
	}
}
