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
<%@ page import="com.headbangers.epsilon.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="popup" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="undernav">
          <span class="menuButton"><g:link class="list" action="index">Liste des utilisateurs</g:link></span>
          <span class="menuButton"><g:link class="create" action="createuser">Nouvel utilisateur</g:link></span>
        </div>
        <div class="body">
            <h1>Détails d'un utilisateur</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.id.label" default="Id" /></td>

                            <td valign="top" class="value">${fieldValue(bean: person, field: "id")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.email.label" default="Email" /></td>

                            <td valign="top" class="value">${fieldValue(bean: person, field: "email")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.username.label" default="Username" /></td>

                            <td valign="top" class="value">${fieldValue(bean: person, field: "username")}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.userRealName.label" default="UserRealName" /></td>

                            <td valign="top" class="value">${fieldValue(bean: person, field: "userRealName")}</td>

                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${person?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edituser" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="deleteuser" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>