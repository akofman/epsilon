<!-- 
/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */
-->
<%@ page import="com.headbangers.epsilon.Tiers" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="popup"/>
</head>

<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">Détails d'un tiers</h4>
</div>

<div class="modal-body">
    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

    <dl class="dl-horizontal">
        <dt><g:message code="tiers.id.label" default="ID"/></dt>
        <dd>${fieldValue(bean: tiersInstance, field: "id")}</dd>

        <dt><g:message code="tiers.name.label" default="Name"/></dt>
        <dd>${fieldValue(bean: tiersInstance, field: "name")}</dd>

        <dt><g:message code="tiers.description.label" default="Description"/></dt>
        <dd>${fieldValue(bean: tiersInstance, field: "description")}&nbsp;</dd>

        <dt><g:message code="tiers.dateCreated.label" default="Date Created"/></dt>
        <dd><g:formatDate date="${tiersInstance?.dateCreated}"/></dd>

        <dt><g:message code="tiers.lastUpdated.label" default="Last Updated"/></dt>
        <dd><g:formatDate date="${tiersInstance?.lastUpdated}"/>&nbsp;</dd>
    </dl>
</div>

<div class="modal-footer">
    <g:form>
        <g:hiddenField name="id" value="${tiersInstance?.id}"/>
        <g:link action="operations" id="${tiersInstance.id}" class="btn btn-default"><img
                src="${resource(dir: 'img', file: 'operation.png')}"/> Voir les opérations pour ce tiers</g:link>

        <g:actionSubmit class="edit btn btn-primary" action="edit"
                        value="${message(code: 'default.button.edit.label', default: 'Edit')}"/>
        <g:actionSubmit class="delete btn btn-danger" action="delete"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    </g:form>
</div>
</body>
</html>
