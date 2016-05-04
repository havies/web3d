package com.boidea.framework.core.mvc.xstruts.chain.commands.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.mvc.xstruts.chain.commands.AbstractExceptionHandler;
import com.boidea.framework.core.mvc.xstruts.chain.commands.util.ClassUtils;
import com.boidea.framework.core.mvc.xstruts.chain.contexts.ActionContext;
import com.boidea.framework.core.mvc.xstruts.chain.contexts.ServletActionContext;
import com.boidea.framework.core.mvc.xstruts.config.ActionConfig;
import com.boidea.framework.core.mvc.xstruts.config.ExceptionConfig;
import com.boidea.framework.core.mvc.xstruts.config.ForwardConfig;
import com.boidea.framework.core.mvc.xstruts.config.ModuleConfig;

/**
 * <p>
 * Handle the specified exception.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-05-07 12:11:38 -0400 (Sat, 07 May 2005) $
 */
public class ExceptionHandler extends AbstractExceptionHandler {
	// ------------------------------------------------------ Instance Variables
	private static final Log log = LogFactory.getLog(ExceptionHandler.class);

	// ------------------------------------------------------- Protected Methods
	protected ForwardConfig handle(ActionContext context, Exception exception, ExceptionConfig exceptionConfig,
			ActionConfig actionConfig, ModuleConfig moduleConfig) throws Exception {
		// Look up the remaining properties needed for this handler
		ServletActionContext sacontext = (ServletActionContext) context;
		ActionForm actionForm = (ActionForm) sacontext.getActionForm();
		HttpServletRequest request = sacontext.getRequest();
		HttpServletResponse response = sacontext.getResponse();

		// Handle this exception
		com.boidea.framework.core.mvc.xstruts.action.ExceptionHandler handler = (com.boidea.framework.core.mvc.xstruts.action.ExceptionHandler) ClassUtils
				.getApplicationInstance(exceptionConfig.getHandler());

		return (handler
				.execute(exception, exceptionConfig, (ActionMapping) actionConfig, actionForm, request, response));
	}
}
