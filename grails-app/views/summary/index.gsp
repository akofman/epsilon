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
    <meta name="layout" content="main"/>
    <title>Epsilon</title>
</head>

<body>
<div class="row-fluid">
    <div class="col-sm-12">
        <h1>Vos comptes <small>Résumé de la situation</small>
        <g:if test="${accounts}">
            <span id="mobile-activation" data-toggle="tooltip" data-placement="bottom" title="${person.mobileToken ? "Désactivation" : "Activation"} du client mobile">
                <g:render template="mobile" model="[person: person]"/>
            </span>
        </g:if>
        </h1>
        <hr/>
    </div>

</div>

<div class="col-lg-4 col-md-6 col-sm-12">
    <div class="around-border">
        <div class="alert alert-info">Comptes <span class="pull-right"><g:link controller="account" class="list" action="list"><img
                src="${resource(dir: 'images/skin', file: 'database_table.png')}"/></g:link></span> </div>
        <g:if test="${accounts}">
            <table class="table table-striped">
                <tbody>
                <g:set var="accountAmount" value="${0D}"/>
                <g:each in="${accounts}" status="i" var="account">
                    <tr>
                        <td class="principal">${account.name}</td>
                        <td class="tdright fixedsize"><g:formatNumber number="${account.sold}"
                                                                      format="###,###.##"/> €</td>
                        <td class="tdright fixedsize">
                            <g:link controller="operation" action="list" params="[account: account.id]"
                                    title="Afficher le registre">
                                <img src="${resource(dir: 'img', file: 'operation.png')}"/>
                            </g:link>
                        </td>
                    </tr>

                    <g:set var="accountAmount" value="${accountAmount + account.sold}"/>
                </g:each>
                <g:if test="${accounts}">
                    <tr class="important">
                        <td class="principal">&nbsp;</td>
                        <td class="tdright fixedsize">= <g:formatNumber number="${accountAmount}"
                                                                        format="###,###.##"/> €</td>
                        <td class="tdright fixedsize">&nbsp;</td>
                    </tr>
                </g:if>
                </tbody>
            </table>
        </g:if>
        <g:else>
            <div class="alert alert-warning">
                Il semble que ce soit la première fois que vous accédez à Epsilon.<br/>Avant toute chose, il va falloir créer un "compte". Un compte est obligatoirement
            lié à un "établissement". <br/>Commencez donc par <b>créer un nouvel établissement bancaire</b> (ex: Crédit Agricole). Une fois
            l'établissement enregistré, <b>ajoutez simplement un nouveau compte</b> et commencez à utiliser Epsilon !<br/><br/>

                <ol>
                    <li><g:link controller="bank" action="create"><img
                            src="${resource(dir: 'img', file: 'bank.png')}"
                            alt=">"/> Créer un nouvel établissement</g:link></li>
                    <li><g:link controller="account" action="create"><img
                            src="${resource(dir: 'img', file: 'account.png')}"
                            alt=">"/> Créer un nouveau compte</g:link></li>
                </ol>

            </div>

        </g:else>
    </div>

    <g:if test="${budgets}">
    <hr/>
    <div class="around-border">
        <div class="alert alert-info">Les budgets <span class="pull-right"><g:link controller="budget" class="list" action="list"><img
                src="${resource(dir: 'images/skin', file: 'database_table.png')}"/></g:link></span></div>
        <div class="budgets list">
            <table class="table table-striped">
                <tbody>
                <g:set var="budgetAmount" value="${0D}"/>
                <g:set var="budgetUsedAmount" value="${0D}"/>
                <g:each in="${budgets}" var="budget" status="b">
                    <tr>
                        <td class="principal">${budget.name}</td>

                        <g:set var="currentSold" value="${budget.currentMonthOperationsSum}"/>

                        <g:if test="${currentSold < budget.amount}">
                            <td class="tdright">
                            <span class="label label-success">
                        </g:if>
                        <g:elseif
                                test="${currentSold >= budget.amount - 1 && currentSold <= budget.amount + 1}">
                            <td class="tdright">
                            <span class="label label-warning">
                        </g:elseif>
                        <g:elseif test="${currentSold > budget.amount}">
                            <td class="tdright">
                            <span class="label label-danger">
                        </g:elseif>
                        <g:else>
                            <td class="tdright budget"><span>
                        </g:else>
                        <g:formatNumber number="${currentSold}" format="###,###.##" /> / <g:formatNumber number="${budget.amount}" format="###,###.##" /> €</span></td>
                        <td class="tdright fixedsize">
                            <g:link title="Afficher le registre" controller="budget" action="operations"
                                    params="[budget: budget.id]"><img
                                    src="${resource(dir: 'img', file: 'operation.png')}"/></g:link>
                        </td>
                        <g:set var="budgetAmount" value="${budgetAmount + budget.amount}"/>
                        <g:set var="budgetUsedAmount" value="${budgetUsedAmount + currentSold}"/>
                    </tr>
                </g:each>
                <tr class="important">
                    <td class="principal">&nbsp;</td>
                    <td class="tdright">= <g:formatNumber number="${budgetUsedAmount}"
                                                          format="###,###.##"/> / <g:formatNumber
                            number="${budgetAmount}"
                            format="###,###.##"/> €</td>
                    <td class="tdright fixedsize">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    </g:if>

    <g:if test="${pinnedCat}">
    <hr/>
    <div class="around-border">
        <div class="alert alert-info">Catégories surveillées <span class="pull-right"><g:link controller="category" class="list" action="list"><img
                src="${resource(dir: 'images/skin', file: 'database_table.png')}"/></g:link></span></div>
        <div class="budgets list">
            <table class="table table-striped">
                <tbody>
                <g:set var="pinnedAmount" value="${0D}"/>
                <g:each in="${pinnedCat}" var="cat" status="c">

                    <g:set var="currentSold" value="${cat.currentMonthOperationsSum}"/>

                    <tr>
                        <td class="principal">${cat.name}</td>
                        <td class="tdright">
                            <span class="label label-default">
                                <g:formatNumber number="${currentSold}" format="###,###.##"/> €
                            </span>
                        </td>
                        <td class="tdright fixedsize">
                            <g:link title="Afficher le registre" controller="category" action="operations"
                                    params="[id: cat.id]"><img
                                    src="${resource(dir: 'img', file: 'operation.png')}"/></g:link>
                        </td>
                    </tr>
                    <g:set var="pinnedAmount" value="${pinnedAmount + currentSold}"/>
                </g:each>
                <tr class="important">
                    <td class="principal">&nbsp;</td>
                    <td class="tdright">= <g:formatNumber number="${pinnedAmount}"
                                                          format="###,###.##"/> €</td>
                    <td class="tdright fixedsize">&nbsp;</td>
                </tr>
                </tbody>
                </table>
                </div>
        </div>
    </g:if>

</div>

<g:if test="${lates || today || future}">
<div class="col-lg-4 col-md-6 col-sm-12">


    <div class="around-border">
        <div class="alert alert-info">Les échéances <span class="pull-right"><g:link controller="scheduled" class="list" action="list"><img
                src="${resource(dir: 'images/skin', file: 'database_table.png')}"/></g:link></span> </div>

        <g:if test="${lates}">
            <h6><small>En retard</small></h6>

            <div class="scheduled list">
                <g:render template="scheduledtable"
                          model="[cssClass: 'red', scheduleds: lates, forceActionDisplay: true]"/>
            </div>
        </g:if>

        <g:if test="${today}">
            <small>Paiements du jour</small>

            <div class="scheduled list">
                <div class="alert alert-warning">Les paiements gérés automatiquement sont marqués d'une horloge et n'ont pas besoin
                d'être validés manuellement: le système s'en charge.</div>
                <g:render template="scheduledtable"
                          model="[cssClass: 'green', scheduleds: today, filterAutomatic: false]"/>
            </div>
        </g:if>

        <g:if test="${future}">
            <small>Paiements futurs</small>

            <div class="scheduled list">
                <g:render template="scheduledtable" model="[cssClass: 'blue', scheduleds: future]"/>
            </div>
        </g:if>

    </div>

</div>
</g:if>

<div class="col-lg-4 col-md-12 col-sm-12">

    <g:if test="${graphData || depense || revenu}">
    <div class="around-border">
        <div class="alert alert-info">Statistiques du mois</div>

        <div class="row">

            <div class="counter-shower col-xs-12 col-sm-6">

                <div class="number">
                    <span class="label label-default">
                        <g:formatNumber number="${depense}"
                                        format="###,###.##"/> €
                    </span>
                </div>
                <div class="lbl">
                    Dépenses réelles du mois
                </div>

            </div>

            <div class="counter-shower col-xs-12 col-sm-6">

                <div class="number">
                    <span class="label label-default">
                        <g:formatNumber number="${revenu}"
                                        format="###,###.##"/> €
                    </span>
                </div>
                <div class="lbl">
                    Revenus du mois
                </div>

            </div>

        </div>

        <%
            def dataCol = [['string', 'category'], ['number', 'amount']]
        %>
        <gvisualization:pieCoreChart elementId="piechart"
                                     columns="${dataCol}" data="${graphData}"
                                     pieHole="${0.4}" legend="${[position: 'bottom', alignment: 'center']}"/>
        <div id="piechart"
             style="width: 100%; height: 450px; margin: auto;display: block;background: transparent;"></div>

    </div>
    </g:if>
</div>

</body>
</html>
