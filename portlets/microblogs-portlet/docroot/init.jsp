<%--
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%@ page import="com.liferay.microblogs.model.MicroblogsEntry" %>
<%@ page import="com.liferay.microblogs.service.MicroblogsEntryServiceUtil" %>
<%@ page import="com.liferay.microblogs.service.MicroblogsEntryLocalServiceUtil" %>
<%@ page import="com.liferay.microblogs.service.permission.MicroblogsEntryPermission" %>
<%@ page import="com.liferay.microblogs.service.permission.MicroblogsPermission" %>
<%@ page import="com.liferay.microblogs.model.MicroblogsEntryConstants" %>
<%@ page import="com.liferay.microblogs.util.WebKeys" %>
<%@ page import="com.liferay.portal.kernel.dao.orm.QueryUtil" %>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchContainer" %>
<%@ page import="com.liferay.portal.kernel.language.LanguageUtil" %>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.DateUtil" %>
<%@ page import="com.liferay.portal.kernel.util.FastDateFormatFactoryUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ListUtil" %>
<%@ page import="com.liferay.portal.kernel.util.StringPool" %>
<%@ page import="com.liferay.portal.kernel.util.Validator" %>
<%@ page import="com.liferay.portal.model.Group" %>
<%@ page import="com.liferay.portal.model.User" %>
<%@ page import="com.liferay.portal.NoSuchModelException" %>
<%@ page import="com.liferay.portal.NoSuchUserException" %>
<%@ page import="com.liferay.portal.security.permission.ActionKeys" %>
<%@ page import="com.liferay.portal.service.UserLocalServiceUtil" %>
<%@ page import="com.liferay.portal.util.comparator.UserLoginDateComparator" %>
<%@ page import="com.liferay.portal.util.PortalUtil" %>
<%@ page import="com.liferay.portlet.social.model.SocialRelationConstants" %>
<%@ page import="com.liferay.portlet.social.service.SocialRelationLocalServiceUtil" %>

<%@ page import="java.text.Format" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page import="java.util.regex.Pattern" %>

<%@ page import="javax.portlet.ActionRequest" %>
<%@ page import="javax.portlet.PortletURL" %>
<%@ page import="javax.portlet.WindowState" %>

<portlet:defineObjects />

<liferay-theme:defineObjects />

<%
long companyId = themeDisplay.getCompanyId();

Format dateFormatDateTime = FastDateFormatFactoryUtil.getDateTime(locale, timeZone);

String currentURL = PortalUtil.getCurrentURL(request);

int delta = 10;
%>