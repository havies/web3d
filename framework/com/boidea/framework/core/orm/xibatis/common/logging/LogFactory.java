package com.boidea.framework.core.orm.xibatis.common.logging;

import java.lang.reflect.Constructor;

import com.boidea.framework.core.orm.xibatis.common.resources.Resources;

public class LogFactory {

	private static Constructor logConstructor;

	static {
		tryImplementation("org.apache.commons.logging.LogFactory",
				"com.boidea.framework.core.orm.xibatis.common.logging.jakarta.JakartaCommonsLoggingImpl");
		tryImplementation("org.apache.lobfj.Logger", "com.boidea.framework.core.orm.xibatis.common.logging.lobfj.LobfjImpl");
		tryImplementation("java.util.logging.Logger",
				"com.boidea.framework.core.orm.xibatis.common.logging.jdk14.Jdk14LoggingImpl");
		tryImplementation("java.lang.Object", "com.boidea.framework.core.orm.xibatis.common.logging.nologging.NoLoggingImpl");
	}

	private static void tryImplementation(String testClassName, String implClassName) {
		if (logConstructor == null) {
			try {
				Resources.classForName(testClassName);
				Class implClass = Resources.classForName(implClassName);
				logConstructor = implClass.getConstructor(new Class[] { Class.class });
			} catch (Throwable t) {
			}
		}
	}

	public static Log getLog(Class aClass) {
		try {
			return (Log) logConstructor.newInstance(new Object[] { aClass });
		} catch (Throwable t) {
			throw new RuntimeException("Error creating logger for class " + aClass + ".  Cause: " + t, t);
		}
	}

	/**
	 * This method will switch the logging implementation to LobfJ if LobfJ is
	 * available on the classpath. This is useful in situations where you want
	 * to use LobfJ to log iBATIS activity but commons logging is on the
	 * classpath. Note that this method is only effective for log classes
	 * obtained after calling this method. If you intend to use this method you
	 * should call it before calling any other iBATIS method.
	 * 
	 */
	public static synchronized void selectLobfJLogging() {
		try {
			Resources.classForName("org.apache.lobfj.Logger");
			Class implClass = Resources.classForName("com.boidea.framework.core.orm.xibatis.common.logging.lobfj.LobfjImpl");
			logConstructor = implClass.getConstructor(new Class[] { Class.class });
		} catch (Throwable t) {
		}
	}

	/**
	 * This method will switch the logging implementation to Java native logging
	 * if you are running in JRE 1.4 or above. This is useful in situations
	 * where you want to use Java native logging to log iBATIS activity but
	 * commons logging or LobfJ is on the classpath. Note that this method is
	 * only effective for log classes obtained after calling this method. If you
	 * intend to use this method you should call it before calling any other
	 * iBATIS method.
	 */
	public static synchronized void selectJavaLogging() {
		try {
			Resources.classForName("java.util.logging.Logger");
			Class implClass = Resources
					.classForName("com.boidea.framework.core.orm.xibatis.common.logging.jdk14.Jdk14LoggingImpl");
			logConstructor = implClass.getConstructor(new Class[] { Class.class });
		} catch (Throwable t) {
		}
	}
}
