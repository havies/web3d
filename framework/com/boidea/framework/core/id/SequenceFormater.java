package com.boidea.framework.core.id;

/**
 * SequenceFormater
 * 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author zhaozh
 * @since 2010-03-17
 */
public interface SequenceFormater {
	public String format(long pSequence) throws FormatSequenceExcepiton;
}
