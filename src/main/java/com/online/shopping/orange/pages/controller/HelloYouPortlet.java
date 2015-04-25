package com.online.shopping.orange.pages.controller;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletMode;
import javax.portlet.PortletPreferences;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class HelloYouPortlet extends GenericPortlet {
	protected String editJSP;
	protected String viewJSP;
	private static Log _log = LogFactory.getLog(HelloYouPortlet.class);

	@Override
	public void init() throws PortletException {
		this.editJSP = this.getInitParameter("edit-jsp");
		this.viewJSP = this.getInitParameter("view-jsp");
	}

	@Override
	public void doEdit(RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {
		renderResponse.setContentType("text/html");
		PortletURL addNameURL = renderResponse.createActionURL();
		addNameURL.setParameter("addName", "addNameValue");
		renderRequest.setAttribute("addNameURL", addNameURL.toString());
		this.include(this.editJSP, renderRequest, renderResponse);
	}

	@Override
	public void doView(RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {
		PortletPreferences prefs = renderRequest.getPreferences();
		String username = prefs.getValue("name", "no");
		if (username.equalsIgnoreCase("no")) {
			username = "";
		}
		renderRequest.setAttribute("userName", username);
		this.include(this.viewJSP, renderRequest, renderResponse);
	}

	@Override
	public void processAction(ActionRequest actionRequest,
			ActionResponse actionResponse) throws IOException, PortletException {
		String addName = actionRequest.getParameter("addName");
		if (addName != null) {
			PortletPreferences prefs = actionRequest.getPreferences();
			prefs.setValue("name", actionRequest.getParameter("username"));
			prefs.store();
			actionResponse.setPortletMode(PortletMode.VIEW);
		}
	}

	protected void include(String path, RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {
		PortletRequestDispatcher portletRequestDispatcher = this.getPortletContext()
				.getRequestDispatcher(path);
		if (portletRequestDispatcher == null) {
			_log.error(path + " is not a valid include");
		} else {
			portletRequestDispatcher.include(renderRequest, renderResponse);
		}
	}
}
