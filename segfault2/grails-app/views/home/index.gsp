
<%@ page import="segfault2.Topic" %>
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
			<h1>Last Topics</h1><%--
				<h1><g:message code="default.list.label" args="[entityName]" />--%></h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				
				<div class="list-group">
					<g:each in="${topics}" status="i" var="topic">
					
							<g:link class="list-group-item" controller="topic" action="show" id="${topic.id}">${topic.titre}</g:link>
					</g:each>
				</div>
				<div class="pagination">
					<g:paginate total="${tagInstanceCount ?: 0}" />
				</div>
				<g:link  class="btn btn-primary" action="create">New Topic</g:link>
			</div>
			
		</div>
	</body>
</html>
