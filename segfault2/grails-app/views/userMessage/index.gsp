
<%@ page import="segfault2.UserMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userMessage.label', default: 'UserMessage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userMessage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="texte" title="${message(code: 'userMessage.texte.label', default: 'Texte')}" />
					
						<th><g:message code="userMessage.mess.label" default="Mess" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'userMessage.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="nbMoins" title="${message(code: 'userMessage.nbMoins.label', default: 'Nb Moins')}" />
					
						<g:sortableColumn property="nbPlus" title="${message(code: 'userMessage.nbPlus.label', default: 'Nb Plus')}" />
					
						<th><g:message code="userMessage.topic.label" default="Topic" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userMessageInstanceList}" status="i" var="userMessageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userMessageInstance.id}">${fieldValue(bean: userMessageInstance, field: "texte")}</g:link></td>
					
						<td>${fieldValue(bean: userMessageInstance, field: "mess")}</td>
					
						<td><g:formatDate date="${userMessageInstance.date}" /></td>
					
						<td>${fieldValue(bean: userMessageInstance, field: "nbMoins")}</td>
					
						<td>${fieldValue(bean: userMessageInstance, field: "nbPlus")}</td>
					
						<td>${fieldValue(bean: userMessageInstance, field: "topic")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userMessageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
