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
<%@ page import="com.headbangers.epsilon.Wish" %>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'wish.label', default: 'Wish')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="span12">
            <div>
                <h1>Liste des futurs achats <small>Ce que vous désirez !</small> <g:link controller="wish" action="create" class="btn"><img
                        src="${resource(dir: 'img', file: 'gift.png')}"
                        alt=">"/> Créer un nouveau souhait</g:link></h1>

                <div class="alert alert-info">
                    Voici la liste de vos futurs achats. Saisissez vos projets : Epsilon se charge de vous dire si toutes vos
                    envies rentrent dans votre budget !
                </div>

                <hr/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span12">
            <div class="around-border">

                <g:if test="${flash.message}">
                    <div class="alert alert-info">${flash.message}</div>
                </g:if>

                <table class="table table-striped table-hover">
                    <thead>
                    <tr>

                        <g:sortableColumn property="name" title="${message(code: 'wish.name.label', default: 'Name')}"/>

                        <g:sortableColumn property="description"
                                          title="${message(code: 'wish.description.label', default: 'Description')}"/>

                        <g:sortableColumn property="webShopUrl"
                                          title="${message(code: 'wish.webShopUrl.label', default: 'Web Shop Url')}"/>

                        <g:sortableColumn property="price" title="${message(code: 'wish.price.label', default: 'Price')}"/>

                        <g:sortableColumn property="previsionBuy"
                                          title="${message(code: 'wish.previsionBuy.label', default: 'Prevision Buy')}"/>

                        <g:sortableColumn property="boughtDate"
                                          title="${message(code: 'wish.boughtDate.label', default: 'Bought Date')}"/>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${wishInstanceList}" status="i" var="wishInstance">
                        <tr>

                            <td>${fieldValue(bean: wishInstance, field: "name")}</td>

                            <td>${fieldValue(bean: wishInstance, field: "description")}</td>
                            <td>
                                <g:if test="${wishInstance.webShopUrl}">
                                    <a href="${wishInstance.webShopUrl}" target="_blank">${wishInstance.webShopUrl}</a>
                                </g:if>
                            </td>

                            <td>${fieldValue(bean: wishInstance, field: "price")} €</td>

                            <td><g:formatDate date="${wishInstance.previsionBuy}"/></td>

                            <td><g:formatDate date="${wishInstance.boughtDate}"/></td>
                            <td class="tdcenter">
                                <g:link title="Afficher les détails" action="show" id="${wishInstance.id}" data-toggle="modal" data-target="#modalWindow_show"><img src="${resource(dir: 'img', file: 'details.png')}"
                                                         alt="Détails"/></g:link>
                                <g:link title="Editer" action="edit" id="${wishInstance.id}"><img
                                        src="${resource(dir: 'img', file: 'edit.png')}" alt="Editer"/></g:link>
                                <g:link title="Acheter!" action="create_operation" id="${wishInstance.id}"><img
                                        src="${resource(dir: 'img', file: 'buy.png')}" alt="Acheter!"/></g:link>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>

                <div class="pagination text-right">
                    <g:paginate total="${wishInstanceTotal}"/>
                </div>

            </div>
        </div>
    </div>

</div>

<div id="modalWindow_show" class="modal hide fade">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>

        <h3>Détails d'un souhait</h3>
    </div>

    <div class="modal-body">
        <img src="${resource(dir: 'images', file: 'spinner.gif')}"/>
    </div>
</div>

</body>
</html>
