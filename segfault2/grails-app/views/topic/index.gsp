
<%@ page import="segfault2.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-topic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-topic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="topic.tag.label" default="Tag" /></th>
					
						<g:sortableColumn property="titre" title="${message(code: 'topic.titre.label', default: 'Titre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "tag")}</g:link></td>
					
						<td>${fieldValue(bean: topicInstance, field: "titre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topicInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
