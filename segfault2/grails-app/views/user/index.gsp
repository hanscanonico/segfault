
<%@ page import="segfault2.SecUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container bs-docs-container">
			<div id="list-tag" class="content scaffold-list" role="main">
			<h1>All messages</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				
				<div class="list-group">
					<g:each in="${messages}" status="i" var="mess">
					
							<g:link class="list-group-item" controller="UserMessage" action="show" id="${mess.id}">${mess.texte}</g:link>
					</g:each>
				</div>
				<div class="pagination">
					<g:paginate total="${tagInstanceCount ?: 0}" />
				</div>
			</div>
			
		</div>
	</body>
</html>
