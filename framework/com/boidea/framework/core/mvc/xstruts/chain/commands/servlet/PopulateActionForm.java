package com.boidea.framework.core.mvc.xstruts.chain.commands.servlet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.boidea.framework.core.mvc.xstruts.Globals;
import com.boidea.framework.core.mvc.xstruts.action.ActionForm;
import com.boidea.framework.core.mvc.xstruts.action.ActionMapping;
import com.boidea.framework.core.mvc.xstruts.chain.commands.AbstractPopulateActionForm;
import com.boidea.framework.core.mvc.xstruts.chain.contexts.ActionContext;
import com.boidea.framework.core.mvc.xstruts.chain.contexts.ServletActionContext;
import com.boidea.framework.core.mvc.xstruts.config.ActionConfig;
import com.boidea.framework.core.mvc.xstruts.util.RequestUtils;

/**
 * <p>
 * Populate the form bean (if any) for this request. Sets the multipart class
 * from the action config in the request attributes.
 * </p>
 * 
 * @version $Rev: 421119 $ $Date: 2005-11-12 13:01:44 -0500 (Sat, 12 Nov 2005) $
 */
public class PopulateActionForm extends AbstractPopulateActionForm {
	private static final Log log = LogFactory.getLog(PopulateActionForm.class);

	// ------------------------------------------------------- Protected Methods
	protected void populate(ActionContext context, ActionConfig actionConfig, ActionForm actionForm) throws Exception {
		ServletActionContext saContext = (ServletActionContext) context;

		RequestUtils.populate(actionForm, actionConfig.getPrefix(), actionConfig.getSuffix(), saContext.getRequest());
	}

	protected void reset(ActionContext context, ActionConfig actionConfig, ActionForm actionForm) {
		ServletActionContext saContext = (ServletActionContext) context;

		actionForm.reset((ActionMapping) actionConfig, saContext.getRequest());

		// Set the multipart class
		if (actionConfig.getMultipartClass() != null) {
			saContext.getRequestScope().put(Globals.MULTIPART_KEY, actionConfig.getMultipartClass());
		}
	}
}
